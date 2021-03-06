
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
import com.aurospaces.neighbourhood.bean.SampleBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseLoginDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO login( created_time, updated_time, userName, password, roleId, status,empId,branchId) values (?, ?, ?, ?, ?, ?,?,?)"; 





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
ps.setString(8, login.getBranchId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				login.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE login  set userName = ? ,password = ? ,roleId = ? ,status = ?,branchId=?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{login.getUserName(),login.getPassword(),login.getRoleId(),login.getStatus(),login.getBranchId(),login.getId()});
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
	 
	 
	 public String saveBillDetails( SampleBean sampleBean ) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String isSave = null;
			try{

				 String INSERT_SQL1 = "INSERT INTO practice(name, address, email, mobile) values (?, ?,?, ?)";
				System.out.println("INSERT_SQL1==="+INSERT_SQL1);
				int insert = jdbcTemplate.update(
					INSERT_SQL1,
					new Object[] {sampleBean.getName(), sampleBean.getAddress(), sampleBean.getEmail(), sampleBean.getMobile()});
				System.out.println("222insert==="+insert);
			if (insert > 0) {
				//isSave = true;
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return isSave;
		}
	 
	 @Transactional
		public void deletePractice(String id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM practice WHERE name=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}

	

}
