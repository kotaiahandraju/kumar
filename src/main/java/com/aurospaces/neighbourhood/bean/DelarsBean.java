package com.aurospaces.neighbourhood.bean;


import java.util.Date;


/**
 *
 * @author autogenerated
 */



public class DelarsBean 
{
protected int id   = 0;

protected Date createdTime ;

protected Date updatedTime ;

protected String name ;
protected String shopname ;

protected String address ;
protected String city ;
protected String pincode ;
protected String shopPhone ;
protected String gstno ;
protected String phoneNumber ;
protected String email ;
protected String description ;
protected String branchId,status ;

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
public String getName()
{
  return name;
}
public void setName(final String name)
{
  this.name = name;
}
public String getShopname()
{
  return shopname;
}
public void setShopname(final String shopname)
{
  this.shopname = shopname;
}
public String getAddress()
{
  return address;
}
public void setAddress(final String address)
{
  this.address = address;
}
public String getCity()
{
  return city;
}
public void setCity(final String city)
{
  this.city = city;
}
public String getPincode()
{
  return pincode;
}
public void setPincode(final String pincode)
{
  this.pincode = pincode;
}
public String getShopPhone()
{
  return shopPhone;
}
public void setShopPhone(final String shopPhone)
{
  this.shopPhone = shopPhone;
}
public String getGstno()
{
  return gstno;
}
public void setGstno(final String gstno)
{
  this.gstno = gstno;
}
public String getPhoneNumber()
{
  return phoneNumber;
}
public void setPhoneNumber(final String phoneNumber)
{
  this.phoneNumber = phoneNumber;
}
public String getEmail()
{
  return email;
}
public void setEmail(final String email)
{
  this.email = email;
}
public String getDescription()
{
  return description;
}
public void setDescription(final String description)
{
  this.description = description;
}
public String getBranchId()
{
  return branchId;
}
public void setBranchId(final String branchId)
{
  this.branchId = branchId;
}

}