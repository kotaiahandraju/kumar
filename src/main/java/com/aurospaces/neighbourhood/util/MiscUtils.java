package com.aurospaces.neighbourhood.util;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
public class MiscUtils
{
	public static long getTimeNow() {
		return System.currentTimeMillis();
	}

	public static Date getDate(int days) {
		long eachDay = 24 * 60 * 60 * 1000;
		if (days == 2) {
			return new Date(eachDay * 2 + getTimeNow());
		} else if (days == 1) {
			return new Date(eachDay * 1 + getTimeNow());
		} else
			return new Date();
	}

	public static Date getDate(String dayDesc) {
		if (dayDesc.equals("Today")) {
			return getDate(0);
		} else if (dayDesc.equals("Tomorrow")) {
			return getDate(1);
		}
		return getDate(2);
	}

	public static Date getDate2(String dayDesc) {
		if (dayDesc.equals("dayafter")) {
			return getDate(2);
		} else if (dayDesc.equals("tmrw")) {
			return getDate(1);
		}
		return getDate(0);
	}


	public static String bigRandomString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	public static int bigRandomStringLen = bigRandomString.length() - 1;
	public static Random rd = new Random();



	public static String generateRandomString(int len)
	{
		StringBuilder bld = new StringBuilder();
		for(int i = 0 ; i < len ; i++)
		{
			int locSet = Math.round((bigRandomStringLen * rd.nextFloat()));	
			bld.append(bigRandomString.charAt(locSet));
		}
		return bld.toString();
	}



	public static String getBaseUrl(HttpServletRequest request)
	{
	  return request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath(); 
	}

	public static String genOtp()
	{
		String tempStr = System.currentTimeMillis() + "";
		String otp = tempStr.substring(7);
		return otp;
	}
	public static String getClientIpAddress(HttpServletRequest request) {
	    String xForwardedForHeader = request.getHeader("X-Forwarded-For");
	    if (xForwardedForHeader == null) {
	        return request.getRemoteAddr();
	    } else {
	        // As of https://en.wikipedia.org/wiki/X-Forwarded-For
	        // The general format of the field is: X-Forwarded-For: client, proxy1, proxy2 ...
	        // we only want the client
	        return new StringTokenizer(xForwardedForHeader, ",").nextToken().trim();
	    }
	}
}
