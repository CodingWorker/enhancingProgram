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

import java.io.*;
import java.util.StringTokenizer;

/** Parser for OS X gprof profile files
 * @author L. Maisonobe
 * @author U. Dittmer
 */

public class OSXGprofProfileParser extends AbstractGprofProfileParser {

	/** Simple constructor.
	* Build a parser for the given file.
	* @param input input file to parse
	* @exception FileNotFoundException if the input file cannot be found
	*/
	public OSXGprofProfileParser (File input) throws FileNotFoundException {
		super (input);
	}

	/** Parse the header lines for the OS X gprof format*/
	@Override
	protected void parseHeader() throws IOException, ParseException {
		try {
			readLine(); // should be empty

			readLine(); 
			if ((! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("granularity:"))
				|| (! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("each"))
				|| (! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("sample"))
				|| (! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("hit"))
				|| (! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("covers")))
				parseError("wrong header");

			readLine(); // should be empty

			readLine(); 
			if ((! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("called/total"))
				|| (! leftTokenizer.hasMoreTokens())
				|| (! leftTokenizer.nextToken().equals("parents"))
				|| (leftTokenizer.hasMoreTokens()))
				parseError("wrong header");

			readLine();
			if ((leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("index"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("%time"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("self"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("descendents"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("called+self"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("name"))
				&& (leftTokenizer.hasMoreTokens())
				&& (leftTokenizer.nextToken().equals ("index")))
			  splitIndex = line.indexOf("name");
		} catch (NumberFormatException nfe) {
		  parseError(nfe.getMessage());
		}
	}
}
