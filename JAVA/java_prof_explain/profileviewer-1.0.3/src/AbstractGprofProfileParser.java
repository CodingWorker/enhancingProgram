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

/** Common part of all gprof profile files parsers
 * @author L. Maisonobe
 */
public abstract class AbstractGprofProfileParser implements ProfileParser {

  private   BufferedReader  reader;
  private   int             lineNo;
  protected String          line;
  protected int             splitIndex;
  protected StringTokenizer leftTokenizer;
  protected StringTokenizer rightTokenizer;
  private   String          currentFunction;
  private   boolean         waitingCurrentFunctionLine;
  private   boolean         dataAlreadyRead;

  /** Simple constructor.
   * Build a parser for the given file.
   * @param input input file to parse
   * @exception FileNotFoundException if the input file cannot be found
      */
  public AbstractGprofProfileParser (File input) throws FileNotFoundException {

    FileInputStream   fis      = new FileInputStream(input);
    InputStreamReader isr      = new InputStreamReader(fis);
    reader                     = new BufferedReader(isr);
    lineNo                     = 0;
    line                       = null;
    splitIndex                 = -1;
    leftTokenizer              = null;
    rightTokenizer             = null;
    currentFunction            = null;
    waitingCurrentFunctionLine = true;
    dataAlreadyRead            = false;
  }

  /** Generate a parse error.
   * @param details an explanation to add to the message
   * @exception ParseException always thrown
   */
  protected void parseError (String details) throws ParseException {
    StringBuffer message = new StringBuffer ("parse error at line ");

    message.append(lineNo);
    message.append(System.getProperty("line.separator"));
    message.append(line);
    message.append(System.getProperty("line.separator"));
    message.append(details);

    throw new ParseException(message.toString());
  }

  /** Read a line.
   * This method reads a line in the input file and initializes the
   * left and right tokenizers with its content.
   * @exception IOException if an input/output error occurs
   * @exception ParseException if a parse error occurs */
  protected void readLine () throws IOException, ParseException {
    if (reader == null)
      throw new ParseException("no data stream available");

    line = reader.readLine();

    if (line == null) {
      stopParsing();
      throw new ParseException("unexpected end of file after line " + lineNo);
    } else {
      if (splitIndex < 0 || line.length() <= splitIndex) {
        leftTokenizer  = new StringTokenizer(line);
        rightTokenizer = new StringTokenizer("");
      } else {
        leftTokenizer  = new StringTokenizer(line.substring(0, splitIndex));
        rightTokenizer = new StringTokenizer(line.substring(splitIndex, line.length()));
      }
      ++lineNo;
    }
  }

  /** Parse the header lines (this part varies among implementations).
   * @exception IOException if an input/output error occurs
   * @exception ParseException if a parse error occurs
   */
  protected abstract void parseHeader() throws IOException, ParseException;

  /** Extract the signature of a function from the right part of the line.
   * @return function signature
   * @exception ParseException if a parse error occurs
   */
  private String extractFunctionSignature() throws ParseException {
    // check there are at least two fields in the right part of the line
    if (rightTokenizer.countTokens() < 2)
      parseError("unexpected end of line");

    // build the function signature form the first fields of
    // the right part of the line
    StringBuffer name = new StringBuffer (line.length() - splitIndex);
    while (rightTokenizer.countTokens() > 1) {
      if (name.length() > 1)
        name.append(' ');
      name.append(rightTokenizer.nextToken());
    }

    // check the last field
    String lastToken = rightTokenizer.nextToken();
    if ((lastToken.charAt(0) != '[')
        || (lastToken.charAt(lastToken.length() - 1) != ']'))
      parseError("last field doesn't look like an index field");

    return name.toString();
  }

  /** Get the next invocation line from the file.
   * @return a new invocation line, or null if there is no more relevant data in the file
   * @exception ParseException if there is a parsing error
   */
  public InvocationLine nextInvocationLine () throws ParseException {

    try {
      // this is the first time through, we should handle the header
      if (lineNo == 0) {
        parseHeader();

        // we are at the beginning of a multi-line entry
        currentFunction            = null;
        waitingCurrentFunctionLine = true;
      }

      // looking for a data line
      while (true) {
        // the gprof output format has a bit of redundancy
        // each function entry has the following form :
        //                               333321             MyClass::g(int) [3]
        //                 0.14    0.04  333334/1333334     main [1]
        //                 0.42    0.12 1000000/1333334     MyClass::f(int) [2]
        // [3]     64.9    0.56    0.16 1333334+333321  MyClass::g(int) [3]
        //                 0.16    0.00 1666655/1666655     MyClass::h(int) [4]
        //                               333321             MyClass::g(int) [3]
        // -----------------------------------------------
        //
        // the first few lines are the callers of the current function
        // the middle line is the current function
        // the last lines are the functions called by the current function
        // each entry including the last one is followed by a line of dashes
        //
        // So each invocation appears twice, once in the caller entry
        // (in the last lines) and once in the callee entry (in the
        // first lines). This can be in the same entry if the function
        // calls itself recursively (as in the example above). It is
        // therefore sufficient to parse the last lines only.
        while (waitingCurrentFunctionLine) {

          readLine();

          if (line.equals("\f")) {
            // we have reached the end of the interesting data
            stopParsing();
            return null;
          }

          if (leftTokenizer.hasMoreTokens()) {
            String firstToken = leftTokenizer.nextToken();
            if ((firstToken.charAt(0) == '[')
                && (firstToken.charAt(firstToken.length() - 1) == ']')) {
              // we have reached the entry for the current function

              currentFunction            = extractFunctionSignature();
              waitingCurrentFunctionLine = false;
              dataAlreadyRead            = true;
            }
          }
        }

        // read the next line in the entry
        readLine();

        if (leftTokenizer.countTokens() > 0 || rightTokenizer.countTokens() > 0) {
          // there is something in the line

          if (line.startsWith("----------")) {
            // we have reached the end of the current entry
            currentFunction            = null;
            waitingCurrentFunctionLine = true;
          } else {
            try {
              // format checks, the left part of the line should contain
              // either two timing fields and one calls number field or
              // only the calls number field
              long time = 0l;
              if (leftTokenizer.countTokens() == 3) {
                // we have read an invocation line with all timings data
                Double self  = new Double(leftTokenizer.nextToken());
                Double child = new Double(leftTokenizer.nextToken());
                double total = self.doubleValue() + child.doubleValue();

                // we count the time in microseconds
                time = Math.round(total * 1.0e6);
              }

              if (leftTokenizer.countTokens() != 1)
                parseError("wrong number of fields in the left part of the line");

              // removing the second part of xxxx/yyyy calls number field
			  long calls = Long.parseLong(leftTokenizer.nextToken("/+ \t"));	
			  // UCD 3/13/05: added plus sign on advice by Guilhem Bonnefille		
			  // apparently, Suns gprof sometimes uses plus signs instead of slashes
              //long calls = Long.parseLong(leftTokenizer.nextToken("/ \t"));

              // build the name
              String name = extractFunctionSignature();

              // we have successfully parsed a line
              return new InvocationLine(time, calls, name, currentFunction);

            } catch (NumberFormatException nfe) {
              parseError(nfe.getMessage());
            }
          }
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
      if (reader != null)
        reader.close();
    } catch (IOException e) {}
    reader          = null;
    leftTokenizer   = null;
    rightTokenizer  = null;
    line            = null;
    currentFunction = null;
  }

  public int getLineNo() {
  	return lineNo;
  }
}
