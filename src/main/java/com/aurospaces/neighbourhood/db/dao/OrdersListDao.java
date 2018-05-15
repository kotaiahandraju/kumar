
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseOrdersListDao;




@Repository(value = "ordersListDao")
public class OrdersListDao extends BaseOrdersListDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 

	public List<Map<String,Object>> getInvoiceData(OrdersListBean ordersListBean){
		List<Map<String,Object>> list=null;
		
		try{
			jdbcTemplate = custom.getJdbcTemplate();
			String sql ="SELECT DATE(ol.created_time) AS dateoforder,ol.*,i.* FROM `orders_list` ol,`items` i WHERE `invoiceId` = ? AND i.id=ol.`productId` order by ol.created_time desc ";
			list =jdbcTemplate.queryForList(sql, new Object[]{ordersListBean.getInvoiceId()});
			System.out.println(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public List<EmployeeBean> populateDealers(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<EmployeeBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
					return retlist;
		 }


public List<Map<String,Object>> getOrderList(String dealerId){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,if(ol.status='1','Not Completed','Delivered') as status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{dealerId});
		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getItemsOfOrder(String order_id){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (ol.quantity-ifnull((select sum(inv.dispatched_items_quantity) from invoice inv where inv.order_id=ol.orderId and inv.product_id=ol.productId),0)) as pending_qty, "
				+" ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption  from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where ol.orderId = ? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{order_id});
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getValidateOTP(String mobileNo){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select * from kumar_employee where phone_number=?";
		list =jdbcTemplate.queryForList(sql, new Object[]{mobileNo});
		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public boolean saveInvoice(Map<String,String> invoiceData){
	jdbcTemplate = custom.getJdbcTemplate();
	try{
		String sql ="insert into invoice(created_time,updated_time,order_id,invoice_no,dispatched_items_quantity,product_id) "
				+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"
				+" '"+invoiceData.get("order_id")+"','"+invoiceData.get("invoice_no")+"','"+invoiceData.get("quantity")+"',"+invoiceData.get("product_id")+")";
		int inserted_count = jdbcTemplate.update(sql);
		if(inserted_count==1)
			return true;
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
	return false;
	
}

public List<Map<String, Object>> getMyOrdersList() 
{
List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="SELECT i.created_time,i.updated_time,i.itemcode,i.itemdescrption,pn.productname as productCategory,pt.producttype as productSubCategory ,ol.orderId ,ol. invoiceId,ol.quantity "  
				+"FROM items i, productname pn,producttype pt ,branch_products bp,orders_list ol "
				+"where i.productId=pt.id AND  i.productname=pn.id AND bp.product_id=i.id ORDER BY ol.updated_time Desc ";
		list =jdbcTemplate.queryForList(sql, new Object[]{});
		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
}