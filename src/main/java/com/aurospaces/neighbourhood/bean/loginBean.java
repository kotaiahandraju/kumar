package com.aurospaces.neighbourhood.bean;


import java.util.Date;


public class loginBean 
{
protected int id   = 0;
protected Date loginCrTime ;
protected Date loginUpTime ;
protected String username ;
protected String password ;
protected String roleId ;
protected String status ;
protected String empId ;


public String getEmpId() {
	return empId;
}
public void setEmpId(String empId) {
	this.empId = empId;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Date getLoginCrTime() {
	return loginCrTime;
}
public void setLoginCrTime(Date loginCrTime) {
	this.loginCrTime = loginCrTime;
}
public Date getLoginUpTime() {
	return loginUpTime;
}
public void setLoginUpTime(Date loginUpTime) {
	this.loginUpTime = loginUpTime;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRoleId() {
	return roleId;
}
public void setRoleId(String roleId) {
	this.roleId = roleId;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}


}