package com.aurospaces.neighbourhood.service1;


public class geotag {
	public 	 double x;
	 public double y;

	 public geotag()
	 {
	 	x = 0.0;
	 	y = 0.0;
	 }

	 public geotag(String strX, String strY)
	 {
	 	x = Double.parseDouble(strX);
	 	y = Double.parseDouble(strY);
	 }
}
