
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

import com.aurospaces.neighbourhood.bean.DelarsBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseDelarsDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO kumar_delars( created_time, updated_time, name, shopname, address, city, pincode, shop_phone, gstno, phone_number, email, description, branch_id,status) values (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final DelarsBean kumarDelars) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(kumarDelars.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(kumarDelars.getCreatedTime() == null)
					{
					kumarDelars.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(kumarDelars.getCreatedTime().getTime()); 
							
					if(kumarDelars.getUpdatedTime() == null)
					{
					kumarDelars.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(kumarDelars.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, kumarDelars.getName());
ps.setString(4, kumarDelars.getShopname());
ps.setString(5, kumarDelars.getAddress());
ps.setString(6, kumarDelars.getCity());
ps.setString(7, kumarDelars.getPincode());
ps.setString(8, kumarDelars.getShopPhone());
ps.setString(9, kumarDelars.getGstno());
ps.setString(10, kumarDelars.getPhoneNumber());
ps.setString(11, kumarDelars.getEmail());
ps.setString(12, kumarDelars.getDescription());
ps.setString(13, kumarDelars.getBranchId());
ps.setString(14, kumarDelars.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				kumarDelars.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE kumar_delars  set name = ? ,shopname = ? ,address = ? ,city = ? ,pincode = ? ,shop_phone = ? ,gstno = ? ,phone_number = ? ,email = ? ,description = ? ,branch_id = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{kumarDelars.getName(),kumarDelars.getShopname(),kumarDelars.getAddress(),kumarDelars.getCity(),kumarDelars.getPincode(),kumarDelars.getShopPhone(),kumarDelars.getGstno(),kumarDelars.getPhoneNumber(),kumarDelars.getEmail(),kumarDelars.getDescription(),kumarDelars.getBranchId(),kumarDelars.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM kumar_delars WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public DelarsBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_delars where id = ? ";
			List<DelarsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(DelarsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
