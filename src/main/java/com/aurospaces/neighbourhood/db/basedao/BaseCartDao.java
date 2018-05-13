
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

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseCartDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO cart( created_time, updated_time, productId, quantity, userId, branchId) values (?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final CartBean cart) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(cart.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(cart.getCreatedTime() == null)
					{
					cart.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(cart.getCreatedTime().getTime()); 
							
					if(cart.getUpdatedTime() == null)
					{
					cart.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(cart.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, cart.getProductId());
ps.setString(4, cart.getQuantity());
ps.setString(5, cart.getUserId());
ps.setString(6, cart.getBranchId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				cart.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE cart  set productId = ? ,quantity = ? ,userId = ? ,branchId = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{cart.getProductId(),cart.getQuantity(),cart.getUserId(),cart.getBranchId(),cart.getId()});
		}
	}
		
		@Transactional
		public int delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM cart WHERE id=?";
			 int count =jdbcTemplate.update(sql, new Object[]{id});
			 return count;
		}
		

	@Transactional
		public int deleteByUserId(int userId) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM cart WHERE userId=?";
			 int count =jdbcTemplate.update(sql, new Object[]{userId});
			 return count;
		}
	
	 public CartBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from cart where id = ? ";
			List<CartBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(CartBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
