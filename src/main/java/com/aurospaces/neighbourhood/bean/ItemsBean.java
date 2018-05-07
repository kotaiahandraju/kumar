package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class ItemsBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String productId ;
protected String serialno ;
protected String itemcode ;
protected String itemdescrption ;
protected String status ;
protected String itemsStatus ;
protected String producttype ;
protected String productname ;
protected String productTypeName ;
protected String productIdName ;
protected String subcategory;
protected String branchId;





public String getBranchId() {
	return branchId;
}
public void setBranchId(String branchId) {
	this.branchId = branchId;
}
public String getSubcategory() {
	return subcategory;
}
public void setSubcategory(String subcategory) {
	this.subcategory = subcategory;
}
public String getProductTypeName() {
	return productTypeName;
}
public void setProductTypeName(String productTypeName) {
	this.productTypeName = productTypeName;
}
public String getProductIdName() {
	return productIdName;
}
public void setProductIdName(String productIdName) {
	this.productIdName = productIdName;
}
public String getProductname() {
	return productname;
}
public void setProductname(String productname) {
	this.productname = productname;
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
public String getItemsStatus() {
	return itemsStatus;
}
public void setItemsStatus(String itemsStatus) {
	this.itemsStatus = itemsStatus;
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
public String getSerialno()
{
  return serialno;
}
public void setSerialno(final String serialno)
{
  this.serialno = serialno;
}
public String getItemcode()
{
  return itemcode;
}
public void setItemcode(final String itemcode)
{
  this.itemcode = itemcode;
}
public String getItemdescrption()
{
  return itemdescrption;
}
public void setItemdescrption(final String itemdescrption)
{
  this.itemdescrption = itemdescrption;
}

}