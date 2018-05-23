package CommonUtils;


import java.text.SimpleDateFormat;
import java.util.Date;

public class ToDate {
  public static void main(String args[]) {
    Date date = new Date();
    String DATE_FORMAT = "MM";
    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
    System.out.println("Today is " + sdf.format(date));
  }
}