
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

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseEmployeeDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO kumar_employee( employee_cr_time, employee_up_time, employeename, status,roleId) values (?, ?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final EmployeeBean employee) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(employee.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
						if(employee.getCreatedTime() == null)
						{
							employee.setCreatedTime( new Date());
						}
						java.sql.Timestamp createdTime = 
							new java.sql.Timestamp(employee.getCreatedTime().getTime()); 
								
						if(employee.getUpdatedTime() == null)
						{
							employee.setUpdatedTime( new Date());
						}
						java.sql.Timestamp updatedTime = 
							new java.sql.Timestamp(employee.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
/*ps.setTimestamp(2, updatedTime);
ps.setString(3, employee.getEmployeename());
ps.setString(4, employee.getStatus());
ps.setString(5, employee.getRoleId());*/

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				employee.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE kumar_employee  set employee_cr_time = ? ,employeename = ? ,status = ?,roleId=?  where id = ? ";
	
//			jdbcTemplate.update(sql, new Object[]{employee.getEmployeeCrTime(),employee.getEmployeename(),employee.getStatus(),employee.getId(),employee.getRoleId()});
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
