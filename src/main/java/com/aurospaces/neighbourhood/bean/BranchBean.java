package com.aurospaces.neighbourhood.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



import java.util.Date;
import java.math.BigDecimal;

public class BranchBean 
{
protected int id   = 0;
protected Date branchCrTime ;
protected Date branchUpTime ;
protected String branchname ;
protected String status ; 
protected String branchStatus ; 



public String getBranchStatus() {
	return branchStatus;
}
public void setBranchStatus(String branchStatus) {
	this.branchStatus = branchStatus;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getBranchCrTime()
{
  return branchCrTime;
}
public void setBranchCrTime(final Date branchCrTime)
{
  this.branchCrTime = branchCrTime;
}
public Date getBranchUpTime()
{
  return branchUpTime;
}
public void setBranchUpTime(final Date branchUpTime)
{
  this.branchUpTime = branchUpTime;
}
public String getBranchname()
{
  return branchname;
}
public void setBranchname(final String branchname)
{
  this.branchname = branchname;
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