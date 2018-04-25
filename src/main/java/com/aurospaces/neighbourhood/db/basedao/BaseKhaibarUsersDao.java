
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

import com.aurospaces.neighbourhood.bean.KhaibarUsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseKhaibarUsersDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO khaibar_users( created_time, updated_time, userName, password, roleId, status) values (?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final KhaibarUsersBean khaibarUsers) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(khaibarUsers.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(khaibarUsers.getCreatedTime() == null)
					{
					khaibarUsers.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(khaibarUsers.getCreatedTime().getTime()); 
							
					if(khaibarUsers.getUpdatedTime() == null)
					{
					khaibarUsers.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(khaibarUsers.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, khaibarUsers.getUserName());
ps.setString(4, khaibarUsers.getPassword());
ps.setString(5, khaibarUsers.getRoleId());
ps.setString(6, khaibarUsers.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				khaibarUsers.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE khaibar_users  set userName = ? ,password = ? ,roleId = ?   where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{khaibarUsers.getUserName(),khaibarUsers.getPassword(),khaibarUsers.getRoleId(),khaibarUsers.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM khaibar_users WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public KhaibarUsersBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from khaibar_users where id = ? ";
			List<KhaibarUsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(KhaibarUsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
