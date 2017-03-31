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

import java.util.*;

public class Method {

    String name;
    MethodSignature signature;
    long totalTime, totalCalls;
    long sumInvocationTimeCallees;
    List callees, callers;
    InvocationComparator calleeSort, callerSort;

	public Method (String s, boolean canDecode) {
		name = s;
		signature = new MethodSignature(name, canDecode);
		callees = new ArrayList();
		callers = new ArrayList();
	}

	public void addCaller (Invocation inv) {
		callers.add(inv);
		totalCalls += inv.calls;
		totalTime += inv.time;
	}

	public void addCallee (Invocation inv) {
		callees.add(inv);
		calleeSort = null;
		totalTime -= inv.time;
		sumInvocationTimeCallees += inv.time;
	}

	// YK
	public void checkTotalTime() {
		if (totalTime < 0) {		// For top level method with unknown caller.
			totalTime = 0;		// Otherwise it ends up with the negative total time
		}				// resulting in a zero overall total time.
	}

	public String getName() { return name; }

	public String getName (boolean decode, boolean showParameters) {
		String tmp = (decode ? getDecodedName() : name);
		if (showParameters) {
			return tmp;
		} else {
			int idx = tmp.indexOf(decode ? " " : "(");
			return (idx==-1 ? tmp : tmp.substring(0, idx));
		}
	}

	private String getDecodedName() { return signature.getDecodedSignature(); }

	public String toString (boolean includeTimesCallee, boolean decode, boolean showParameters) {
		return AcmeFmt.fmt(getTime(includeTimesCallee), 8) + " " + AcmeFmt.fmt(totalCalls, 6) + " " + getName(decode, showParameters);
	}

        /**
         * Print difference of method values compared to arguments
	 * FIXME: What to do whith calls???
         */
	public String toStringDiff (long sumTime, long sumCalls, boolean includeTimesCallee, boolean decode, boolean showParameters) {
		return AcmeFmt.fmt(sumTime - getTime(includeTimesCallee), 8) 
		    + " " + AcmeFmt.fmt(sumCalls - totalCalls, 6) + " " + getName(decode, showParameters);
	}

	public String toString (long time, long calls, boolean includeTimesCallee, boolean decode, boolean showParameters) {
		long t = (long) (((float) getTime(includeTimesCallee) / (float) time) * 1000F);
		long c = (long) (((float) totalCalls / (float) calls) * 1000F);
		return AcmeFmt.fmt((float) t / 10, 8) + "% " + AcmeFmt.fmt((float) c / 10, 6) + "% " + getName(decode, showParameters);
		/*
		String timeStr = Float.toString((float) t / 10F);
		String callsStr = Float.toString((float) c / 10F);
		if (timeStr.indexOf(".") == -1)
			timeStr = timeStr + ".0";
		if (callsStr.indexOf(".") == -1)
			callsStr = callsStr + ".0";
		return AcmeFmt.fmt(timeStr, 8) + "% " + AcmeFmt.fmt(callsStr, 6) + "% " + name;
		*/
	}

	public String toString (long callerTime, long time, long calls, boolean includeTimesCallee, boolean decode, boolean showParameters) {
		long myTime = getTime(includeTimesCallee);
		long ct = (long) (((float) myTime / (float) callerTime) * 1000F);
		long t = (long) (((float) myTime / (float) time) * 1000F);
		long c = (long) (((float) totalCalls / (float) calls) * 1000F);
		return AcmeFmt.fmt((float) ct / 10, 6) + "%(" + AcmeFmt.fmt((float) t / 10, 5) + "%)" 
		    + AcmeFmt.fmt((float) c / 10, 6) + "% " + getName(decode, showParameters);
	}

	public long getTime(boolean includeTimesCallee) { 
	    // for top level method
	    //	    if (totalTime < sumInvocationTimeCallees)
	    //return 0;
	    return (includeTimesCallee) ? totalTime + sumInvocationTimeCallees : totalTime;
	}

	public long getCalls() { return totalCalls; }

	public List getCallers (InvocationComparator ic) {
		if (ic != callerSort) {
			Collections.sort(callers, ic);
			callerSort = ic;
		}
		return callers;
	}

	public List getCallees (InvocationComparator ic) {
		if (ic != calleeSort) {
			Collections.sort(callees, ic);
			calleeSort = ic;
		}
		return callees;
	}

}
