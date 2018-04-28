package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class EmpcreationBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String emp ;
protected String branchId ;
protected String roleId ;
protected String userName ;
protected String password ;
protected String bName ;
protected String empCreationStatus ;
protected String status,branchname,roleName,mobileNumber,email ;




public String getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(String mobileNumber) {
	this.mobileNumber = mobileNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
public String getBranchname() {
	return branchname;
}
public void setBranchname(String branchname) {
	this.branchname = branchname;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getbName() {
	return bName;
}
public void setbName(String bName) {
	this.bName = bName;
}
public String getEmpCreationStatus() {
	return empCreationStatus;
}
public void setEmpCreationStatus(String empCreationStatus) {
	this.empCreationStatus = empCreationStatus;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getCreatedTime()
{
  return createdTime;
}
public void setCreatedTime(final Date createdTime)
{
  this.createdTime = createdTime;
}
public Date getUpdatedTime()
{
  return updatedTime;
}
public void setUpdatedTime(final Date updatedTime)
{
  this.updatedTime = updatedTime;
}
public String getEmp()
{
  return emp;
}
public void setEmp(final String emp)
{
  this.emp = emp;
}
public String getBranchId()
{
  return branchId;
}
public void setBranchId(final String branchId)
{
  this.branchId = branchId;
}
public String getRoleId()
{
  return roleId;
}
public void setRoleId(final String roleId)
{
  this.roleId = roleId;
}
public String getUserName()
{
  return userName;
}
public void setUserName(final String userName)
{
  this.userName = userName;
}
public String getPassword()
{
  return password;
}
public void setPassword(final String password)
{
  this.password = password;
}
@Override
public String toString() {
	return "EmpcreationBean [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + ", emp="
			+ emp + ", branchId=" + branchId + ", roleId=" + roleId + ", userName=" + userName + ", password="
			+ password + ", bName=" + bName + ", empCreationStatus=" + empCreationStatus + ", status=" + status
			+ ", branchname=" + branchname + ", roleName=" + roleName + "]";
}

}