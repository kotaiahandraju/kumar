
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
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseCylindermasterDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO cylindermaster( created_time, updated_time, cylinderid,store, size, capacity, cylinderstatus, customerid, location, lponumber, color, madein, expirydate, ownercompany, status,remarks) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final CylindermasterBean cylindermaster) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(cylindermaster.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(cylindermaster.getCreatedTime() == null)
					{
					cylindermaster.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(cylindermaster.getCreatedTime().getTime()); 
							
					if(cylindermaster.getUpdatedTime() == null)
					{
					cylindermaster.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(cylindermaster.getUpdatedTime().getTime()); 
							
					if(cylindermaster.getExpirydate() == null)
					{
					cylindermaster.setExpirydate( new Date());
					}
					java.sql.Timestamp expirydate = 
						new java.sql.Timestamp(cylindermaster.getExpirydate().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, cylindermaster.getCylinderid());
ps.setString(4, cylindermaster.getStore());
ps.setString(5, cylindermaster.getSize());
ps.setString(6, cylindermaster.getCapacity());
ps.setString(7, cylindermaster.getCylinderstatus());
ps.setString(8, cylindermaster.getCustomerid());
ps.setString(9, cylindermaster.getLocation());
ps.setString(10, cylindermaster.getLponumber());
ps.setString(11, cylindermaster.getColor());
ps.setString(12, cylindermaster.getMadein());
ps.setTimestamp(13, expirydate);
ps.setString(14, cylindermaster.getOwnercompany());
ps.setString(15, cylindermaster.getStatus());
ps.setString(16, cylindermaster.getRemarks());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				cylindermaster.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE cylindermaster  set cylinderid = ?,store =?,size = ? ,capacity = ?  ,customerid = ? ,location = ? ,lponumber = ? ,color = ? ,madein = ? ,expirydate = ? ,ownercompany = ? ,remarks=?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{cylindermaster.getCylinderid(),cylindermaster.getStore(),cylindermaster.getSize(),cylindermaster.getCapacity(),cylindermaster.getCustomerid(),cylindermaster.getLocation(),cylindermaster.getLponumber(),cylindermaster.getColor(),cylindermaster.getMadein(),cylindermaster.getExpirydate(),cylindermaster.getOwnercompany(),cylindermaster.getRemarks(),cylindermaster.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM cylindermaster WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public CylindermasterBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from cylindermaster where id = ? ";
			List<CylindermasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(CylindermasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
