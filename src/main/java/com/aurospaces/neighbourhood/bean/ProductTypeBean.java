package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class ProductTypeBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String producttype ;
protected String status ;
protected String productstatus ;
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
public String getProducttype() {
	return producttype;
}
public void setProducttype(String producttype) {
	this.producttype = producttype;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getProductstatus() {
	return productstatus;
}
public void setProductstatus(String productstatus) {
	this.productstatus = productstatus;
}
@Override
public String toString() {
	return "ProductTypeBean [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
			+ ", producttype=" + producttype + ", status=" + status + ", productstatus=" + productstatus + ", getId()="
			+ getId() + ", getCreatedTime()=" + getCreatedTime() + ", getUpdatedTime()=" + getUpdatedTime()
			+ ", getProducttype()=" + getProducttype() + ", getStatus()=" + getStatus() + ", getProductstatus()="
			+ getProductstatus() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
			+ super.toString() + "]";
}




}