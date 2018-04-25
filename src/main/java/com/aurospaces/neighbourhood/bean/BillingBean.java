package com.aurospaces.neighbourhood.bean;


import java.util.Date;




public class BillingBean 
{
protected int id   = 0;
protected Date billingCrTime ;
protected Date billingUpTime ;
protected String productid ;
protected String delaler ;
protected String quantity ;
protected String Price ;
protected String status ;
protected String billingStatus ;



public String getBillingStatus() {
	return billingStatus;
}
public void setBillingStatus(String billingStatus) {
	this.billingStatus = billingStatus;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getBillingCrTime()
{
  return billingCrTime;
}
public void setBillingCrTime(final Date billingCrTime)
{
  this.billingCrTime = billingCrTime;
}
public Date getBillingUpTime()
{
  return billingUpTime;
}
public void setBillingUpTime(final Date billingUpTime)
{
  this.billingUpTime = billingUpTime;
}
public String getProductid()
{
  return productid;
}
public void setProductid(final String productid)
{
  this.productid = productid;
}
public String getDelaler()
{
  return delaler;
}
public void setDelaler(final String delaler)
{
  this.delaler = delaler;
}
public String getQuantity()
{
  return quantity;
}
public void setQuantity(final String quantity)
{
  this.quantity = quantity;
}
public String getPrice()
{
  return Price;
}
public void setPrice(final String Price)
{
  this.Price = Price;
}

}