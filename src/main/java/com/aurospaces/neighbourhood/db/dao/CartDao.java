
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CartBean;
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
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				objCartBean.setUserId(objuserBean.getEmpId());
			}
		 String sql =" SELECT COUNT(*) FROM `cart` WHERE `userId`=? ";
		 
		 int count = jdbcTemplate.queryForInt(sql,new Object []{objCartBean.getUserId()});
		return count;
		
	}
	public  List<Map<String,Object>> getallcartDetails(){
		 jdbcTemplate = custom.getJdbcTemplate();
		 String userid = null;
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				userid = objuserBean.getEmpId();
			}
			String sql = " SELECT c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,pn.productname AS productIdName,pt.producttype AS productTypeName  FROM  `cart` c, items i, productname pn,producttype pt  WHERE  i.productId=pt.id AND c.`productId`=i.id AND   i.productname=pn.id AND c.userid=? ";
			
			List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[]{userid});
			if(retlist.size() > 0)
				return retlist;
			return null;
		
	}
//	SELECT c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,pn.productname AS productIdName,pt.producttype AS productTypeName
//	 FROM  `cart` c, items i, productname pn,producttype pt 
//	 WHERE  i.productId=pt.id AND c.`productId`=i.id AND
//	  i.productname=pn.id AND c.userid='3'

}

