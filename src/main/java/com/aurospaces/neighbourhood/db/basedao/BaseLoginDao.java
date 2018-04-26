
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

import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseLoginDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO login( created_time, updated_time, userName, password, roleId, status,empId) values (?, ?, ?, ?, ?, ?,?)"; 





	@Transactional
	public void save(final LoginBean login) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(login.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(login.getCreatedTime() == null)
					{
					login.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(login.getCreatedTime().getTime()); 
							
					if(login.getUpdatedTime() == null)
					{
					login.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(login.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, login.getUserName());
ps.setString(4, login.getPassword());
ps.setString(5, login.getRoleId());
ps.setString(6, login.getStatus());
ps.setString(7, login.getEmpId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				login.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE login  set userName = ? ,password = ? ,roleId = ? ,status = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{login.getUserName(),login.getPassword(),login.getRoleId(),login.getStatus(),login.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM login WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public LoginBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from login where id = ? ";
			List<LoginBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(LoginBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
