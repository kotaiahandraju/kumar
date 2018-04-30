/*
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.DelarsBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseDelarsDao;




@Repository(value = "DelarsDao")
public class DelarsDao extends BaseDelarsDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	 public DelarsBean mobileDuplicateCheck(DelarsBean delarsBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_delars where phone_number = ? ";
			List<DelarsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{delarsBean.getPhoneNumber()},
			ParameterizedBeanPropertyRowMapper.newInstance(DelarsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

}

*/