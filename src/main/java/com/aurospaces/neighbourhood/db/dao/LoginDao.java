
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseLoginDao;




@Repository(value = "loginDao")
public class LoginDao extends BaseLoginDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	public Boolean updateLogin(LoginBean loginBean) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "UPDATE login  set userName = ? ,password = ?,branchId=?  where empId = ? ";
		int results = jdbcTemplate.update(sql, new Object[] {loginBean.getUserName(),loginBean.getPassword(),loginBean.getBranchId(),loginBean.getEmpId()  });
		if (results != 0) {
			result = true;
		}
		return result;
	}

	public Boolean UpdatePassword(String password, int id)
	{
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String hql="UPDATE login  set password = ? where id = ? ";
		int results=jdbcTemplate.update(hql, new Object[] {password,id});
				
				if (results != 0) {
					result = true;
				}
				return result;
	}
	
	
	public Boolean UpdatePasswordInEmployee(String password, int id)
	{
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String hql="UPDATE kumar_employee  set password = ? where id = ? ";
		int results=jdbcTemplate.update(hql, new Object[] {password,id});
				
				if (results != 0) {
					result = true;
				}
				return result;
	}
	
	public EmployeeBean  getLoginBeanByMbile(String mobile) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = " select * from kumar_employee where phone_number = '"+mobile+"' ";
		List<EmployeeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
		    
	}

}

