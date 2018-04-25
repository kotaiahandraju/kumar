
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

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseItemsDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO items( created_time, updated_time, productId,productname, serialno, itemcode, itemdescrption,status) values (?, ?, ?, ?, ?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final ItemsBean items) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(items.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(items.getCreatedTime() == null)
					{
					items.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(items.getCreatedTime().getTime()); 
							
					if(items.getUpdatedTime() == null)
					{
					items.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(items.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, items.getProductId());
ps.setString(4, items.getProductname());
ps.setString(5, items.getSerialno());
ps.setString(6, items.getItemcode());
ps.setString(7, items.getItemdescrption());
ps.setString(8, items.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				items.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE items  set productId = ? ,productname = ?,serialno = ? ,itemcode = ? ,itemdescrption = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{items.getProductId(),items.getProductname(),items.getSerialno(),items.getItemcode(),items.getItemdescrption(),items.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update items set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public ItemsBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from items where id = ? ";
			List<ItemsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
