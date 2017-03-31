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

/** Parser for Solaris gprof profile files
 * @author L. Maisonobe
 */
public class SolarisGprofProfileParser extends AbstractGprofProfileParser {

  /** Simple constructor.
   * Build a parser for the given file.
   * @param input input file to parse
   * @exception FileNotFoundException if the input file cannot be found
      */
  public SolarisGprofProfileParser (File input) throws FileNotFoundException {
    super (input);
  }

  /** Parse the header lines for the Solaris gprof format*/
	@Override
  protected void parseHeader() throws IOException, ParseException {

    // the first lines are copyright comments and identifying markers
    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("/*"))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("*"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("Copyright"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("(c)"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("1993"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("by"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("Sun"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("Microsystems,"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("Inc."))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("*/"))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    readLine();
    if (leftTokenizer.hasMoreTokens())
      parseError("wrong header");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("#pragma"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("ident")))
      parseError("wrong header");

    readLine();
    if (leftTokenizer.hasMoreTokens())
      parseError("wrong header");

    readLine();
    if (leftTokenizer.hasMoreTokens())
      parseError("wrong header");

    // then comes the description of the fields
    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("call"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("graph"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("profile:"))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    // we do not check the rest of the fields description lines
    do {
      readLine();
    } while (! line.equals("\f"));

    // we should have an empty line here
    readLine();
    if (leftTokenizer.hasMoreTokens())
      parseError("wrong header");

    // the next line explains the granularity
    //       granularity: each sample hit covers xx byte(s) ...
    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("granularity:"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("each"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("sample"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("hit"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("covers")))
      parseError("wrong header");

    // we should have an empty line here
    readLine();
    if (leftTokenizer.hasMoreTokens())
      parseError("wrong header");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("called/total"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("parents"))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("index"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("%time"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("self"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("descendents"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("called+self"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("name"))
        || (! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("index"))
        || (leftTokenizer.hasMoreTokens()))
      parseError("wrong header");

    splitIndex = line.indexOf ("name");

    readLine();
    if ((! leftTokenizer.hasMoreTokens())
        || (! leftTokenizer.nextToken().equals ("called/total"))
        || (leftTokenizer.hasMoreTokens())
        || (! rightTokenizer.hasMoreTokens())
        || (! rightTokenizer.nextToken().equals ("children"))
        || (rightTokenizer.hasMoreTokens()))
      parseError("wrong header");

  }

}
