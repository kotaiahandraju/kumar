
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

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseBranchDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO kumar_branch( branch_cr_time, branch_up_time, branchname,branchcode,status) values (?, ?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final BranchBean branch) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(branch.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(branch.getBranchCrTime() == null)
					{
					branch.setBranchCrTime( new Date());
					}
					java.sql.Timestamp branchCrTime = 
						new java.sql.Timestamp(branch.getBranchCrTime().getTime()); 
							
					if(branch.getBranchUpTime() == null)
					{
					branch.setBranchUpTime( new Date());
					}
					java.sql.Timestamp branchUpTime = 
						new java.sql.Timestamp(branch.getBranchUpTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, branchCrTime);
ps.setTimestamp(2, branchUpTime);
ps.setString(3, branch.getBranchname());
ps.setString(4, branch.getBranchcode());
ps.setString(5, branch.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				branch.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE kumar_branch  set branch_cr_time = ? ,branchname = ?,branchcode =? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{branch.getBranchCrTime(),branch.getBranchname(),branch.getBranchcode(),branch.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update kumar_branch set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public BranchBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_branch where id = ? ";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
