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
import java.util.StringTokenizer;

/** Parser for classic java profile files
 * @author L. Maisonobe
 */
public class ClassicJavaProfileParser implements ProfileParser, MethodNamesDecodeable {

  private BufferedReader  reader;
  private int             lineNo;
  private String          line;
  private StringTokenizer tokenizer;

  /** Simple constructor.
   * Build a parser for the given file.
   * @param input input file to parse
   * @exception FileNotFoundException if the input file cannot be found
   */
  public ClassicJavaProfileParser (File input) throws FileNotFoundException {

    FileInputStream   fis = new FileInputStream(input);
    InputStreamReader isr = new InputStreamReader(fis);

    reader    = new BufferedReader(isr);
    lineNo    = 0;
    line      = null;
    tokenizer = null;
  }

  /** Generate a parse error */
  private void parseError (String details) throws ParseException {

    StringBuffer message = new StringBuffer ("parse error at line ");

    message.append(lineNo);
    message.append(System.getProperty("line.separator"));
    message.append(line);
    message.append(System.getProperty("line.separator"));
    message.append(details);

    throw new ParseException(message.toString());
 }

  /** Read a line */
  private void readLine (boolean errorIfNoLine) throws IOException, ParseException {

    if (reader == null)
      throw new ParseException("no data stream available");

    line = reader.readLine();

    if (line == null) {
      tokenizer = null;
      if (errorIfNoLine)
        throw new ParseException("unexpected end of file");
    } else {
      tokenizer = new StringTokenizer(line);
      ++lineNo;
    }
  }

  /** Parse the header line */
  private void parseHeader() throws IOException, ParseException {

    readLine(true);

    // the header is just on line
    if ((! tokenizer.hasMoreTokens())
        || (! tokenizer.nextToken().equals ("count"))
        || (! tokenizer.hasMoreTokens())
        || (! tokenizer.nextToken().equals ("callee"))
        || (! tokenizer.hasMoreTokens())
        || (! tokenizer.nextToken().equals ("caller"))
        || (! tokenizer.hasMoreTokens())
        || (! tokenizer.nextToken().equals ("time"))
        || (tokenizer.hasMoreTokens()))
      parseError("wrong header");
  }

  /** Read a caller/callee field */
  private String readCallerCalleeField (String fieldName) throws ParseException {

    if (! tokenizer.hasMoreTokens())
      parseError("missing " + fieldName);
    StringBuffer buffer = new StringBuffer (tokenizer.nextToken());

    if (buffer.charAt(0) == '<') {
      while (buffer.charAt(buffer.length() - 1) != '>') {

        // add a space between sub-tokens
        buffer.append(' ');

        // add next sub-token
        if (! tokenizer.hasMoreTokens())
          parseError("wrong " + fieldName + " format");
        buffer.append (tokenizer.nextToken());

      }
    }

    return buffer.toString();
  }

  /** Get the next invocation line from the file.
   * @return a new invocation line, or null if there is no more relevant data in the file
   * @exception ParseException if there is a parsing error
   */
  public InvocationLine nextInvocationLine () throws ParseException {

    try {
      // this is the first time through, we should handle the header
      if (lineNo == 0)
        parseHeader();

      // looking for a data line
      while (true) {
        readLine(false);
        if (line == null)
          return null;

        try {
          // number of calls
          if (! tokenizer.hasMoreTokens())
            parseError("empty line");
          String token = tokenizer.nextToken();
          if (token.charAt(0) == '#')
            continue;
          long calls = Long.parseLong(token);

          // callee
          String callee = readCallerCalleeField("callee");

          // caller
          String caller = readCallerCalleeField("caller");

          // time
          if (! tokenizer.hasMoreTokens())
            parseError("missing time");
          long time = Long.parseLong(tokenizer.nextToken());

          // nothing else
          if (tokenizer.hasMoreTokens())
            parseError("unexpected trailing data");

          // we have successfully parsed a line
          return new InvocationLine(time, calls, callee, caller);

        } catch (NumberFormatException nfe) {
          parseError(nfe.getMessage());
        }
      }
    } catch (IOException ioe) {
      throw new ParseException(ioe.getMessage());
    }
  }

  /** Stop the parsing.
   * This method stops the parsing, and allow the parser to free its
   * resources (for example to close the input file).
   */
  public void stopParsing() {
    try {
      reader.close();
    } catch (IOException e) {}
    reader    = null;
    tokenizer = null;
  }

  public int getLineNo() {
  	return lineNo;
  }
}
