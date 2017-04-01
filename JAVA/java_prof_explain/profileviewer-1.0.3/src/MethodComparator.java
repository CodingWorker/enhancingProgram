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

public class MethodComparator implements Comparator {

	public static final MethodComparator byTime;
	public static final MethodComparator byCalls;
	public static final MethodComparator byName;
	public MethodComparator byWhat;
	public boolean ascending;
	public boolean includeTimesCallee;
	ESortHow sortHow;

	static {
		byTime = new MethodComparator(ESortHow.TIME);
		byCalls = new MethodComparator(ESortHow.CALLS);
		byName = new MethodComparator(ESortHow.NAME);
	}

	private MethodComparator (ESortHow how) { sortHow = how; }

	public MethodComparator (MethodComparator byWhat, boolean ascending, boolean includeTimesCallee) {
		this.byWhat = byWhat;
		this.ascending = ascending;
		this.includeTimesCallee = includeTimesCallee;
		sortHow = byWhat.toSortHow();
	}

	public static MethodComparator fromSortHow (ESortHow sortHow) {
		MethodComparator how = byTime;
		if (sortHow == ESortHow.NAME)
			how = byName;
		else if (sortHow == ESortHow.CALLS)
			how = byCalls;
		return how;
	}

	public ESortHow toSortHow() { return sortHow; }

	public int compare (Object fst, Object scnd) {
		Method a = (Method) fst;
		Method b = (Method) scnd;
		int iReturn;
		if (byWhat == byName) {
			iReturn = a.getName().toLowerCase().compareTo(b.getName().toLowerCase());
		} else {
			long la, lb;
			if (byWhat == byTime) {
				la = a.getTime(includeTimesCallee);
				lb = b.getTime(includeTimesCallee);
			} else {
				la = a.getCalls();
				lb = b.getCalls();
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

    public void setIncludeTimesCallee(boolean includeTimesCallee) {
		this.includeTimesCallee = includeTimesCallee;
    }
}
