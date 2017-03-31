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

/** Parsing interface for profile files.
 * <p>The classes that know how to parse a specific profile file format should
 * implement this interface. Profile instances are given a reference to an
 * object implementing this interface in order to load the profile data.</p>
 * @see ProfileParserFactory
 * @author L. Maisonobe
 */

public interface ProfileParser {

  /** Get the next invocation line from the file.
   * @return a new invocation line, or null if there is no more relevant data in the file
   * @exception ParseException if there is a parsing error
   */
  public InvocationLine nextInvocationLine () throws ParseException;

  /** Stop the parsing.
   * This method stops the parsing, and allow the parser to free its
   * resources (for example to close the input file).
   */
  public void stopParsing();

  /** Returns the current line number of the input file. Used for exception handling.
   */
  public int getLineNo();

}
