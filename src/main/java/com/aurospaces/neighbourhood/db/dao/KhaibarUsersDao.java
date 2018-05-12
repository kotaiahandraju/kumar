
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseKhaibarUsersDao;




@Repository(value = "khaibarUsersDao")
public class KhaibarUsersDao extends BaseKhaibarUsersDao
{
	@Autowired
	CustomConnection custom;
	@Autowired HttpSession session;
	JdbcTemplate jdbcTemplate;
	 public LoginBean loginChecking(LoginBean userObj) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from login where username = ? and password =? and status='1'";
			List<LoginBean> retlist = jdbcTemplate.query(sql,
			new Object[]{userObj.getUserName(),userObj.getPassword()},
			ParameterizedBeanPropertyRowMapper.newInstance(LoginBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	 
	 public List<Map<String,Object>> getloginChecking(LoginBean userObj){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from login where username = '"+userObj.getUserName()+"' and password ='"+userObj.getPassword()+"' and status='1'";
				list =jdbcTemplate.queryForList(sql, new Object[]{});
				System.out.println(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 
	 public List<Map<String,Object>> getProductList(){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from items ";
				list =jdbcTemplate.queryForList(sql, new Object[]{});
				System.out.println("rest list-----------------"+list);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 public List<Map<String,Object>> getProductCategory(){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from producttype ";
				list =jdbcTemplate.queryForList(sql, new Object[]{});
				System.out.println("rest list2-----------------"+list);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 public List<Map<String,Object>> getProductSubCategory(){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from productname ";
				list =jdbcTemplate.queryForList(sql, new Object[]{});
				System.out.println("rest list3-----------------"+list);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 
	 public List<Map<String,Object>> getDonarList(String branchId){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from login where roleId = '3' and branchId =? and status='1'";
				list =jdbcTemplate.queryForList(sql, new Object[]{branchId});
				System.out.println(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 public List<Map<String,Object>> viewOrderList(String delarId){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT DATE(ol.created_time) AS dateoforder,ol.*,i.* FROM `orders_list` ol,`items` i WHERE `delerId` = ? AND i.id=ol.`productId` order by ol.created_time desc ";
				list =jdbcTemplate.queryForList(sql, new Object[]{delarId});
				System.out.println(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
			
		}
	 public  List<Map<String,Object>> getallcartDetails(CartBean cartBean){
		 jdbcTemplate = custom.getJdbcTemplate();
		 String userid = null;
		 
				userid = cartBean.getUserId();
			String sql = " SELECT c.`quantity`,c.id,i.id AS productId,i.`itemcode`,i.`itemdescrption` ,pn.productname AS productIdName,pt.producttype AS productTypeName  FROM  `cart` c, items i, productname pn,producttype pt  WHERE  i.productId=pt.id AND c.`productId`=i.id AND   i.productname=pn.id AND c.userid=? ";
			
			List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[]{userid});
			if(retlist.size() > 0)
				return retlist;
			return null;
		
	}

}

