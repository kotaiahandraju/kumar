
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
//			System.out.println(sql);
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
		String sql ="select ol.*,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{dealerId});
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getOrdersList(String dealerId,String branch_id,String status){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String status_clause = "", dealer_clause = "";
		if(dealerId.equalsIgnoreCase("all")){
			dealer_clause = "1";
		}else{
			dealer_clause = " ol.delerId =  '"+dealerId+"'";
		}
		
		if(status.equalsIgnoreCase("all")){
			status_clause = " 1";
		}else if(status.equalsIgnoreCase("pending")){
			status_clause = " ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 ";
		}else if(status.equalsIgnoreCase("partially")){
			status_clause = " (ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)>0 and ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)<(select sum(ols.quantity) from orders_list ols where ols.orderId=ol.orderId)) ";
		}else if(status.equalsIgnoreCase("completed")){
			status_clause = " ((select count(*) from orders_list where orderId = ol.orderId and status = '1')=0) ";
		}
		//String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,if((select count(*) from orders_list where orderId = ol.orderId and status = '1')=0,'Completed','Pending') as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.updated_time Desc";
		String sql ="select ol.*,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where "+dealer_clause+" and "+status_clause+"  and ol.branchId= '"+branch_id+"' and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id  group by ol.orderId ORDER BY ol.created_time Desc";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getAllOrders(String branch_id){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select ol.*,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where ol.branchId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id and ((select count(*) from orders_list where orderId = ol.orderId and status = '1')>0)  group by ol.orderId ORDER BY ol.created_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{branch_id});
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getAllOrders(String from_date, String to_date, String branch_id){
	List<Map<String,Object>> list=null;
	String branch_clause = " 1 ", date_clause = " 1 ";
	if(StringUtils.isNotBlank(branch_id)){
		branch_clause = " ol.branchId= "+branch_id;
	}else{
		branch_clause = " 1 ";
	}
	if(StringUtils.isNotBlank(from_date) && StringUtils.isNotBlank(to_date)){
		date_clause = " (date(ol.created_time) between str_to_date('"+from_date+"','%d-%b-%Y') and str_to_date('"+to_date+"','%d-%b-%Y')) ";
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select ol.*,(select kb.branchname from kumar_branch kb where kb.id = (select ols.branchId from orders_list ols where ols.orderId = ol.orderId limit 1)) as branch_name,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where "+branch_clause+" and "+date_clause+" and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.created_time Desc";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getAllOrders(String from_date, String to_date, String branch_id,String status){
	List<Map<String,Object>> list=null;
	String status_clause = "", branch_clause = "",delivered_on="", date_clause = " 1 ";
	if(StringUtils.isNotBlank(branch_id)){
		if(branch_id.equalsIgnoreCase("all")){
			branch_clause = " 1 ";
		}else{
			branch_clause = " ol.branchId= "+branch_id;
		}
		
	}else{
		branch_clause = " 1 ";
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		if(status.equalsIgnoreCase("all")){
			status_clause = " 1";
		}else if(status.equalsIgnoreCase("pending")){
			if(StringUtils.isNotBlank(from_date) && StringUtils.isNotBlank(to_date)){
				date_clause = " date(ol.created_time) between str_to_date('"+from_date+"','%d-%b-%Y') and str_to_date('"+to_date+"','%d-%b-%Y') ";
			}
			status_clause = " (ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 and "+date_clause+") ";
		}else if(status.equalsIgnoreCase("partially")){
			if(StringUtils.isNotBlank(from_date) && StringUtils.isNotBlank(to_date)){
				date_clause = " date(ol.created_time) between str_to_date('"+from_date+"','%d-%b-%Y') and str_to_date('"+to_date+"','%d-%b-%Y') ";
			}
			status_clause = " (ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)>0 and ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)<(select sum(ols.quantity) from orders_list ols where ols.orderId=ol.orderId)) ";
		}else if(status.equalsIgnoreCase("completed")){
			if(StringUtils.isNotBlank(from_date) && StringUtils.isNotBlank(to_date)){
				date_clause = " ol.orderId in (select inv.order_id from invoice inv where date(inv.created_time) between  str_to_date('"+from_date+"','%d-%b-%Y') and str_to_date('"+to_date+"','%d-%b-%Y')) ";
			}
			delivered_on = " (select date_format(inv.created_time,'%d-%b-%Y') from invoice inv where inv.order_id = ol.orderId order by inv.created_time desc limit 1) as delivered_on, ";
			status_clause = " ((select count(*) from orders_list where orderId = ol.orderId and status = '1')=0) and "+date_clause+" ";
		}
		//String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,if((select count(*) from orders_list where orderId = ol.orderId and status = '1')=0,'Completed','Pending') as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.updated_time Desc";
		String sql ="select ol.*,(select kb.branchname from kumar_branch kb where kb.id = (select ols.branchId from orders_list ols where ols.orderId = ol.orderId limit 1)) as branch_name,"+delivered_on+"ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where "+status_clause+"  and "+branch_clause+" and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id  group by ol.orderId ORDER BY ol.created_time Desc";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getItemsOfOrder(String order_id){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (ol.quantity-ifnull((select sum(ifnull(inv.dispatched_items_quantity,0)+ifnull(inv.nullified_qty,0)) from invoice inv where inv.order_id=ol.orderId and inv.product_id=ol.productId),0)) as pending_qty, "
				+" ifnull((select sum(inv.dispatched_items_quantity) from invoice inv where inv.order_id=ol.orderId and inv.product_id=ol.productId),0) as delivered_qty, "
				+" ifnull((select sum(inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId and inv.product_id=ol.productId),0) as  nullified_qty,"
				+" ol.*,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption,ifnull(i.itemprice,'0') as itemprice,ol.totalamount from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where ol.orderId = ? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id ORDER BY ol.updated_time Desc";
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
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

@Transactional
public boolean saveInvoice(Map<String,String> invoiceData,int balance_qty){
	jdbcTemplate = custom.getJdbcTemplate();
	try{
		String sql ="insert into invoice(created_time,updated_time,order_id,invoice_no,dispatched_items_quantity,nullified_qty,product_id) "
				+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"
				+" '"+invoiceData.get("order_id")+"','"+invoiceData.get("invoice_no")+"',"+invoiceData.get("quantity")+","+invoiceData.get("nullified_qty")+",'"+invoiceData.get("product_id")+"')";
		int inserted_count = jdbcTemplate.update(sql);
		if(inserted_count==1)
		{
			if(balance_qty==0){
				//update status in orders_list table
				String qry = "update orders_list set status = '0' where orderId = '"+invoiceData.get("order_id")+"'  and productId = '"+invoiceData.get("product_id")+"'";
				int updated_count = jdbcTemplate.update(qry);
				if(updated_count==1){
					return true;
				}
			}
			return true;
		}
		return false;
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
}

public List<Map<String,Object>> getDeliveredItemsHistory(String order_id){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select inv.*,date_format(inv.updated_time,'%d-%b-%Y') as delivered_on,(select date_format(ol.created_time,'%d-%b-%Y') from orders_list ol where ol.orderId=inv.order_id limit 1) as ordered_date,ke.name as dealerName,ke.businessName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption from invoice inv,items i,kumar_employee ke,producttype pt,productname pn where inv.order_id = '"+order_id+"' and inv.dispatched_items_quantity not in (0) and ke.id=(select ol.delerId from orders_list ol where ol.orderId=inv.order_id limit 1)and inv.product_id=i.id and i.productId=pt.id and i.productname=pn.id order by inv.updated_time";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getProductsDeliveredQtyBranchWise(){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select pt.producttype from producttype pt where pt.id = (select i.productId from items i where i.id = invoice.product_id)) as category, "
				+"(select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = invoice.product_id)) as sub_category, "
				+" (select i.itemcode from items i where i.id = invoice.product_id) as item_code, "
				+"(select kb.branchname from kumar_branch kb where kb.id = (select ol.branchId from orders_list ol where ol.orderId = order_id limit 1)) as branch_name,product_id,ifnull(sum(dispatched_items_quantity),0) as delivered, ifnull(sum(nullified_qty),0) as nullified from invoice "
					+" group by branch_name, product_id ";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getProductsOrderedQtyBranchWise(){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select pt.producttype from producttype pt where pt.id =(select i.productId from items i where i.id = ol.productId)) as category, "
				+" (select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = ol.productId)) as sub_category, "
				+" (select i.itemcode from items i where i.id = ol.productId) as item_code, "
				+" (select kb.branchname from kumar_branch kb where kb.id = ol.branchId) as branch_name,ol.productId,ol.branchId,ifnull(sum(ol.quantity),0) as ordered from orders_list ol where ol.orderId is not null group by ol.productId,ol.branchId";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getProductsDeliveredQtyOfBranch(String branch_id){
	List<Map<String,Object>> list=null;
	String branch_clause = " 1 ";
	if(StringUtils.isNotBlank(branch_id) && !branch_id.equalsIgnoreCase("all")){
		branch_clause = " order_id in (select ol.orderId from orders_list ol where ol.branchId = '"+branch_id+"') ";
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select pt.producttype from producttype pt where pt.id = (select i.productId from items i where i.id = invoice.product_id)) as category, "
				+"(select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = invoice.product_id)) as sub_category, "
				+" (select i.itemcode from items i where i.id = invoice.product_id) as item_code, "
				+"(select kb.branchname from kumar_branch kb where kb.id = (select ol.branchId from orders_list ol where ol.orderId = order_id limit 1)) as branch_name,product_id,ifnull(sum(dispatched_items_quantity),0) as delivered, ifnull(sum(nullified_qty),0) as nullified from invoice "
				+" where "+branch_clause+" "
				+" group by branch_name, product_id ";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getProductsDeliveredQtyDealerWise(String branch_id, String dealer_id){
	List<Map<String,Object>> list=null;
	String dealer_clause = " 1 ";
	if(StringUtils.isNotBlank(dealer_id) && !dealer_id.equalsIgnoreCase("all")){
		dealer_clause = " ol.delerId = "+dealer_id;
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select ke.businessName from kumar_employee ke where ke.id = (select ol.delerId from orders_list ol where ol.orderId = order_id limit 1)) as dealer_name, "
				+ "(select pt.producttype from producttype pt where pt.id = (select i.productId from items i where i.id = invoice.product_id)) as category, "
				+"(select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = invoice.product_id)) as sub_category, "
				+" (select i.itemcode from items i where i.id = invoice.product_id) as item_code, "
				+"(select kb.branchname from kumar_branch kb where kb.id = (select ol.branchId from orders_list ol where ol.orderId = order_id limit 1)) as branch_name,product_id,ifnull(sum(dispatched_items_quantity),0) as delivered, ifnull(sum(nullified_qty),0) as nullified from invoice "
				+" where order_id in (select ol.orderId from orders_list ol where ol.branchId = '"+branch_id+"' and  "+dealer_clause+") "
				+" group by dealer_name, product_id ";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getProductsOrderedQtyOfBranch(String branch_id){
	List<Map<String,Object>> list=null;
	String branch_clause = " 1 ";
	if(StringUtils.isNotBlank(branch_id) && !branch_id.equalsIgnoreCase("all")){
		branch_clause = " ol.branchId = '"+branch_id+"'  ";
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select pt.producttype from producttype pt where pt.id =(select i.productId from items i where i.id = ol.productId)) as category, "
				+" (select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = ol.productId)) as sub_category, "
				+" (select i.itemcode from items i where i.id = ol.productId) as item_code, "
				+" (select kb.branchname from kumar_branch kb where kb.id = ol.branchId) as branch_name,ol.productId,ol.branchId,ifnull(sum(ol.quantity),0) as ordered from orders_list ol , kumar_employee ke where ol.delerId=ke.id and ke.roleId = '3' and ol.orderId is not null "
				+" and "+branch_clause+" "
				+" group by ol.productId,ol.branchId";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<Map<String,Object>> getProductsOrderedQtyDealerWise(String branch_id, String dealer_id){
	List<Map<String,Object>> list=null;
	String dealer_clause = " 1 ";
	if(StringUtils.isNotBlank(dealer_id) && !dealer_id.equalsIgnoreCase("all")){
		dealer_clause = " ol.delerId = "+dealer_id;
	}
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select (select ke.businessName from kumar_employee ke where ke.id = ol.delerId) as dealer_name, "
				+ "(select pt.producttype from producttype pt where pt.id =(select i.productId from items i where i.id = ol.productId)) as category, "
				+" (select pn.productname from productname pn where pn.id=(select i.productname from items i where i.id = ol.productId)) as sub_category, "
				+" (select i.itemcode from items i where i.id = ol.productId) as item_code, "
				+" (select kb.branchname from kumar_branch kb where kb.id = ol.branchId) as branch_name,ol.productId,ol.branchId,ifnull(sum(ol.quantity),0) as ordered from orders_list ol, kumar_employee ke where ol.delerId=ke.id and ke.roleId = '3' and  ol.orderId is not null "
				+" and ol.branchId = '"+branch_id+"' "
				+" and "+dealer_clause
				+" group by ol.delerId, ol.productId";
		list =jdbcTemplate.queryForList(sql);
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

/*public List<Map<String, Object>> getMyOrdersList() 
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
	
}*/

// rest api
public List<Map<String,Object>> getOrderListAllForMobile(String branch_id){
List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,CASE WHEN (select count(*) from orders_list where orderId = ol.orderId and status = '1')=0 THEN 'Completed' WHEN ifnull((select sum(inv.dispatched_items_quantity+inv.nullified_qty) from invoice inv where inv.order_id=ol.orderId),0)=0 THEN 'Pending'  ELSE 'Partially delivered' END as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where ol.branchId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id and ((select count(*) from orders_list where orderId = ol.orderId and status = '1')>0)  group by ol.orderId ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{branch_id});
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}
public List<Map<String,Object>> getOrderListDealerForMobile(String dealerId){
	List<Map<String,Object>> list=null;
	
	try{
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="select ol.*,ke.name as dealerName,pt.producttype as categeory,pn.productName as subCategeory,i.itemcode ,i.itemdescrption, sum(ol.quantity) as total_quantity,date_format(ol.created_time,'%d-%b-%Y') as created_on,if((select count(*) from orders_list where orderId = ol.orderId and status = '1')=0,'Completed','Pending') as completed_status from orders_list ol,items i,kumar_employee ke,producttype pt,productname pn where delerId=? and ke.id=ol.delerId and ol.productId=i.id and i.productId=pt.id and i.productname=pn.id group by ol.orderId ORDER BY ol.updated_time Desc";
		list =jdbcTemplate.queryForList(sql, new Object[]{dealerId});
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return list;
	
}

public List<BranchBean> getOrderListCountByBranchId(String branchId){
	List<BranchBean> retlist=null;
	
	try{
//		System.out.println(branchId);
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sql ="SELECT COUNT(DISTINCT orderId) FROM `orders_list` WHERE branchId=?";
		
//		list =jdbcTemplate.queryForList(sql, new Object[]{branchId});
	 retlist = jdbcTemplate.query(sql, new Object[]{branchId},ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
//		System.out.println(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	return retlist;
	
}

}