/**
 *   ProfileViewer - graphically displays java.prof output
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
import java.util.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.*;

public class ExcludeDialog extends JDialog implements ActionListener {

	ProfileViewer parent;
	JTable table;
	TDM model = null;
	JButton ok, close, add, delete;
	JCheckBox addUpTo100;
	private List myEL = null;	// EL = exclude list
	private List parentEL;
	private BitSet myRE = null, parentRE;

	private static Font myFont = new Font("SansSerif", Font.PLAIN, 14);

	ExcludeDialog (ProfileViewer parent, List excludeList, BitSet isRegExp) {
		super(parent, "Exclude Methods:", true);
		this.parent = parent;
		myEL = new ArrayList(excludeList);
		parentEL = excludeList;
		myRE = (BitSet) isRegExp.clone();
		parentRE = isRegExp;
		createGui();
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		addKeyListener(new KeyAdapter() {
			public void keyPressed (KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ESCAPE) setVisible(false); } });
	}

	private void createGui() {
		JPanel btns1 = new JPanel();
		btns1.setLayout(new BoxLayout(btns1, BoxLayout.X_AXIS));
		add = new JButton("Add");
		add.addActionListener(this);
		delete = new JButton("Delete");
		delete.addActionListener(this);
		btns1.add(Box.createHorizontalGlue());
		btns1.add(add);
		btns1.add(Box.createHorizontalGlue());
		btns1.add(delete);
		btns1.add(Box.createHorizontalGlue());

		model = new TDM();
		table = new JTable(model);
		table.getTableHeader().setReorderingAllowed(false);
		table.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		table.getColumnModel().getColumn(1).setMaxWidth(75);
		JScrollPane sp = new JScrollPane(table);
		sp.setPreferredSize(new Dimension(250, 100));

		addUpTo100 = new JCheckBox("Percentages add up to 100%", parent.percentages100);

		JPanel btns2 = new JPanel();
		btns2.setLayout(new BoxLayout(btns2, BoxLayout.X_AXIS));
		ok = new JButton("OK");
		ok.addActionListener(this);
		close = new JButton("Cancel");
		close.addActionListener(this);
		btns2.add(Box.createHorizontalGlue());
		btns2.add(ok);
		btns2.add(Box.createHorizontalGlue());
		btns2.add(close);
		btns2.add(Box.createHorizontalGlue());

		getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		getContentPane().add(btns1);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		getContentPane().add(sp);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		getContentPane().add(addUpTo100);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		getContentPane().add(btns2);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		pack();
		setSize(getPreferredSize());
		setLocationRelativeTo(parent);
	}

	private void action() {
		table.editingStopped(null);
		setVisible(false);
		parentEL.clear();
		Iterator iter = myEL.iterator();
		while (iter.hasNext()) {
			String tmp = (String) iter.next();
			if (tmp!= null && !tmp.equals(""))
				parentEL.add(tmp);
		}
		parentRE.xor(parentRE);
		parentRE.or(myRE);
		parent.percentages100 = addUpTo100.isSelected();
		setVisible(false);
		parent.refresh(-1, true);
		parent.requestFocus();
	}

	public void actionPerformed (ActionEvent event) {
		String cmd = event.getActionCommand();
		if (cmd.equals("Add")) {
			myEL.add("");
			int tmp = myEL.size()-1;
			model.fireTableRowsInserted(tmp, tmp);
			table.requestFocus();
			table.editCellAt(tmp, 0);
		} else if (cmd.equals("Delete")) {
			int rows[] = table.getSelectedRows();
			if (rows.length == 0) return;
			table.removeEditor();
			for (int i=rows.length-1; i>=0; i--)
				myEL.remove(rows[i]);
			model.fireTableRowsDeleted(rows[0], rows[rows.length-1]);
		} else if (cmd.equals("OK")) {
			action();
		} else if (cmd.equals("Cancel")) {
			setVisible(false);
		}
	}

	class TDM extends AbstractTableModel {
			// TDM = TableDataModel
		public boolean isCellEditable (int row, int col) { return true; }
		public int getRowCount() { return myEL.size(); }
		public int getColumnCount() { return 2; }
		public Object getValueAt (int row, int col) {
			switch (col) {
				case 0: return myEL.get(row);
				case 1: return new Boolean(myRE.get(row));
			}
			return null;
		}
		public void setValueAt (Object obj, int row, int col) {
			switch (col) {
				case 0: myEL.set(row, obj); break;
				case 1:
					if (((Boolean) obj).booleanValue())
						myRE.set(row);
					else
						myRE.clear(row);
					break;
			}
			fireTableCellUpdated(row, col);
		}
		public String getColumnName (int col) {
			switch (col) {
				case 0: return "Match string";
				case 1: return "is RegExp";
			}
			return null;
		}
		public Class getColumnClass (int col) {
			switch (col) {
				case 0: return String.class;
				case 1: return Boolean.class;
			}
			return null;
		}
	}
}
