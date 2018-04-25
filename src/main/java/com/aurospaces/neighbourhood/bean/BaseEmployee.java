package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class BaseEmployee 
{
protected int id   = 0;
protected Date employeeCrTime ;
protected Date employeeUpTime ;
protected String employeename ;
protected String status ;

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