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

/** Parser for GNU gprof profile files
 * @author L. Maisonobe
 */
public class GNUGprofProfileParser extends AbstractGprofProfileParser {

  /** Simple constructor.
   * Build a parser for the given file.
   * @param input input file to parse
   * @exception FileNotFoundException if the input file cannot be found
      */
  public GNUGprofProfileParser (File input) throws FileNotFoundException {
    super (input);
  }

  /** Parse the header lines for the GNU gprof format*/
	@Override
  protected void parseHeader() throws IOException, ParseException {
    readLine();

    try {
      // the first line is the title of the first section
      //        Flat profile:
      if ((! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("Flat"))
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("profile:"))
          || (leftTokenizer.hasMoreTokens()))
        parseError("wrong header");

      // the second line should be empty
      readLine();
      if (leftTokenizer.hasMoreTokens())
        parseError("wrong header");

      // the third line should be "Each sample counts as xx.xx seconds."
      readLine();
      if ((! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("Each"))
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("sample"))
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("counts"))
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("as"))
          || (! leftTokenizer.hasMoreTokens())
          || (new Double(leftTokenizer.nextToken()).doubleValue() < 0.0)
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("seconds."))
          || (leftTokenizer.hasMoreTokens()))
        parseError("wrong header");

      // we do not check the rest of the flat profile section
      do {
        readLine();
      } while (! line.equals("\f"));

      // the next line is the title of the second section
      //       Call graph (explanation follows)
      // or
      //       Call graph
      // depending on the flags used while generating the file
      readLine();
      if ((! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("Call"))
          || (! leftTokenizer.hasMoreTokens())
          || (! leftTokenizer.nextToken().equals ("graph")))
        parseError("wrong header");

      // we read up to the table header
      splitIndex = -1;
      while (splitIndex < 0) {

        readLine();

        if ((leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("index"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("%"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("time"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("self"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("children"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("called"))
            && (leftTokenizer.hasMoreTokens())
            && (leftTokenizer.nextToken().equals ("name")))
          splitIndex = line.indexOf("name");
      }
    } catch (NumberFormatException nfe) {
      parseError(nfe.getMessage());
    }
  }
}
