
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

import com.aurospaces.neighbourhood.bean.BranchProducts;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseBranchProductsDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO branch_products( created_time, updated_time, branch_id, product_id) values (?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final BranchProducts branchProducts) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(branchProducts.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(branchProducts.getCreatedTime() == null)
					{
					branchProducts.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(branchProducts.getCreatedTime().getTime()); 
							
					if(branchProducts.getUpdatedTime() == null)
					{
					branchProducts.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(branchProducts.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, branchProducts.getBranchId());
ps.setString(4, branchProducts.getProductId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				branchProducts.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE branch_products  set branch_id = ? ,product_id = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{branchProducts.getBranchId(),branchProducts.getProductId(),branchProducts.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM branch_products WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public BranchProducts getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from branch_products where id = ? ";
			List<BranchProducts> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchProducts.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
