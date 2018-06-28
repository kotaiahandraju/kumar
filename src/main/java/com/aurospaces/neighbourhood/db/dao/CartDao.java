
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseCartDao;




@Repository(value = "cartDao")
public class CartDao extends BaseCartDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	@Autowired HttpSession session;
	public int countcartdetails(CartBean objCartBean){
		 jdbcTemplate = custom.getJdbcTemplate();
		 int count = 0;
		 if(StringUtils.isEmpty(objCartBean.getUserId())) {
			 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
				if (objuserBean != null) {
					objCartBean.setUserId(objuserBean.getEmpId());
				}
		 }
		 	String sql =" SELECT COUNT(*) FROM `cart` WHERE `userId`=? ";
		 	count = jdbcTemplate.queryForInt(sql,new Object []{objCartBean.getUserId()});
		  
		return count;
		
	}
	public  List<Map<String,Object>> getallcartDetails(){
		 jdbcTemplate = custom.getJdbcTemplate();
		 String userid = null;
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				userid = objuserBean.getEmpId();
			}
			String sql = " SELECT c.totalamount,c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,ifnull(i.itemprice,'0') as itemprice,pn.productname AS productIdName,pt.producttype AS productTypeName  FROM  `cart` c, items i, productname pn,producttype pt  WHERE  i.productId=pt.id AND c.`productId`=i.id AND   i.productname=pn.id AND c.userid=? ";
			
			List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[]{userid});
			if(retlist.size() > 0)
				return retlist;
			return null;
		
	}
	public  List<Map<String,Object>> getallManagercartDetails(String dealerId){
		if(StringUtils.isNotEmpty(dealerId)) {
			
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = " SELECT c.totalamount,c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption`,ifnull(i.itemprice,'0') as itemprice,pn.productname AS productIdName,pt.producttype AS productTypeName  FROM  `cart` c, items i, productname pn,producttype pt  WHERE  i.productId=pt.id AND c.`productId`=i.id AND   i.productname=pn.id AND c.userid=? ";
				
				List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[]{dealerId});
				if(retlist.size() > 0)
					return retlist;
				return null;
		}else {
			 String userid = null;
			 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
				if (objuserBean != null) {
					userid = objuserBean.getEmpId();
				}
				String sql = " SELECT c.totalamount,c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,ifnull(i.itemprice,'0') as itemprice,pn.productname AS productIdName,pt.producttype AS productTypeName  FROM  `cart` c, items i, productname pn,producttype pt  WHERE  i.productId=pt.id AND c.`productId`=i.id AND   i.productname=pn.id AND c.userid=? ";
				
				List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[]{userid});
				if(retlist.size() > 0)
					return retlist;
				return null;
		}
		
		
	}
	public int countcartdetailsforMobile(CartBean objCartBean){
		 jdbcTemplate = custom.getJdbcTemplate();
		
		 String sql =" SELECT COUNT(*) FROM `cart` WHERE `userId`=? ";
		 
		 int count = jdbcTemplate.queryForInt(sql,new Object []{objCartBean.getUserId()});
		return count;
		
	}
	
	public List<CartBean> checkProductIdAndDealerId(CartBean objCartBean){
		 jdbcTemplate = custom.getJdbcTemplate();
			 String sql ="SELECT * FROM `cart` WHERE `userId`=? and productId=?";
			 List<CartBean> retlist = jdbcTemplate.query(sql,
						new Object[]{objCartBean.getUserId(),objCartBean.getProductId()},
						ParameterizedBeanPropertyRowMapper.newInstance(CartBean.class));
			 
				return retlist;
		
	}
	
	
	
//	SELECT c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,pn.productname AS productIdName,pt.producttype AS productTypeName
//	 FROM  `cart` c, items i, productname pn,producttype pt 
//	 WHERE  i.productId=pt.id AND c.`productId`=i.id AND
//	  i.productname=pn.id AND c.userid='3'
	
	
	

}

