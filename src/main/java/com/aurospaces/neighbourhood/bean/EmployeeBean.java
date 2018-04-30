package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class EmployeeBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;


protected String address ;
protected String city ;
protected String pincode ;
protected String shopPhone ;
protected String gstno ;
protected String phoneNumber ;
protected String email,username,password,roleId,status;

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
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}
public String getShopPhone() {
	return shopPhone;
}
public void setShopPhone(String shopPhone) {
	this.shopPhone = shopPhone;
}
public String getGstno() {
	return gstno;
}
public void setGstno(String gstno) {
	this.gstno = gstno;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

}