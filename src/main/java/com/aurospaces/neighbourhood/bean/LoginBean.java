package com.aurospaces.neighbourhood.bean;


import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 *
 * @author autogenerated
 */



public class LoginBean 
{

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
		 /** Field mapping. **/
protected int id   = 0;

/** Field mapping. **/
protected Date createdTime ;

/** Field mapping. **/
protected Date updatedTime ;

/** Field mapping. **/
protected String userName ;

/** Field mapping. **/
protected String password ;

/** Field mapping. **/
protected String roleId ;

/** Field mapping. **/
protected String status ;
protected String empId ;

public String getEmpId() {
	return empId;
}
public void setEmpId(String empId) {
	this.empId = empId;
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
public String getRoleId()
{
  return roleId;
}
public void setRoleId(final String roleId)
{
  this.roleId = roleId;
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