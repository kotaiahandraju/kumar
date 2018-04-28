
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.EmpcreationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseEmpcreationDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO empcreation( created_time, updated_time, emp, branch_id, roleId,email,mobileNumber, userName, password,status) values (?, ?, ?, ?, ?, ?, ?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final EmpcreationBean empcreation) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(empcreation.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(empcreation.getCreatedTime() == null)
					{
					empcreation.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(empcreation.getCreatedTime().getTime()); 
							
					if(empcreation.getUpdatedTime() == null)
					{
					empcreation.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(empcreation.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, empcreation.getEmp());
ps.setString(4, empcreation.getBranchId());
ps.setString(5, empcreation.getRoleId());
ps.setString(6, empcreation.getEmail());
ps.setString(7, empcreation.getMobileNumber());
ps.setString(8, empcreation.getUserName());
ps.setString(9, empcreation.getPassword());
ps.setString(10, empcreation.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				empcreation.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE empcreation  set emp = ? ,branch_id = ? ,roleId = ? ,email=?,mobileNumber=?,userName = ? ,password = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{empcreation.getEmp(),empcreation.getBranchId(),empcreation.getRoleId(),empcreation.getEmail(),empcreation.getMobileNumber(),empcreation.getUserName(),empcreation.getPassword(),empcreation.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update empcreation set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public EmpcreationBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from empcreation where id = ? ";
			List<EmpcreationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(EmpcreationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
