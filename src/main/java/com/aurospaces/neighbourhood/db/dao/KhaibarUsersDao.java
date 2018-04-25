
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.loginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseKhaibarUsersDao;




@Repository(value = "khaibarUsersDao")
public class KhaibarUsersDao extends BaseKhaibarUsersDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	 public loginBean loginChecking(loginBean userObj) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from login where username = ? and password =? and status='1'";
			System.out.println("aaaaaaaaaaaa");
			List<loginBean> retlist = jdbcTemplate.query(sql,
			new Object[]{userObj.getUsername(),userObj.getPassword()},
			ParameterizedBeanPropertyRowMapper.newInstance(loginBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	 
	 public List<Map<String,Object>> getloginChecking(loginBean userObj){
			List<Map<String,Object>> list=null;
			
			try{
				jdbcTemplate = custom.getJdbcTemplate();
				String sql ="SELECT * from login where username = ? and password =? and status='1'";
				list =jdbcTemplate.queryForList(sql, new Object[]{userObj.getUsername(),userObj.getPassword()});
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

