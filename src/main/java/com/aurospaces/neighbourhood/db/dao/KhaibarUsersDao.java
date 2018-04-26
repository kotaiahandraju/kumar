
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseKhaibarUsersDao;




@Repository(value = "khaibarUsersDao")
public class KhaibarUsersDao extends BaseKhaibarUsersDao
{
	@Autowired
	CustomConnection custom;
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
				String sql ="SELECT * from login where username = ? and password =? and status='1'";
				list =jdbcTemplate.queryForList(sql, new Object[]{userObj.getUserName(),userObj.getPassword()});
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
	 
	 

}

