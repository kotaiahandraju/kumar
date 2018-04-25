
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

import com.aurospaces.neighbourhood.bean.BillingBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseBillingDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO billing( billing_cr_time, billing_up_time, productid, delaler, quantity, Price,status) values (?, ?, ?, ?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final BillingBean billing) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(billing.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(billing.getBillingCrTime() == null)
					{
					billing.setBillingCrTime( new Date());
					}
					java.sql.Timestamp billingCrTime = 
						new java.sql.Timestamp(billing.getBillingCrTime().getTime()); 
							
					if(billing.getBillingUpTime() == null)
					{
					billing.setBillingUpTime( new Date());
					}
					java.sql.Timestamp billingUpTime = 
						new java.sql.Timestamp(billing.getBillingUpTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, billingCrTime);
ps.setTimestamp(2, billingUpTime);
ps.setString(3, billing.getProductid());
ps.setString(4, billing.getDelaler());
ps.setString(5, billing.getQuantity());
ps.setString(6, billing.getPrice());
ps.setString(6, billing.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				billing.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE billing  set billing_cr_time = ? ,productid = ? ,delaler = ? ,quantity = ? ,Price = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{billing.getBillingCrTime(),billing.getProductid(),billing.getDelaler(),billing.getQuantity(),billing.getPrice(),billing.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update billing set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
		

	 public BillingBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from billing where id = ? ";
			List<BillingBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BillingBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
