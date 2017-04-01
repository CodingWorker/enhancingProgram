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

public class ESortWho {

	public static ESortWho METHODS = new ESortWho("Methods");
	public static ESortWho CALLEES = new ESortWho("Callees");
	public static ESortWho CALLERS = new ESortWho("Callers");
	public static ESortWho ALL = new ESortWho("All");
	private String name;

	private ESortWho (String name) { this.name = name; }

	public String toName() { return name; }

	public static ESortWho fromString(String s) {
		ESortWho who = ALL;
		if(s.compareTo(METHODS.toName()) == 0)
			who = METHODS;
		else
		if(s.compareTo(CALLEES.toName()) == 0)
			who = CALLEES;
		else
		if(s.compareTo(CALLERS.toName()) == 0)
			who = CALLERS;
		return who;
	}

}

