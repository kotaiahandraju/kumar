
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ddd;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseAddGasDao;




@Repository(value = "AddGasDao")
public class AddGasDao extends BaseAddGasDao
{
	/*@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	public List<ddd> getdata() {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select count(*) as y ,CONCAT(MONTHNAME(created_time),', ', YEAR(created_time)) as label from cylindertransaction  where cylinderStatus='3' group by DATE_FORMAT(created_time,'%Y-%m') order by month(created_time) asc ";
			List<ddd> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ddd.class));
			return retlist;

		}*/

}

