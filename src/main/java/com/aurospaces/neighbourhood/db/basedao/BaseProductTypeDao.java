
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

import com.aurospaces.neighbourhood.bean.CylindermasterBean;
import com.aurospaces.neighbourhood.bean.ProductTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseProductTypeDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO producttype( created_time, updated_time,producttype,status) values (?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final ProductTypeBean productTypeBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(productTypeBean.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(productTypeBean.getCreatedTime() == null)
					{
					productTypeBean.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(productTypeBean.getCreatedTime().getTime()); 
							
					if(productTypeBean.getUpdatedTime() == null)
					{
					productTypeBean.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(productTypeBean.getUpdatedTime().getTime()); 
							
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, productTypeBean.getProducttype());
ps.setString(4, productTypeBean.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				productTypeBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE producttype  set producttype = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{productTypeBean.getUpdatedTime(),productTypeBean.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update producttype set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public CylindermasterBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from producttype where id = ? ";
			List<CylindermasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(CylindermasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
