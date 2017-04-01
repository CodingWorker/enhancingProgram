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

public class Invocation {

	public long time, calls;
	public Method callee, caller;
	public boolean isRecursive;

	public String toString() {
		return callee.getName() + " called by " + caller.getName() + " " + " " + calls + " times for " + time + " ms";
	}

	public Invocation (long time, long calls, Method callee, Method caller) {
		this.time = time;
		this.calls = calls;
		this.callee = callee;
		this.caller = caller;
		this.isRecursive = (callee == caller);
	}

	public String callerString (boolean decode, boolean showParameters) {
		return "" + AcmeFmt.fmt(time, 8) + " " + AcmeFmt.fmt(calls, 6) + " " + caller.getName(decode, showParameters);
	}

	public String callerString (long totalTime, long totalCalls, boolean decode, boolean showParameters) {
		long bigTime = (long)(((float) time / (float) totalTime) * 1000F);
		long bigCalls = (long)(((float) calls / (float) totalCalls) * 1000F);
		return "" + AcmeFmt.fmt((float) bigTime / 10, 8) + "% " 
		    + AcmeFmt.fmt((float) bigCalls / 10, 6) + "% " 
		    + caller.getName(decode, showParameters);
		/*
		String sTime = Float.toString((float) bigTime / 10F);
		String sCalls = Float.toString((float) bigCalls / 10F);
		if(sTime.indexOf('.') == -1)
			sTime = sTime + ".0";
		if(sCalls.indexOf('.') == -1)
			sCalls = sCalls + ".0";
		return "" + AcmeFmt.fmt(sTime, 8) + "% " + AcmeFmt.fmt(sCalls, 6) + "% " + caller.getName();
		*/
	}

	public String calleeString (boolean decode, boolean showParameters) {
		return "" + AcmeFmt.fmt(time, 8) + " " + AcmeFmt.fmt(calls, 6) + " " 
		    + callee.getName(decode, showParameters);
	}

	public String calleeString (long totalTime, long totalCalls, boolean decode, boolean showParameters) {
		long bigTime = (long) ((float) (this.time)/totalTime*1000);
		long bigCalls = (long) ((float) (this.calls)/totalCalls*1000);
		return "" + AcmeFmt.fmt((float) bigTime/10, 8) + "% " 
		    + AcmeFmt.fmt((float) bigCalls/10, 6) + "% " 
		    + callee.getName(decode, showParameters);
	} 

	public String calleeString (long totalCallerTime, long totalTime, long totalCalls, boolean decode, boolean showParameters) {
		long bigCallerTime = (long) ((float) (this.time)/totalCallerTime*1000);
		long bigTime = (long) ((float) (this.time)/totalTime*1000);
		long bigCalls = (long) ((float) (this.calls)/totalCalls*1000);
		return "" 
		    + AcmeFmt.fmt((float) bigCallerTime/10, 6) + "%(" + AcmeFmt.fmt((float) bigTime/10, 5) + "%)"
		    + AcmeFmt.fmt((float) bigCalls/10, 6) + "% " 
		    + callee.getName(decode, showParameters);
	} 

}

