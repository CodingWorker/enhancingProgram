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

public class ESortHow {

	public static ESortHow TIME = new ESortHow("Time");
	public static ESortHow NAME = new ESortHow("Name");
	public static ESortHow CALLS = new ESortHow("Call count");
	private String name;

	private ESortHow (String name) { this.name = name; }

	public static ESortHow fromString (String s) {
		ESortHow how = TIME;
		if(s.compareTo(NAME.toName()) == 0)
			how = NAME;
		else
		if(s.compareTo(CALLS.toName()) == 0)
			how = CALLS;
		return how;
	}

	public String toName() { return name; }

}

