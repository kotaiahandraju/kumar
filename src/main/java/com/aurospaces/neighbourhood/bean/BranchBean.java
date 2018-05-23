package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class BranchBean 
{
protected int id   = 0;
protected Date branchCrTime ;
protected Date branchUpTime ;
protected String branchname ;
protected String status ; 
protected String branchStatus,branchcode; 
protected int branchCount ;



public int getBranchCount() {
	return branchCount;
}
public void setBranchCount(int branchCount) {
	this.branchCount = branchCount;
}
public String getBranchcode() {
	return branchcode;
}
public void setBranchcode(String branchcode) {
	this.branchcode = branchcode;
}
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