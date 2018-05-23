package CommonUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;


public class CommonUtils {
	public static String getAutoGenId(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public static String getDate() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar cal = Calendar.getInstance();
		 String regDate = dateFormat.format(cal.getTime());
		return regDate;
	}
	public static String generatePIN() 
	{   
	    int x = (int)(Math.random() * 4);
	    x = x + 1;
	    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
	    return randomPIN;
	}
	public static String getIndainDate(String sDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		 String regDate = dateFormat.format(sDate);
		return regDate;
	}
	
	public static String getYear() {

		Date date = new Date();
	    String DATE_FORMAT = "yy";
	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		 String regDate = sdf.format(date);
		return regDate;
	}
	public static String getMonth() {

		Date date = new Date();
	    String DATE_FORMAT = "MM";
	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		 String regDate = sdf.format(date);
		return regDate;
	}
}
