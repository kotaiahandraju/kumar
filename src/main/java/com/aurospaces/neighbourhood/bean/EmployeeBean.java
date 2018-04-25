package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class EmployeeBean 
{
protected int id   = 0;
protected Date employeeCrTime ;
protected Date employeeUpTime ;
protected String employeename ;
protected String status ; 
protected String employeeStatus ; 



public String getEmployeeStatus() {
	return employeeStatus;
}
public void setEmployeeStatus(String employeeStatus) {
	this.employeeStatus = employeeStatus;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getEmployeeCrTime()
{
  return employeeCrTime;
}
public void setEmployeeCrTime(final Date employeeCrTime)
{
  this.employeeCrTime = employeeCrTime;
}
public Date getEmployeeUpTime()
{
  return employeeUpTime;
}
public void setEmployeeUpTime(final Date employeeUpTime)
{
  this.employeeUpTime = employeeUpTime;
}
public String getEmployeename()
{
  return employeename;
}
public void setEmployeename(final String employeename)
{
  this.employeename = employeename;
}
public String getStatus()
{
  return status;
}
public void setStatus(final String status)
{
  this.status = status;
}

}