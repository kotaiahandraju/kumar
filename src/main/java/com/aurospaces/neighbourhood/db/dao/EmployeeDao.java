
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseEmployeeDao;




@Repository(value = "EmployeeDao")
public class EmployeeDao extends BaseEmployeeDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public EmployeeBean mobileDuplicateCheck(EmployeeBean employee){
		
		try{
			 jdbcTemplate = custom.getJdbcTemplate();
			String sql = " select * from kumar_employee where phone_number=?";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
					new Object[]{employee.getPhoneNumber()},ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
					if(retlist.size() > 0)
						return retlist.get(0);
					return null;
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return employee;
		
	}


}

