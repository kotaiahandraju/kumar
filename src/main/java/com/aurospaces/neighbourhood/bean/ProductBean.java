package com.aurospaces.neighbourhood.bean;


import java.util.Date;



public class ProductBean 
{
protected int id   = 0;
protected Date productCrTime ;
protected Date productUpTime ;
protected String productname ;
protected String productquantity ;
protected String productprice ;
protected String status ;

public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getProductCrTime()
{
  return productCrTime;
}
public void setProductCrTime(final Date productCrTime)
{
  this.productCrTime = productCrTime;
}
public Date getProductUpTime()
{
  return productUpTime;
}
public void setProductUpTime(final Date productUpTime)
{
  this.productUpTime = productUpTime;
}
public String getProductname()
{
  return productname;
}
public void setProductname(final String productname)
{
  this.productname = productname;
}
public String getProductquantity()
{
  return productquantity;
}
public void setProductquantity(final String productquantity)
{
  this.productquantity = productquantity;
}
public String getProductprice()
{
  return productprice;
}
public void setProductprice(final String productprice)
{
  this.productprice = productprice;
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