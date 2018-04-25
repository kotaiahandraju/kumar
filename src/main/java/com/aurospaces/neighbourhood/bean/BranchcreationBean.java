package com.aurospaces.neighbourhood.bean;


import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class BranchcreationBean 
{

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String branchname ;
protected String employeename ;
protected String userName ;
protected String password ;
protected String mobilenumber ;
protected String roleId ;
protected String status ;
protected String branchCreationStatus ;



public String getBranchCreationStatus() {
	return branchCreationStatus;
}
public void setBranchCreationStatus(String branchCreationStatus) {
	this.branchCreationStatus = branchCreationStatus;
}
public String getRoleId() {
	return roleId;
}
public void setRoleId(String roleId) {
	this.roleId = roleId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public Date getCreatedTime() {
	return createdTime;
}
public void setCreatedTime(Date createdTime) {
	this.createdTime = createdTime;
}
public Date getUpdatedTime() {
	return updatedTime;
}
public void setUpdatedTime(Date updatedTime) {
	this.updatedTime = updatedTime;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public String getBranchname()
{
  return branchname;
}
public void setBranchname(final String branchname)
{
  this.branchname = branchname;
}
public String getEmployeename()
{
  return employeename;
}
public void setEmployeename(final String employeename)
{
  this.employeename = employeename;
}
public String getPassword()
{
  return password;
}
public void setPassword(final String password)
{
  this.password = password;
}
public String getMobilenumber()
{
  return mobilenumber;
}
public void setMobilenumber(final String mobilenumber)
{
  this.mobilenumber = mobilenumber;
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