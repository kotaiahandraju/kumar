
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

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
		String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{dealerId});
		System.out.println(sql);
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