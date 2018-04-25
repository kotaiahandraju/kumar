package com.aurospaces.neighbourhood.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;


public class KhaibarGasUtil {
	public static Date  dateFormate(String date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMMM-yyyy");
		Date date1 = null;
		if(StringUtils.isNotBlank(date)){
					 try {
						date1 = formatter.parse(date);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		return date1;
		}
	public static String  monthFormate(String date){
		String month_name = null;
		if(StringUtils.isNotBlank(date)){
					 try {
						 Calendar cal=Calendar.getInstance();
						 SimpleDateFormat month_date = new SimpleDateFormat("MMM-yyyy");
						 month_name = month_date.format(cal.getTime());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		return month_name;
		}
	/*public  String  sessionChecking(HttpSession session){
		String sessionUser = null;
//		UsersBean objuserBean = null;
		try{
			UsersBean objuserBean =(UsersBean) session.getAttribute("cacheUserBean");
			if(objuserBean != null){
				if(Integer.parseInt(objuserBean.getRolId()) == 1){
					sessionUser = "admin";
					return sessionUser;
					}
					if(Integer.parseInt(objuserBean.getRolId()) == 3){
						sessionUser = "employee";
						return sessionUser;
						}
			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sessionUser;
		
	}
	*/
	
	private static final char[] CHARSET_AZ_09 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();

	public static String randomString(char[] characterSet, int length) {
		SecureRandom random = new SecureRandom();
		char[] result = new char[length];
		for (int i = 0; i < result.length; i++) {
			// picks a random index out of character set > random character
			int randomCharIndex = random.nextInt(characterSet.length);
			result[i] = characterSet[randomCharIndex];
		}
		return new String(result);
	}

	public  String randNum() {
		String randNum = randomString(CHARSET_AZ_09, 5);
		return randNum;

	}
	/*public static  UsersBean  getLoginSession(HttpSession session){
		UsersBean objuserBean = null;
		try{
			 objuserBean =(UsersBean) session.getAttribute("cacheUserBean");
		}catch(Exception e){
			e.printStackTrace();
		}
		return objuserBean;
		
	}*/
	public static boolean doesURLExist(URL url) throws IOException
	{
		
	    // We want to check the current URL
	    HttpURLConnection.setFollowRedirects(false);

	    HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

	    // We don't need to get data
	    httpURLConnection.setRequestMethod("HEAD");

	    // Some websites don't like programmatic access so pretend to be a browser
	    httpURLConnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2 (.NET CLR 3.5.30729)");
	    int responseCode = httpURLConnection.getResponseCode();

	    // We only accept response code 200
	    return responseCode == HttpURLConnection.HTTP_OK;
	}
	
	/*public  UsersBean  getUserLoginSession(HttpSession session){
		UsersBean objuserBean = null;
		try{
			 objuserBean =(UsersBean) session.getAttribute("cacheUserBean");
			if(objuserBean != null){
					return objuserBean;
			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return objuserBean;
		
	}*/
}
