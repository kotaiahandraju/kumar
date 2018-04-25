package com.aurospaces.context;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import java.util.Enumeration;



import java.sql.*;




public class AppContextListener implements ServletContextListener{
 
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("ServletContextListener destroyed");
		 Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                //LOG.log(Level.INFO, String.format("deregistering jdbc driver: %s", driver));
            } catch (SQLException e) {
                //LOG.log(Level.SEVERE, String.format("Error deregistering driver %s", driver), e);
            }

        }
	}
 
        //Run this before web application is started
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("ServletContextListener started");	
	}
}
