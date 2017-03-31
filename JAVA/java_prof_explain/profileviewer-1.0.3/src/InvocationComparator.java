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

import java.util.Comparator;

public class InvocationComparator implements Comparator {

	public static final InvocationComparator byTime, byCalls, byCallee, byCaller;
	ESortHow sortHow;
	public InvocationComparator byWhat;
	public boolean ascending;

	static {
		byTime = new InvocationComparator(ESortHow.TIME);
		byCalls = new InvocationComparator(ESortHow.CALLS);
		byCallee = new InvocationComparator(ESortHow.NAME);
		byCaller = new InvocationComparator(ESortHow.NAME);
	}

	private InvocationComparator (ESortHow how) { sortHow = how; }

	public InvocationComparator (InvocationComparator byWhat, boolean ascending) {
		this.byWhat = byWhat;
		this.ascending = ascending;
		sortHow = byWhat.toSortHow();
	}

	public ESortHow toSortHow() { return sortHow; }

	public int compare (Object fst, Object scnd) {
		Invocation a = (Invocation) fst;
		Invocation b = (Invocation) scnd;
		int iReturn;
		if (byWhat == byCaller) {
			iReturn = a.caller.getName().compareTo(b.caller.getName());
		} else if (byWhat == byCallee) {
			iReturn = a.callee.getName().compareTo(b.callee.getName());
		} else {
			long la, lb;
			if (byWhat == byTime) {
				la = a.time;
				lb = b.time;
			} else {
				la = a.calls;
				lb = b.calls;
			}
			if (la < lb)
				iReturn = -1;
			else if (la > lb)
				iReturn = 1;
			else
				iReturn = 0;
		}
		if (!ascending)
			iReturn = -iReturn;
		return iReturn;
	}
}
