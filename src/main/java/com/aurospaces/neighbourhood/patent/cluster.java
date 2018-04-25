package com.aurospaces.neighbourhood.patent; 


import java.util.ArrayList;


public class cluster {

	double center_x; // latitude of the center of the cluster
	double center_y; // longitude of the center of the cluster
	double sumx; // sum of x co-ordinates of all the units in that cluster (latitudes)
	double sumy; // sum of y co-ordinates of all the units in that cluster (longitudes)
	int size; // nummber of units  in this cluster
	double weightage; // not used currently
	ArrayList<unit> members;     // ideally it should be vendors
	ArrayList<unit> cunit_list;  // customer unit list
	ArrayList<unit> bunit_list;  // business unit list
	double radius;



    cluster()
    {
    	center_x = 0;
    	center_y = 0;
    	sumx=0;sumy=0;size=0;
    	members= new ArrayList<unit>();
    	cunit_list= new ArrayList<unit>();
    	bunit_list= new ArrayList<unit>();
    }
	void add(unit a)
	{
		members.add(a);
		return;
	}	

	void addAs_cunit(unit a)
	{
		cunit_list.add(a);
	return;
	}

	void addAs_bunit(unit a)
	{
	bunit_list.add(a);
	return;
	}

	void clear()
	{
		members.clear();
		return;
	}
}

