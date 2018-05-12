
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

import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseOrdersListDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO orders_list( created_time, updated_time, delerId, quantity, productId,invoiceId,branchId,orderId) values (?,?, ?, ?, ?, ?,?,?)";





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final OrdersListBean ordersList) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(ordersList.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(ordersList.getCreatedTime() == null)
					{
					ordersList.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(ordersList.getCreatedTime().getTime()); 
							
					if(ordersList.getUpdatedTime() == null)
					{
					ordersList.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(ordersList.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, ordersList.getDelerId());
ps.setString(4, ordersList.getQuantity());
ps.setString(5, ordersList.getProductId());
ps.setString(6, ordersList.getInvoiceId());
ps.setString(7, ordersList.getBranchId());
ps.setString(8, ordersList.getOrderId());
							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				ordersList.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE orders_list  set delerId = ? ,quantity = ? ,productId = ?,oderId=? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{ordersList.getDelerId(),ordersList.getQuantity(),ordersList.getProductId(),ordersList.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM orders_list WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public OrdersListBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from orders_list where id = ? ";
			List<OrdersListBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(OrdersListBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
