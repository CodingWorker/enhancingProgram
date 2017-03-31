/**
 *   ProfileViewer - graphically displays java.prof output
 *
 *   Copyright (C) 1996 by Jef Poskanzer
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
 
/* This class has been adapted from the Acme.Fmt class written by Jef Poskanzer.
   See the following copyright notice amd disclaimer. */

// Fmt - some simple single-arg sprintf-like routines
//
// Copyright (C) 1996 by Jef Poskanzer <jef@acme.com>.  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
// OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Visit the ACME Labs Java page for up-to-date versions of this and other
// fine Java utilities: http://www.acme.com/java/

/** Some simple single-arg sprintf-like routines.
 * <P>
 * It is apparently impossible to declare a Java method that accepts
 * variable numbers of any type of argument.  You can declare it to take
 * Objects, but numeric variables and constants are not in fact Objects.
 * <P>
 * However, using the built-in string concatenation, it's almost as
 * convenient to make a series of single-argument formatting routines.
 * <P>
 * AcmeFmt can format the following types:
 * <BLOCKQUOTE><CODE>
 * byte short int long float double char String Object
 * </CODE></BLOCKQUOTE>
 * For each type there is a set of overloaded methods, each returning
 * a formatted String.  There's the plain formatting version:
 * <BLOCKQUOTE><PRE>
 * AcmeFmt.fmt(x)
 * </PRE></BLOCKQUOTE>
 * There's a version specifying a minimum field width:
 * <BLOCKQUOTE><PRE>
 * AcmeFmt.fmt(x, minWidth)
 * </PRE></BLOCKQUOTE>
 * And there's a version that takes flags:
 * <BLOCKQUOTE><PRE>
 * AcmeFmt.fmt(x, minWidth, flags)
 * </PRE></BLOCKQUOTE>
 * Currently available flags are:
 * <BLOCKQUOTE><PRE>
 * AcmeFmt.ZF - zero-fill
 * AcmeFmt.LJ - left justify
 * </PRE></BLOCKQUOTE>
 * <P>
 * For doubles and floats, there's a significant-figures parameter before the flags:
 * <BLOCKQUOTE><PRE>
 * AcmeFmt.fmt(d)
 * AcmeFmt.fmt(d, minWidth)
 * AcmeFmt.fmt(d, minWidth, sigFigs)
 * AcmeFmt.fmt(d, minWidth, sigFigs, flags)
 * </PRE></BLOCKQUOTE>
 */

public class AcmeFmt {

    /** Flags. */
    /** Zero-fill. */
    public static final int ZF = 1;
    /** Left justify. */
    public static final int LJ = 2;
    /** Was a number - internal use. */
    private static final int WN = 16;

    /** byte */
    public static String fmt (byte b) { return fmt(b, 0, 0); }
    public static String fmt (byte b, int minWidth) { return fmt(b, minWidth, 0); }
    public static String fmt (byte b, int minWidth, int flags) {
		return fmt(Integer.toString(b & 0xff), minWidth, flags|WN);
	}

    /** short */
    public static String fmt (short s) { return fmt(s, 0, 0); }
    public static String fmt (short s, int minWidth) { return fmt(s, minWidth, 0); }
    public static String fmt (short s, int minWidth, int flags) {
		return fmt(Integer.toString(s), minWidth, flags|WN);
	}

    /** int */
    public static String fmt (int i) { return fmt(i, 0, 0); }
    public static String fmt (int i, int minWidth) { return fmt(i, minWidth, 0); }
    public static String fmt (int i, int minWidth, int flags) {
		return fmt(Integer.toString(i), minWidth, flags|WN);
	}

    /** long */
    public static String fmt (long l) { return fmt(l, 0, 0); }
    public static String fmt (long l, int minWidth) { return fmt(l, minWidth, 0); }
    public static String fmt (long l, int minWidth, int flags) {
		return fmt(Long.toString(l), minWidth, flags|WN);
	}

    /** float */
    public static String fmt (float f) { return fmt(f, 0, 0, 0); }
    public static String fmt (float f, int minWidth) { return fmt(f, minWidth, 0, 0); }
    public static String fmt (float f, int minWidth, int sigFigs) {
		return fmt(f, minWidth, sigFigs, 0);
	}
    public static String fmt (float f, int minWidth, int sigFigs, int flags) {
		if (sigFigs != 0)
			return fmt(sigFigFix(Float.toString(f), sigFigs), minWidth, flags|WN);
		else
			return fmt(Float.toString(f), minWidth, flags|WN);
	}

    /** double */
    public static String fmt (double d) { return fmt(d, 0, 0, 0); }
    public static String fmt (double d, int minWidth) { return fmt(d, minWidth, 0, 0); }
    public static String fmt (double d, int minWidth, int sigFigs) {
		return fmt(d, minWidth, sigFigs, 0);
	}
    public static String fmt (double d, int minWidth, int sigFigs, int flags) {
		if (sigFigs != 0)
			return fmt(sigFigFix(Double.toString(d), sigFigs), minWidth, flags|WN);
		else
			return fmt(Double.toString(d), minWidth, flags|WN);
	}

    /** char */
    public static String fmt (char c) { return fmt(c, 0, 0); }
    public static String fmt (char c, int minWidth) { return fmt(c, minWidth, 0); }
    public static String fmt (char c, int minWidth, int flags) {
		// return fmt(Character.toString(c), minWidth, flags);
		// Character currently lacks a static toString method.  Workaround
		// is to make a temporary instance and use the instance toString.
		return fmt(new Character(c).toString(), minWidth, flags);
	}

    /** String */
    public static String fmt (String s) { return fmt(s, 0, 0); }
    public static String fmt (String s, int minWidth) { return fmt(s, minWidth, 0); }
    public static String fmt (String s, int minWidth, int flags) {
		int len = s.length();
		boolean zeroFill = ((flags & ZF) != 0);
		boolean leftJustify = ((flags & LJ) != 0);
		boolean wasNumber = ((flags & WN) != 0);
		if ((zeroFill) && ! wasNumber)
			throw new InternalError("AcmeFmt: number flag on a non-number");
		if (zeroFill && leftJustify)
			throw new InternalError("AcmeFmt: zero-fill left-justify is silly");
		if (len >= minWidth)
			return s;
		int fillWidth = minWidth - len;
		StringBuffer fill = new StringBuffer(fillWidth);
		for (int i = 0; i < fillWidth; ++i)
			if (zeroFill)
				fill.append('0');
			else
				fill.append(' ');
		if (leftJustify)
			return s + fill;
		else if (zeroFill && s.startsWith("-"))
			return "-" + fill + s.substring(1);
		else
			return fill + s;
	}

	/** Internal routines. */

    private static String sigFigFix (String s, int sigFigs) {
		// First dissect the floating-point number string into sign,
		// integer part, fraction part, and exponent.
		String sign;
		String unsigned;
		if (s.startsWith("-") || s.startsWith("+")) {
			sign = s.substring(0, 1);
			unsigned = s.substring(1);
		} else {
			sign = "";
			unsigned = s;
		}
		String mantissa;
		String exponent;
		int eInd = unsigned.indexOf('e');
		if (eInd == -1)	// it may be 'e' or 'E'
			eInd = unsigned.indexOf('E');
		if (eInd == -1) {
			mantissa = unsigned;
			exponent = "";
		} else {
			mantissa = unsigned.substring(0, eInd);
			exponent = unsigned.substring(eInd);
		}
		StringBuffer number, fraction;
		int dotInd = mantissa.indexOf('.');
		if (dotInd == -1) {
			number = new StringBuffer(mantissa);
			fraction = new StringBuffer("");
		} else {
			number = new StringBuffer(mantissa.substring(0, dotInd));
			fraction = new StringBuffer(mantissa.substring(dotInd + 1));
		}

		int numFigs = number.length();
		int fracFigs = fraction.length();
		if ((numFigs == 0 || number.equals("0")) && fracFigs > 0) {
			// Don't count leading zeros in the fraction.
			numFigs = 0;
			for (int i = 0; i < fraction.length(); ++i) {
			if (fraction.charAt(i) != '0')
				break;
				--fracFigs;
			}
		}
		int mantFigs = numFigs + fracFigs;
		if (sigFigs > mantFigs) {
			// We want more figures; just append zeros to the fraction.
			for (int i = mantFigs; i < sigFigs; ++i)
				fraction.append('0');
		} else if (sigFigs < mantFigs && sigFigs >= numFigs) {
			// Want fewer figures in the fraction; chop.
			fraction.setLength(
			fraction.length() - (fracFigs - (sigFigs - numFigs)));
			// Round?
		} else if (sigFigs < numFigs) {
			// Want fewer figures in the number; turn them to zeros.
			fraction.setLength(0);	// should already be zero, but make sure
			for (int i = sigFigs; i < numFigs; ++i)
				number.setCharAt(i, '0');
			// Round?
		}
		// Else sigFigs == mantFigs, which is fine.

		if (fraction.length() == 0)
			return sign + number + exponent;
		else
			return sign + number + "." + fraction + exponent;
	}


    /// Test program.
    public static void main(String[] args) {
		System.out.println("Starting tests.");
		show(AcmeFmt.fmt("Hello there."));
		show(AcmeFmt.fmt(123));
		show(AcmeFmt.fmt(123, 10));
		show(AcmeFmt.fmt(123, 10, AcmeFmt.ZF));
		show(AcmeFmt.fmt(123, 10, AcmeFmt.LJ));
		show(AcmeFmt.fmt(-123));
		show(AcmeFmt.fmt(-123, 10));
		show(AcmeFmt.fmt(-123, 10, AcmeFmt.ZF));
		show(AcmeFmt.fmt(-123, 10, AcmeFmt.LJ));
		show(AcmeFmt.fmt('c'));
		show(AcmeFmt.fmt(123.456F));
		show(AcmeFmt.fmt(123456000000000000.0F));
		show(AcmeFmt.fmt(123.456F, 0, 8));
		show(AcmeFmt.fmt(123.456F, 0, 7));
		show(AcmeFmt.fmt(123.456F, 0, 6));
		show(AcmeFmt.fmt(123.456F, 0, 5));
		show(AcmeFmt.fmt(123.456F, 0, 4));
		show(AcmeFmt.fmt(123.456F, 0, 3));
		show(AcmeFmt.fmt(123.456F, 0, 2));
		show(AcmeFmt.fmt(123.456F, 0, 1));
		show(AcmeFmt.fmt(123456000000000000.0F, 0, 4));
		show(AcmeFmt.fmt(-123.456F, 0, 4));
		show(AcmeFmt.fmt(-123456000000000000.0F, 0, 4));
		show(AcmeFmt.fmt(123.0F));
		show(AcmeFmt.fmt(123.0D));
		show(AcmeFmt.fmt(1.234567890123456789F));
		show(AcmeFmt.fmt(1.234567890123456789D));
		show(AcmeFmt.fmt(1234567890123456789F));
		show(AcmeFmt.fmt(1234567890123456789D));
		show(AcmeFmt.fmt(0.000000000000000000001234567890123456789F));
		show(AcmeFmt.fmt(0.000000000000000000001234567890123456789D));
		show(AcmeFmt.fmt(12300.0F));
		show(AcmeFmt.fmt(12300.0D));
		show(AcmeFmt.fmt(123000.0F));
		show(AcmeFmt.fmt(123000.0D));
		show(AcmeFmt.fmt(1230000.0F));
		show(AcmeFmt.fmt(1230000.0D));
		show(AcmeFmt.fmt(12300000.0F));
		show(AcmeFmt.fmt(12300000.0D));
		show(AcmeFmt.fmt(Float.NaN));
		show(AcmeFmt.fmt(Float.POSITIVE_INFINITY));
		show(AcmeFmt.fmt(Float.NEGATIVE_INFINITY));
		show(AcmeFmt.fmt(Double.NaN));
		show(AcmeFmt.fmt(Double.POSITIVE_INFINITY));
		show(AcmeFmt.fmt(Double.NEGATIVE_INFINITY));
		show(AcmeFmt.fmt(1.0F / 8.0F));
		show(AcmeFmt.fmt(1.0D / 8.0D));
		System.out.println("Done with tests.");
	}

    private static void show(String str) {
		System.out.println("#" + str + "#");
	}

}
