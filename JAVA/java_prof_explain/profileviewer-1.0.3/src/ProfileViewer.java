/**
 *   ProfileViewer - graphically displays java.prof output
 *   Copyright (C) 1999  Greg White
 *
 *   Copyright (C) 1999-2009  Ulf Dittmer
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import java.util.Iterator;		// must be imported explicitly, because of jregex.Iterator
import java.util.List;			// must be imported explicitly, because of java.awt.List
import javax.swing.*;
import javax.swing.event.*;

public class ProfileViewer extends JFrame {

	public static final String VERSION = "1.0.3";	// this is displayed in the About dialog
	private final static String default_props_file = "Profileviewer.properties";

	private static int maxWindow = 0;		// so each window can have its own unique title
	private static int openWindows = 0;		// so we can quit the VM when the last window is closed
	static Vector windows = new Vector();	// list of all open PV windows
	static Properties props;

	final static String OS = System.getProperty("os.name");
	final static boolean isMac = (OS.indexOf("Mac") != -1);
	final static boolean isWin = (OS.indexOf("Win") != -1);

	private static final String methodTextAbs = "Time       #Calls total    Methods";
	private static final String methodTextRel = "%TimeOfPrg  %CallsOfPrg    Methods";
	private static final String calleesTextAbs = "Time    #Calls total    Callees";
	private static final String calleesTextRel = "%TimeOfMethod (ofPrg) %CallsOfPrg     Callees";
	private static final String callersTextAbs = "TimeOfPrg  #Calls total    Callers";
	private static final String callersTextRel = "%TimeOfPrg  %CallsOfPrg    Callers";
	JLabel methodText, calleesText, callersText;

	JList allMethods, calleesList, callersList;
	JScrollPane allSP, calleesSP, callersSP;
	JLabel fullName;
	static AboutDialog ad = null;
	HelpDialog hd = null;
	LicenseDialog ld = null;
	Profile profile;
	List callees, callers;
	MethodComparator methodCmp;
	InvocationComparator calleeCmp, callerCmp;
	Method selectedMethod;
	String target, currentDir = null;
	boolean targetIsRegexp;
	List excludeList = new ArrayList();
	BitSet isRegExp = new BitSet();
	JCheckBoxMenuItem awtFD_switch, decode_switch, browser_switch;
	ProfileParser parser = null;

	// these can be set to whatever value is desired - it will be picked up when the menu is created
	boolean showNumbersPercent, includeCalleeTimes, excludeRecursiveCalls, addSelfToCallees,
			decodeMethodNames, showMethodParameters, percentages100;
	static boolean useAWTFileDialog, useBrowserForHelp;

	static {
			// look for and read properties file
		String props_file = null;
		props = new Properties();
		try {
			// the properties file can be either on the current
			// directory or specified itself by a single property
			// (which of course should be initialized directly in the JVM)
			props_file = System.getProperty("ProfileViewer.propertiesFile");
			if (props_file == null)
				props_file = default_props_file;
			props.load(new FileInputStream(props_file));
			System.out.println("Properties file " + props_file + " read");
		} catch (Exception ex) {
			System.out.println("Properties file " + props_file + " not read");
		}
		useAWTFileDialog = "true".equals(props.getProperty("ProfileViewer.useAWTFileDialog", "false"));
		useBrowserForHelp = "true".equals(props.getProperty("ProfileViewer.useBrowserForHelp", "false"));
	}

	public static void main (String args[]) { new ProfileViewer(args); }

	public ProfileViewer (String args[]) {
		super();

		showNumbersPercent = "true".equals(props.getProperty("ProfileViewer.showNumbersPercent", "true"));
		includeCalleeTimes = "true".equals(props.getProperty("ProfileViewer.includeCalleeTimes", "true"));
		decodeMethodNames = "true".equals(props.getProperty("ProfileViewer.decodeMethodNames", "true"));
		showMethodParameters = "true".equals(props.getProperty("ProfileViewer.showMethodParameters", "true"));
		percentages100 = "true".equals(props.getProperty("ProfileViewer.percentagesAddTo100", "false"));
		excludeRecursiveCalls = "true".equals(props.getProperty("ProfileViewer.excludeRecursiveCalls", "false"));
		addSelfToCallees = "true".equals(props.getProperty("ProfileViewer.addSelfToCallees", "false"));
		String str = props.getProperty("ProfileViewer.methodsToExclude");
			// initialize list of methods to exclude
		if (str != null) {
			StringTokenizer st = new StringTokenizer(str, ",");
			while (st.hasMoreTokens())
				excludeList.add(st.nextToken());
		}

		methodCmp = new MethodComparator(MethodComparator.byTime, false, includeCalleeTimes);
		calleeCmp = new InvocationComparator(InvocationComparator.byTime, false);
		callerCmp = new InvocationComparator(InvocationComparator.byTime, false);
		target = new String("");
		targetIsRegexp = false;

		Font labelFont = new Font("SansSerif", Font.BOLD, 10);

		JSplitPane pane1 = new JSplitPane(JSplitPane.VERTICAL_SPLIT);
		pane1.setDividerLocation((double) 0.6);
// I can't get setDividerLocation to work properly in either of its forms. That's a known Swing 1.1.1 bug.
		calleesList = new JList();
		calleesSP = new JScrollPane(calleesList);
		JPanel rightTop = new JPanel();
		rightTop.setLayout(new BoxLayout(rightTop, BoxLayout.Y_AXIS));
		calleesText = new JLabel(showNumbersPercent ? calleesTextRel : calleesTextAbs);
		calleesText.setAlignmentX(LEFT_ALIGNMENT);
		calleesText.setForeground(Color.black);
		calleesText.setFont(labelFont);
		rightTop.add(calleesText);
		rightTop.add(calleesSP);
		pane1.setTopComponent(rightTop);

		callersList = new JList();
		callersSP = new JScrollPane(callersList);
		JPanel rightBot = new JPanel();
		rightBot.setLayout(new BoxLayout(rightBot, BoxLayout.Y_AXIS));
		callersText = new JLabel(showNumbersPercent ? callersTextRel : callersTextAbs);
		callersText.setAlignmentX(LEFT_ALIGNMENT);
		callersText.setForeground(Color.black);
		callersText.setFont(labelFont);
		rightBot.add(callersText);
		rightBot.add(callersSP);
		pane1.setBottomComponent(rightBot);

		JSplitPane pane2 = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
		pane2.setDividerLocation((double) 0.5);
		allMethods = new JList();
		// allMethods.addMouseListener(new MyMouseListener());
		allSP = new JScrollPane(allMethods);
		JPanel left = new JPanel();
		left.setLayout(new BoxLayout(left, BoxLayout.Y_AXIS));
		methodText = new JLabel(showNumbersPercent ? methodTextRel : methodTextAbs);
		methodText.setAlignmentX(LEFT_ALIGNMENT);
		methodText.setForeground(Color.black);
		methodText.setFont(labelFont);
		left.add(methodText);
		left.add(allSP);
		pane2.setLeftComponent(left);
		pane2.setRightComponent(pane1);

		fullName = new JLabel("");
		fullName.setAlignmentX(LEFT_ALIGNMENT);
		fullName.setForeground(Color.black);

		getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
		getContentPane().add(pane2);
		getContentPane().add(fullName);

		calleesList.addMouseListener(new MouseAdapter() {
			public void mouseClicked (MouseEvent e) {
				if (e.getClickCount() == 2) {
					int index = calleesList.locationToIndex(e.getPoint());
					if (index != -1) {
						List invSeq = getCallees();
						// list is 1 longer than array
						if (index < invSeq.size()) {
							Method m = ((Invocation) invSeq.get(index)).callee;
							int idx = getListIndexFromMethod(allMethods, m);
							if (idx != -1) {
							setSelectedIndex(idx);
							refreshRelatives(idx);
							calleesList.setSelectedIndex(0);
							}
						}
					}
				}
			}
		});
		callersList.addMouseListener(new MouseAdapter() {
			public void mouseClicked (MouseEvent e) {
				if (e.getClickCount() == 2) {
					int index = callersList.locationToIndex(e.getPoint());
					if (index != -1) {
						List invSeq = getCallers();
						Method m = ((Invocation) invSeq.get(index)).caller;
						int idx = getListIndexFromMethod(allMethods, m);
						if (idx != -1) {
							setSelectedIndex(idx);
							refreshRelatives(idx);
							callersList.setSelectedIndex(0);
						}
					}
				}
			}
		});
		allMethods.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged (ListSelectionEvent e) {
				refreshRelatives(allMethods.getSelectedIndex());
			}
		});

		setJMenuBar(createMenu());
		Font font = new Font("Courier", 0, 12);
		allMethods.setFont(font);
		calleesList.setFont(font);
		callersList.setFont(font);
		profile = new Profile("true".equals(props.getProperty("ProfileViewer.excludeRecursiveCalls", "false")));
		maxWindow++;
		openWindows++;
		if ((args != null) && (args.length > 0)) {
			loadProfile(args[0]);
		} else {
			setTitle("Profile Viewer " + maxWindow);
		}
		addWindowListener(new WindowAdapter() {
			public void windowClosed (WindowEvent evt) {
				openWindows--;
				if (openWindows == 0) System.exit(0);
			}
		});
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		pack();
		setSize(1000, 800);
		Point loc = getLocation();
		loc.move(30*maxWindow, 30*maxWindow);
		setLocation(loc);
		setVisible(true);
		windows.addElement(this);
	}

		// returns position in 'list' that 'method' occupies;
		// needed because methods may have been excluded, so screen
		// position isn't necessarily equal to position in one of the ArrayLists 
	int getListIndexFromMethod (JList list, Method method) {
		if (method != null) {
			String methodName = method.getName(decodeMethodNames, showMethodParameters);
			ListModel lm = list.getModel();
			for (int i=lm.getSize()-1; i>=0; i--) {
				String item = (String) lm.getElementAt(i);
				if (item.endsWith(methodName))
					return i;
			}
		}
		return -1;
	}

	public void sortMethods (ESortHow esorthow, boolean flag) {
		if (esorthow != null) {
			MethodComparator mc = MethodComparator.fromSortHow(esorthow);
			methodCmp = new MethodComparator(mc, flag, includeCalleeTimes);
		}
		Collections.sort(profile.getMethods(), methodCmp);
		refresh(-1, false);
		// restore selection if there was one
		int idx = getListIndexFromMethod(allMethods, selectedMethod);
		if (idx != -1)
			setSelectedIndex(idx);
	}

	public void setCalleeSort (ESortHow esorthow, boolean flag) {
		InvocationComparator ic = InvocationComparator.byCallee;
		if (esorthow == ESortHow.TIME)
			ic = InvocationComparator.byTime;
		else if (esorthow == ESortHow.CALLS)
			ic = InvocationComparator.byCalls;
		Invocation invocation = null;
		int i = calleesList.getSelectedIndex();
		if (i != -1)
			invocation = (Invocation) callees.get(i);
		calleeCmp = new InvocationComparator(ic, flag);
		refreshCallees();
		if (invocation != null) {
			int j = callees.indexOf(invocation);
			calleesList.setSelectedIndex(j);
		}
	}

	public void setCallerSort (ESortHow esorthow, boolean flag) {
		InvocationComparator ic = InvocationComparator.byCaller;
		if (esorthow == ESortHow.TIME)
			ic = InvocationComparator.byTime;
		else
		if (esorthow == ESortHow.CALLS)
			ic = InvocationComparator.byCalls;
		Invocation invocation = null;
		int i = callersList.getSelectedIndex();
		if (i != -1)
			invocation = (Invocation) callers.get(i);
		callerCmp = new InvocationComparator(ic, flag);
		refreshCallers();
		if (invocation != null) {
			int j = callers.indexOf(invocation);
			callersList.setSelectedIndex(j);
		}
	}

	public void find (String s) {
		target = s;
		find();
	}

	public void find() {
		target = target.toLowerCase();
		List lst = profile.getMethods();
		int i = lst.size();
		int j = allMethods.getSelectedIndex() + 1;
		int k;
		for (k = -1; j<i && k==-1; j++) {
			Method m = (Method) lst.get(j);
			String s = m.getName(decodeMethodNames, showMethodParameters).toLowerCase();
			if (targetIsRegexp) {
				if (s.matches(target))
					k = j;
			} else {
				if (s.indexOf(target) != -1)
					k = j;
			}
		}
		if (k != -1) {
			setSelectedIndex(k);
			refreshRelatives(k);
		}
	}

	private boolean exclude (Method m) {
		for (int i=excludeList.size()-1; i>=0; i--) {
			if (isRegExp.get(i)) {
				if (m.getName(decodeMethodNames, showMethodParameters).matches((String) excludeList.get(i)))
					return true;
			} else {
				if (m.getName(decodeMethodNames, showMethodParameters).startsWith((String) excludeList.get(i)))
					return true;
			}
		}
		return false;
	}

	public void refresh (int i) { refresh(i, true); }

	public void refresh (int i, boolean doRefreshRelatives) {
		allMethods.removeAll();
		Iterator iter = profile.getMethods().iterator();
		long time = profile.getTime();
		long calls = profile.getCalls();
		Vector tmp = new Vector();
		Method method;
		if (showNumbersPercent) {
			if (percentages100) {
				time = 0;
				calls = 0;
				while (iter.hasNext()) {
					method = (Method) iter.next();
					if (!exclude(method)) {
						time += method.getTime(includeCalleeTimes);
						calls += method.getCalls();
					}
				}
			}
			iter = profile.getMethods().iterator();
			while (iter.hasNext()) {
				method = (Method) iter.next();
				if (!exclude(method))
					tmp.addElement(method.toString(time, calls, includeCalleeTimes, decodeMethodNames, showMethodParameters));
			}
		} else {
			while (iter.hasNext()) {
				method = (Method) iter.next();
				if (!exclude(method))
					tmp.addElement(method.toString(includeCalleeTimes, decodeMethodNames, showMethodParameters));
			}
		}
		allMethods.setListData(tmp);
		if (i != -1)
			setSelectedIndex(i);
		else
			allMethods.clearSelection();
		if (doRefreshRelatives)
			refreshRelatives(i);
	}

	public void refreshRelatives (int i) {
		Method method = null;
		if (i != -1) {
				// need to determine the index of the method -
				// the selectedIndex is no indication since methods may have been excluded
			String m = (String) allMethods.getSelectedValue();
			if (m == null) return;

			List allMethodsInProfile = profile.getMethods();
			for (int loop=allMethodsInProfile.size()-1; loop>=0; loop--) {
				Method meth = (Method) allMethodsInProfile.get(loop);
				if (meth != null)
					if (m.endsWith(meth.getName(decodeMethodNames, showMethodParameters)))
						method = profile.getMethod(loop);
			}
		}
		if ((method != selectedMethod) && (method != null)) {
				// only do this if there is a change
			fullName.setText(method.getName(decodeMethodNames, showMethodParameters));
			selectedMethod = method;
			refreshCallees();
			refreshCallers();
		}
	}

	public void refreshCallees() {
		calleesList.removeAll();
		boolean flag = false;
		if (selectedMethod != null) {
			long time = profile.getTime();
			long calls = profile.getCalls();
			// It's interesting how much time of the  *selected method* is spent in the callees (alph)  
			long timeCaller = selectedMethod.getTime(true);
			// FIXME: think about calls
			// long calls = selectedMethod.getCalls();
			callees = selectedMethod.getCallees(calleeCmp);
			Vector tmp = new Vector();
			int num = callees.size();
			for (int i=0; i<num; i++) {
				Invocation inv = (Invocation) callees.get(i);
				flag = true;
				if (showNumbersPercent) {
					tmp.addElement(inv.calleeString(timeCaller, time, calls, decodeMethodNames, showMethodParameters));
				} else {
					tmp.addElement(inv.calleeString(decodeMethodNames, showMethodParameters));
				}
			}
			// the time spent in the method itself compared to methods called is useful to see (alph)
			if (addSelfToCallees) {
				if (showNumbersPercent) {
					// FIXME: fix format
					tmp.addElement(selectedMethod.toString(timeCaller, time, calls, false, decodeMethodNames, showMethodParameters));
				} else {
					tmp.addElement(selectedMethod.toString(false, decodeMethodNames, showMethodParameters));
				}
			}
			calleesList.setListData(tmp);
		}
		if (flag)
			calleesList.setSelectedIndex(0);
	}

	public void refreshCallers() {
		callersList.removeAll();
		boolean flag = false;
		if (selectedMethod != null) {
			long time = profile.getTime();
			long calls = profile.getCalls();
			callers = selectedMethod.getCallers(callerCmp);
			Vector tmp = new Vector();			int num = callers.size();
			for (int i=0; i<num; i++) {
				Invocation inv = (Invocation) callers.get(i);
				flag = true;
				if (showNumbersPercent) {
					tmp.addElement(inv.callerString(time, calls, decodeMethodNames, showMethodParameters));
				} else {
					tmp.addElement(inv.callerString(decodeMethodNames, showMethodParameters));
				}
			}
			callersList.setListData(tmp);
		}
		if (flag)
			callersList.setSelectedIndex(0);
	}

	public void setSelectedIndex (int i) {
		// System.err.println("setSelectedIndex("+i+")");
		allMethods.setSelectedIndex(i);
		allMethods.ensureIndexIsVisible(i);
	}

	public List getCallees() { return callees; }
	
	public List getCallers() { return callers; }
	
	public InvocationComparator getCalleeCmp() { return calleeCmp; }
	
	public InvocationComparator getCallerCmp() { return callerCmp; }
	
	public MethodComparator getMethodCmp() { return methodCmp; }
	
	public void setIncludeTimesCallee(boolean includeCalleeTimes) {
		this.includeCalleeTimes = includeCalleeTimes;
		methodCmp.setIncludeTimesCallee(includeCalleeTimes);
	}


	public JList getCalleeList() { return calleesList; }

	public JList getCallerList() { return callersList; }

	public String getTarget() { return target; }

	private JMenuBar createMenu() {
		int menuShortcutKeyMask = Toolkit.getDefaultToolkit().getMenuShortcutKeyMask();

		JMenuItem mi;
		JMenuBar menubar = new JMenuBar();

	/* Profile */
		JMenu profile_menu = menubar.add(new JMenu("Profile"));
		ProfileMenu myProfileMenu = new ProfileMenu(this);
		profile_menu.setMnemonic('P');
		mi = profile_menu.add(new JMenuItem("New Window", 'N'));
        mi.setAccelerator(KeyStroke.getKeyStroke('N', menuShortcutKeyMask));
		mi.setActionCommand("new_window");
		mi.addActionListener(myProfileMenu);
		mi = profile_menu.add(new JMenuItem("Load...", 'L'));
        mi.setAccelerator(KeyStroke.getKeyStroke('O', menuShortcutKeyMask));
		mi.setActionCommand("load");
		mi.addActionListener(myProfileMenu);
		mi = profile_menu.add(new JMenuItem("Close Window", 'C'));
        mi.setAccelerator(KeyStroke.getKeyStroke('W', menuShortcutKeyMask));
		mi.setActionCommand("close_window");
		mi.addActionListener(myProfileMenu);
		profile_menu.addSeparator();
		
		mi = profile_menu.add(new JMenuItem("About..."));
		mi.setActionCommand("about");
		mi.addActionListener(myProfileMenu);
		mi = profile_menu.add(new JMenuItem("Help..."));
		mi.setActionCommand("help");
		mi.addActionListener(myProfileMenu);
		mi = profile_menu.add(new JMenuItem("License..."));
		mi.setActionCommand("license");
		mi.addActionListener(myProfileMenu);
		profile_menu.addSeparator();

		mi = profile_menu.add(new JMenuItem(isMac ? "Quit" : "Exit", 'X'));
		mi.setActionCommand("exit");
		if (isWin)
			mi.setAccelerator(KeyStroke.getKeyStroke('X', menuShortcutKeyMask));
		else if (isMac)
			mi.setAccelerator(KeyStroke.getKeyStroke('Q', menuShortcutKeyMask));
		mi.addActionListener(myProfileMenu);

	/* Method */
		JMenu method_menu = menubar.add(new JMenu("Method"));
		MethodMenu myMethodMenu = new MethodMenu(this);
		method_menu.setMnemonic('M');
		mi = method_menu.add(new JMenuItem("Sort...", 'S'));
		mi.setActionCommand("sort");
        mi.setAccelerator(KeyStroke.getKeyStroke('S', menuShortcutKeyMask));
		mi.addActionListener(myMethodMenu);
		mi = method_menu.add(new JMenuItem("Find...", 'F'));
		mi.setActionCommand("find");
        mi.setAccelerator(KeyStroke.getKeyStroke('F', menuShortcutKeyMask));
		mi.addActionListener(myMethodMenu);
		mi = method_menu.add(new JMenuItem("Find next", 'N'));
		mi.setActionCommand("find_next");
        mi.setAccelerator(KeyStroke.getKeyStroke('G', menuShortcutKeyMask));
		mi.addActionListener(myMethodMenu);
		method_menu.addSeparator();
		mi = method_menu.add(new JMenuItem("Go to Caller"));
		mi.setActionCommand("caller_goto");
		mi.addActionListener(myMethodMenu);
		mi = method_menu.add(new JMenuItem("Sort Callers..."));
		mi.setActionCommand("caller_sort");
		mi.addActionListener(myMethodMenu);
		method_menu.addSeparator();
		mi = method_menu.add(new JMenuItem("Go to Callee"));
		mi.setActionCommand("callee_goto");
		mi.addActionListener(myMethodMenu);
		mi = method_menu.add(new JMenuItem("Sort Callees..."));
		mi.setActionCommand("callee_sort");
		mi.addActionListener(myMethodMenu);

	/* Options */
		JMenu options_menu = menubar.add(new JMenu("Options"));
		OptionsMenu myOptionsMenu = new OptionsMenu(this);
		options_menu.setMnemonic('P');
		mi = options_menu.add(new JMenuItem("Exclude Methods...", 'E'));
		mi.setActionCommand("exclude");
		mi.addActionListener(myOptionsMenu);
		mi = options_menu.add(new JCheckBoxMenuItem("Show Numbers as Percent", showNumbersPercent));
		mi.setActionCommand("showNumbersPercent");
		mi.addActionListener(myOptionsMenu);
		mi = options_menu.add(new JCheckBoxMenuItem("Include Callee Times", includeCalleeTimes));
		mi.setActionCommand("includeCalleeTimes");
		mi.addActionListener(myOptionsMenu);
		decode_switch = (JCheckBoxMenuItem) options_menu.add(new JCheckBoxMenuItem("Decode Method Names", decodeMethodNames));
		decode_switch.setActionCommand("decodeMethodNames");
		decode_switch.addActionListener(myOptionsMenu);
		mi = options_menu.add(new JCheckBoxMenuItem("Show Method Parameters", showMethodParameters));
		mi.setActionCommand("showMethodParameters");
		mi.addActionListener(myOptionsMenu);
		mi = options_menu.add(new JCheckBoxMenuItem("Add Method to Callees", addSelfToCallees));
		mi.setActionCommand("addSelfToCallees");
		mi.addActionListener(myOptionsMenu);
		awtFD_switch = (JCheckBoxMenuItem) options_menu.add(new JCheckBoxMenuItem("Use AWT File Dialog", useAWTFileDialog));
		awtFD_switch.setActionCommand("useAWTFileDialog");
		awtFD_switch.addActionListener(myOptionsMenu);
		browser_switch = (JCheckBoxMenuItem) options_menu.add(new JCheckBoxMenuItem("Use Browser for Help", useBrowserForHelp));
		browser_switch.setActionCommand("useBrowserForHelp");
		browser_switch.addActionListener(myOptionsMenu);

		options_menu.addSeparator();
		mi = options_menu.add(new JCheckBoxMenuItem("Exclude Recursive Calls", excludeRecursiveCalls));
		mi.setActionCommand("excludeRecursiveCalls");
		mi.addActionListener(myOptionsMenu);

		return menubar;
	}

	public void handleOpenFile (File fileName) {
		loadProfile(fileName.getAbsolutePath());
	}

	boolean loadProfile (String fileName) {
		File input = null;

		if (fileName == null) {
			if (useAWTFileDialog) {
				FileDialog fd = new FileDialog(this, "Choose file to load", FileDialog.LOAD);
				if (currentDir == null)
					fd.setDirectory(System.getProperty("user.dir"));
				else
					fd.setDirectory(currentDir);
				fd.setVisible(true);
				if (fd.getFile() == null)
					return false;
				currentDir = fd.getDirectory();
				input = new File(currentDir, fd.getFile());
			} else {
				JFileChooser fd;
				if (currentDir == null)
					fd = new JFileChooser(System.getProperty("user.dir"));
				else
					fd = new JFileChooser(currentDir);
				fd.setAccessory(new FindAccessory(fd));
				fd.setDialogTitle("Choose file to load");
				if (fd.showOpenDialog(this) != JFileChooser.APPROVE_OPTION)
					return false;
				currentDir = fd.getCurrentDirectory().getAbsolutePath();
				input = fd.getSelectedFile();
			}
		} else {
			input = new File(fileName);
		}

		String path = input.getAbsolutePath();
		try {
			setTitle("Profile Viewer - loading " + path);
			parser = ProfileParserFactory.buildParser(input, 100);
			if (parser == null) {
				setTitle("Profile Viewer - error loading " + path);
				System.err.println("format of file " + path + " not supported");
				return false;
			}
			profile.loadData(parser);
			profile.sort(getMethodCmp());
			setTitle("Profile Viewer - " + path);
			if (parser instanceof MethodNamesDecodeable) {
				decode_switch.setEnabled(true);
			} else {
				decodeMethodNames = false;
				decode_switch.setState(false);
				decode_switch.setEnabled(false);
			}
			refresh(0);
		} catch (Exception ex) {
			setTitle("Profile Viewer - error loading " + path);
			System.err.println("Error while loading file : " + path);
			ex.printStackTrace();
			return false;
		}
		return true;
	}

	private class ProfileMenu implements ActionListener {
		private ProfileViewer parent = null;

		ProfileMenu (ProfileViewer _parent) { parent = _parent; }

		public void actionPerformed (ActionEvent e) {
			String cmd = e.getActionCommand();
			if (cmd.equals("new_window")) {
				new ProfileViewer(new String[0]);
			} else if (cmd.equals("load")) {
				loadProfile(null);
			} else if (cmd.equals("close_window")) {
				dispose();
			} else if (cmd.equals("about")) {
				if (ad == null)
					 ad = new AboutDialog(parent);
				ad.setVisible(true);
			} else if (cmd.equals("help")) {
				boolean success = false;
				if (useBrowserForHelp) try {
					BrowserLauncher.openURL(
						"file://"+System.getProperty("user.dir")+"/"
						+props.getProperty("ProfileViewer.helpFile"));
					success = true;
				} catch (Exception ex) {
					System.err.println(ex.getMessage());
				}
				if (!success) {
					if (hd == null)
						 hd = new HelpDialog(parent);
					hd.setVisible(true);
				}
			} else if (cmd.equals("license")) {
				if (ld == null)
					 ld = new LicenseDialog(parent);
				ld.setVisible(true);
			} else if (cmd.equals("exit")) {
				System.exit(0);
			}
		}
	}

	private class MethodMenu implements ActionListener {
		private ProfileViewer parent = null;
		
		MethodMenu (ProfileViewer _parent) { parent = _parent; }

		public void actionPerformed (ActionEvent e) {
			String cmd = e.getActionCommand();
			if (cmd.equals("sort")) {
				MethodComparator m = getMethodCmp();
				new SortDialog(parent, ESortWho.METHODS, m.toSortHow(), m.ascending).setVisible(true);
			} else if (cmd.equals("find")) {
				Object[] message = new Object[3];
				message[0] = "Enter the text to search for:";
				message[1] = new JTextField(target);
				message[2] = new JCheckBox("RegExp matching", targetIsRegexp);
				String[] options = { "Find", "Cancel" };
				int result = JOptionPane.showOptionDialog(parent, message, "Find Text", JOptionPane.YES_NO_OPTION,
								JOptionPane.QUESTION_MESSAGE, null, options, options[0]);
				if (result == 0) {
					target = ((JTextField) message[1]).getText();
					targetIsRegexp = ((JCheckBox) message[2]).isSelected();
					find();
				}
			} else if (cmd.equals("find_next")) {
				find();
			} else if (cmd.equals("callee_goto")) {
				int index = calleesList.getSelectedIndex();
				if (index != -1) {
					List invSeq = getCallees();
					Method m = ((Invocation) invSeq.get(index)).callee;
					int idx = getListIndexFromMethod(allMethods, m);
					if (idx != -1) {
						setSelectedIndex(idx);
						refreshRelatives(index);
						calleesList.setSelectedIndex(0);
					}
				}
			} else if (cmd.equals("callee_sort")) {
				InvocationComparator i = getCalleeCmp();
				new SortDialog(parent, ESortWho.CALLEES, i.toSortHow(), i.ascending).setVisible(true);
			} else if (cmd.equals("caller_goto")) {
				int index = callersList.getSelectedIndex();
				if (index != -1) {
					List invSeq = getCallers();
					Method m = ((Invocation) invSeq.get(index)).caller;
					int idx = getListIndexFromMethod(allMethods, m);
					if (idx != -1) {
						setSelectedIndex(idx);
						refreshRelatives(index);
						callersList.setSelectedIndex(0);
					}
				}
			} else if (cmd.equals("caller_sort")) {
				InvocationComparator i = getCallerCmp();
				new SortDialog(parent, ESortWho.CALLERS, i.toSortHow(), i.ascending).setVisible(true);
			}
		}
	}

	private class OptionsMenu implements ActionListener {
		private ProfileViewer parent = null;

		OptionsMenu (ProfileViewer _parent) { parent = _parent; }

		public void actionPerformed (ActionEvent e) {
			String cmd = e.getActionCommand();
			if (cmd.equals("exclude")) {
				new ExcludeDialog(parent, excludeList, isRegExp).setVisible(true);
			} else if (cmd.equals("showNumbersPercent")) {
				showNumbersPercent = !showNumbersPercent;
				int i = allMethods.getSelectedIndex();
				selectedMethod = null;
				if (showNumbersPercent) {
					methodText.setText(methodTextRel);
					calleesText.setText(calleesTextRel);
					callersText.setText(callersTextRel);
				} else {
					methodText.setText(methodTextAbs);
					calleesText.setText(calleesTextAbs);
					callersText.setText(callersTextAbs);
				}
				refresh(i, true);
			} else if (cmd.equals("includeCalleeTimes")) {
				setIncludeTimesCallee(!includeCalleeTimes);
				sortMethods(null, false);
				refreshCallees();
				refreshCallers();
				if (includeCalleeTimes && percentages100)
					fullName.setText("The 'Percentages add up to 100%' option should be turned off.");
				else
					fullName.setText("");
			} else if (cmd.equals("decodeMethodNames")) {
				decodeMethodNames = !decodeMethodNames;
				refresh(-1, false);
				refreshCallees();
				refreshCallers();
			} else if (cmd.equals("showMethodParameters")) {
				showMethodParameters = !showMethodParameters;
				refresh(-1, false);
				refreshCallees();
				refreshCallers();
			} else if (cmd.equals("addSelfToCallees")) {
				addSelfToCallees = !addSelfToCallees;
				refresh(-1, false);
				refreshCallees();
				refreshCallers();
			} else if (cmd.equals("useAWTFileDialog")) {
				useAWTFileDialog = !useAWTFileDialog;
				for (int i=windows.size()-1; i>=0; i--) {
					ProfileViewer pv = ((ProfileViewer) windows.elementAt(i));
					if (pv != parent)
						pv.awtFD_switch.setState(!pv.awtFD_switch.getState());
				}
			} else if (cmd.equals("useBrowserForHelp")) {
				useBrowserForHelp = !useBrowserForHelp;
				for (int i=windows.size()-1; i>=0; i--) {
					ProfileViewer pv = ((ProfileViewer) windows.elementAt(i));
					if (pv != parent)
						pv.browser_switch.setState(!pv.browser_switch.getState());
				}
			} else if (cmd.equals("excludeRecursiveCalls")) {
				excludeRecursiveCalls = !excludeRecursiveCalls;
				refresh(-1, false);
				refreshCallees();
				refreshCallers();
			}
		}
	}
}
