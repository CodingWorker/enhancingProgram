/**
 *   MethodSignature.java - decode profile method signature
 *
 *   Copyright (C) 2001  Carsten Heyl
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
 *
 */

import java.util.StringTokenizer;

/*
 * Note the decoding is incomplete because I just added the codings I found
 * in my programs so far ... (alph) If no decoding is possible the encoded part is used.
 */

public class MethodSignature {
    private String sig;
    private String decoded;
    
    public MethodSignature (String encodedSignature, boolean canDecode) {
		sig = encodedSignature;
		if (canDecode)
			decoded = decode(sig);
		else
			decoded = sig;
    }

    public String getEncodedSignature() {
		return sig;
    }

    public String getDecodedSignature() {
		return decoded;
    }
    /**
     *
     classp1/classp2/.../classpn.<methodname>([<encparam1>[<encparam2>]...])<encresult>
     */
    private String decode (String s) {
		String res = s;
		try {
			res = xdecode(s);
		} catch(StringIndexOutOfBoundsException e) {
			System.err.println("decoding error: '"+s+"'");
			e.printStackTrace(System.err);
		}
		return res;
    }

	private String xdecode (String s) {
		StringBuffer sb = new StringBuffer(s.length() * 2);
		int dot = s.indexOf(".");

		if (dot < 0)
			return s;

		String className = s.substring(0, dot);
		// better readable with "/"
		// className = className.replace('/', '.');
		int par1 = s.indexOf('(', dot);
		if (par1 < 0)
			return s;
		int par2 = s.indexOf(')', par1);
		if (par2 < 0)
			return s;
		String methodName = s.substring(dot+1, par1);
		if (methodName.equals("<init>"))
			methodName = "constructor";
		else if (methodName.equals("<clinit>"))
			methodName = "static initializer";
		String args = s.substring(par1+1, par2);
		String res = s.substring(par2+1);

		if (!args.equals("")) {
			StringBuffer decodedArgs = new StringBuffer(80);
			boolean arrayOpen = false;
			boolean classOpen = false;
			StringBuffer argClassName = new StringBuffer(20);
			StringTokenizer st = new StringTokenizer(args, "[ICZL;", true);
			while (st.hasMoreTokens()) {
				String tok = st.nextToken();
					
				if (tok.equals("[")) {
					arrayOpen = true;
				} else if (classOpen) {
					if (tok.equals(";")) {
						if (decodedArgs.length() > 0)
							decodedArgs.append(",");
						s = argClassName.toString();
						argClassName.setLength(0);
						s = s.replace('/','.');
						decodedArgs.append(s);
						classOpen = false;
						if (arrayOpen) {
							decodedArgs.append("[]");
							arrayOpen = false;
						}
					} else {
						argClassName.append(tok);
					}
				} else if (tok.equals("L")) {
					classOpen = true;
				} else {
					if (decodedArgs.length() > 0)
						decodedArgs.append(",");
					decodedArgs.append(decodeType(tok));
					if (arrayOpen) {
						decodedArgs.append("[]");
						arrayOpen = false;
					}
				}
			}
			args = decodedArgs.toString();
		}

		sb.append(className);
		sb.append(".");
		sb.append(methodName);
		sb.append(" (");
		sb.append(args);
		sb.append("): ");
		sb.append(decodeType(res));
		
		return sb.toString();
    }

	private String decodeType (String s) {
		if (s.equals("I"))
			return "int";
		if (s.equals("C"))
			return "char";
		if (s.equals("V"))
			return "void";
		if (s.equals("Z"))
			return "boolean";
		if (s.equals("F"))
			return "float";
		if (s.equals("D"))
			return "double";
		if (s.equals("L") || s.equals("J"))		// UD: J seems to mean long; haven't seen L myself
			return "long";
		if (s.equals("S"))
			return "short";
		if (s.equals("B"))
			return "byte";

		// an Object?
		if (s.startsWith("L")) {
			s = s.substring(1, s.length()-1);
			return s.replace('/','.');
		}
		// an Array?
		if (s.startsWith("[")) {
			return decodeType(s.substring(1))+"[]";
		}
		return s;
    }
}
