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

import java.io.*;
import java.util.*;

public class Profile {

	List methods;
	boolean includeTimesCallee;		// for latest value of totalTime
	long totalTime, totalCalls;
	boolean excludeRecursiveCalls;

	public Profile (boolean excludeRecursiveCalls) {
		methods = new ArrayList();
		this.excludeRecursiveCalls = excludeRecursiveCalls;
	}

	public void loadData (ProfileParser parser) {
		HashMap hashedmap = new HashMap();
		InvocationLine il = null;
		Invocation inv;
		Method caller, callee;
		boolean canDecode = (parser instanceof MethodNamesDecodeable);
		do {
			try {
				il = parser.nextInvocationLine();
				if (il != null) {
					caller = (Method) hashedmap.get(il.caller);
					if (caller == null) {
						caller = new Method(il.caller, canDecode);
						hashedmap.put(il.caller, caller);
					}
					callee = (Method) hashedmap.get(il.callee);
					if (callee == null) {
						callee = new Method(il.callee, canDecode);
						hashedmap.put(il.callee, callee);
					}
					inv = new Invocation(il.time, il.calls, callee, caller);
					// FIXME: recursive calls need special treatment
					// I don't understand the counter values in the profile,
					// they are greater then the whole runtime (alph)
					if ((caller != callee) || !excludeRecursiveCalls) {
						caller.addCallee(inv);
						callee.addCaller(inv);
					}
				}
			} catch (ParseException ex) {
				if (ex.getMessage().indexOf("handles_used") != -1)
					break;		// signals the end of the method data section
				System.err.println("ParseException at line " + parser.getLineNo() + ": " + ex.getMessage());
				continue;
			}
		} while (il != null);
		methods.clear();
		methods.addAll(hashedmap.values());
		includeTimesCallee = false;
		totalTime = 0L;
		totalCalls = 0L;
		for (Iterator iter = methods.iterator(); iter.hasNext();) {
			Method m = (Method) iter.next();
			m.checkTotalTime(); // YK, this should not be done during invocation parsing
			totalTime += m.getTime(includeTimesCallee);
			totalCalls += m.getCalls();
		}
		System.out.println("Nr of methods: " + methods.size()
			+ ", total time: "    + totalTime + ", total calls: " + totalCalls);
	}

	public void sort (MethodComparator methodcomparator) { Collections.sort(methods, methodcomparator); }

	public Method getMethod (int i) { return (Method) methods.get(i); }

	public List getMethods() { return methods; }

	public long getTime() { return totalTime; }

	public long getCalls() { return totalCalls; }

	public int indexOf (Method m) { return methods.indexOf(m); }

	public static void main (String args[]) {
		try {
			String defaultName = new String("java.prof");
			ProfileParser parser = ProfileParserFactory.buildParser(new File (defaultName), 100);
			if (parser == null) {
			  System.err.println("format of file " + defaultName + " not supported");
			} else {
				Profile profile = new Profile(false);
				profile.loadData(parser);
				profile.sort(new MethodComparator(MethodComparator.byTime, false, true));
				for (Iterator iter = profile.methods.iterator(); iter.hasNext();)
					System.out.println(iter.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

