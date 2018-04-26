
package com.aurospaces.neighbourhood.db.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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

}

