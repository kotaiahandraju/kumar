package com.aurospaces.neighbourhood.bean;


import java.util.Date;


public class ProductnameBean 
{

protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String productId ;
protected String productname ;
protected String status ;
protected String productnameStatus ;
protected String producttype ;
protected String delarId,quantity,productlist,branchId;
protected String imagePath ;
protected String documents ;



public String getDocuments() {
	return documents;
}
public void setDocuments(String documents) {
	this.documents = documents;
}
public String getImagePath() {
	return imagePath;
}
public void setImagePath(String imagePath) {
	this.imagePath = imagePath;
}
public String getBranchId() {
	return branchId;
}
public void setBranchId(String branchId) {
	this.branchId = branchId;
}
public String getDelarId() {
	return delarId;
}
public void setDelarId(String delarId) {
	this.delarId = delarId;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public String getProductlist() {
	return productlist;
}
public void setProductlist(String productlist) {
	this.productlist = productlist;
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