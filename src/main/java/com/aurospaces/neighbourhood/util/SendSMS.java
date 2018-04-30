package com.aurospaces.neighbourhood.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;

import javax.servlet.ServletContext;

public class SendSMS {
	
   //public  String  mobileNumber =null;
	
    
     //public String message=null;
    
    
    public static String sendSMS(String message, String mobileNumber,ServletContext objContext) throws IOException
	{
    	 String username = null;
    	 String password = null;
    	 String from = null ;
    	//static String from = "AARNA-MATRIMONY";
         String requestUrl = null;
         String toAddress = null;
    	InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
		 String response = null;
		 try{
			 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
				input = new FileInputStream(propertiespath);
				// load a properties file
				prop.load(input);
				 username = prop.getProperty("smsusername");
				 password= prop.getProperty("smspassword");
				 from = prop.getProperty("smssenderfrom");
		System.out.println("hello sms class");
		requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobileNumber, "UTF-8")+"&message="+URLEncoder.encode(message, "UTF-8")+"&sms_type=2";
        URL url = new URL(requestUrl);
        HttpURLConnection uc = (HttpURLConnection)url.openConnection();
         response = uc.getResponseMessage();
        System.out.println("SMS response:"+response);
        uc.disconnect();
		 }catch( Exception e){
			 e.printStackTrace();
		 }
        return response;
	}


}
