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

import java.io.File;
import java.io.FileNotFoundException;

/** Factory building the proper parser for a given profile file.
 * <p>The various profile file formats each have a specific parser.
 * This utility class builds the proper parser given a profile file.</p>
 * @see ProfileParser
 * @author L. Maisonobe
 */

public class ProfileParserFactory {

  // this is a utility class that should not be instanciated,
  // so the constructor is made private
  private ProfileParserFactory () {}

  /** Check a potential parser for the first few entries */
  private static boolean canParseFile (ProfileParser parser, int maxEntries) {
    try {
      for (int i = 0; i < maxEntries; ++i) {
        InvocationLine invocation = parser.nextInvocationLine();
        if (invocation == null)
          return true; // we have checked all entries !
      }
      return true;
    } catch (ParseException pe) {
      return false;
    }
  }

  /** Build a parser for a profile file
   * @param input input file to parse
   * @param maxEntries maximum number of entries to check
   * @return a parser for the file, or null if the file is not recognized
   */
  public static ProfileParser buildParser (File input, int maxEntries) throws FileNotFoundException {

    // check all the known formats in turn
    if (canParseFile (new ClassicJavaProfileParser (input), maxEntries))
      return new ClassicJavaProfileParser (input);
    else if (canParseFile (new GNUGprofProfileParser (input), maxEntries))
      return new GNUGprofProfileParser (input);
    else if (canParseFile (new SolarisGprofProfileParser (input), maxEntries))
      return new SolarisGprofProfileParser (input);
    else if (canParseFile (new OSXGprofProfileParser (input), maxEntries))
      return new OSXGprofProfileParser (input);
    else
      return null;

  }
}
