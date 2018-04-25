package com.aurospaces.neighbourhood.bean;


import java.util.Date;


public class ProductnameBean 
{
@Override
	public String toString() {
		return "ProductnameBean [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ ", productId=" + productId + ", productname=" + productname + ", status=" + status
				+ ", productnameStatus=" + productnameStatus + "]";
	}
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String productId ;
protected String productname ;
protected String status ;
protected String productnameStatus ;
protected String producttype ;



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
public String getProductnameStatus() {
	return productnameStatus;
}
public void setProductnameStatus(String productnameStatus) {
	this.productnameStatus = productnameStatus;
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
public String getProductId()
{
  return productId;
}
public void setProductId(final String productId)
{
  this.productId = productId;
}
public String getProductname()
{
  return productname;
}
public void setProductname(final String productname)
{
  this.productname = productname;
}

}