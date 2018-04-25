
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

import com.aurospaces.neighbourhood.bean.BranchcreationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseBranchcreationDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO Kumar_branchcreation( created_time, updated_time, branchname, employeename, userName, password, mobilenumber, roleId, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 





	@Transactional
	public void save(final BranchcreationBean branchcreation) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(branchcreation.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
						if(branchcreation.getCreatedTime() == null)
						{
							branchcreation.setCreatedTime( new Date());
						}
						java.sql.Timestamp createdTime = 
							new java.sql.Timestamp(branchcreation.getCreatedTime().getTime()); 
								
						if(branchcreation.getUpdatedTime() == null)
						{
							branchcreation.setUpdatedTime( new Date());
						}
						java.sql.Timestamp updatedTime = 
							new java.sql.Timestamp(branchcreation.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, branchcreation.getBranchname());
ps.setString(4, branchcreation.getEmployeename());
ps.setString(5, branchcreation.getUserName());
ps.setString(6, branchcreation.getPassword());
ps.setString(7, branchcreation.getMobilenumber());
ps.setString(8, branchcreation.getRoleId());
ps.setString(9, branchcreation.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				branchcreation.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE Kumar_branchcreation  set created_time = ? ,branchname = ? ,employeename = ? ,username = ? ,password = ? ,mobilenumber = ? ,role = ? ,status = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{branchcreation.getCreatedTime(),branchcreation.getBranchname(),branchcreation.getEmployeename(),branchcreation.getUserName(),branchcreation.getPassword(),branchcreation.getMobilenumber(),branchcreation.getRoleId(),branchcreation.getStatus(),branchcreation.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update Kumar_branchcreation set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public BranchcreationBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from Kumar_branchcreation where id = ? ";
			List<BranchcreationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
