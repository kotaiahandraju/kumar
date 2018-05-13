
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseEmployeeDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO kumar_employee( created_time, updated_time, name, shopname, address, city, pincode, shop_phone, gstno, phone_number, email, description, branch_id, roleId, password, username, status,businessName,alternativeNumber) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final EmployeeBean kumarEmployee) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(kumarEmployee.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(kumarEmployee.getCreatedTime() == null)
					{
					kumarEmployee.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(kumarEmployee.getCreatedTime().getTime()); 
							
					if(kumarEmployee.getUpdatedTime() == null)
					{
					kumarEmployee.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(kumarEmployee.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, kumarEmployee.getName());
ps.setString(4, kumarEmployee.getShopname());
ps.setString(5, kumarEmployee.getAddress());
ps.setString(6, kumarEmployee.getCity());
ps.setString(7, kumarEmployee.getPincode());
ps.setString(8, kumarEmployee.getShopPhone());
ps.setString(9, kumarEmployee.getGstno());
ps.setString(10, kumarEmployee.getPhoneNumber());
ps.setString(11, kumarEmployee.getEmail());
ps.setString(12, kumarEmployee.getDescription());
ps.setString(13, kumarEmployee.getBranchId());
ps.setString(14, kumarEmployee.getRoleId());
ps.setString(15, kumarEmployee.getPassword());
ps.setString(16, kumarEmployee.getUsername());
ps.setString(17, kumarEmployee.getStatus());
ps.setString(18, kumarEmployee.getBusinessName());
ps.setString(19, kumarEmployee.getAlternativeNumber());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				kumarEmployee.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE kumar_employee  set name = ? ,shopname = ? ,address = ? ,city = ? ,pincode = ? ,shop_phone = ? ,gstno = ? ,phone_number = ? ,email = ? ,description = ? ,branch_id = ? ,roleId = ? ,password = ? ,username = ? ,status = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{kumarEmployee.getName(),kumarEmployee.getShopname(),kumarEmployee.getAddress(),kumarEmployee.getCity(),kumarEmployee.getPincode(),kumarEmployee.getShopPhone(),kumarEmployee.getGstno(),kumarEmployee.getPhoneNumber(),kumarEmployee.getEmail(),kumarEmployee.getDescription(),kumarEmployee.getBranchId(),kumarEmployee.getRoleId(),kumarEmployee.getPassword(),kumarEmployee.getUsername(),kumarEmployee.getStatus(),kumarEmployee.getId()});
		}
	}
	
	
	
	
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update kumar_employee set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public EmployeeBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_employee where id = ? ";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
