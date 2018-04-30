
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

import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BasePaymentDao{

@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO kumar_payment( created_time, updated_time, empId, branchId, amount, confirm, payment_date, qtr_number) values (?, ?, ?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final PaymentBean kumarPayment) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(kumarPayment.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(kumarPayment.getCreatedTime() == null)
					{
					kumarPayment.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(kumarPayment.getCreatedTime().getTime()); 
							
					if(kumarPayment.getUpdatedTime() == null)
					{
					kumarPayment.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(kumarPayment.getUpdatedTime().getTime()); 
							
					if(kumarPayment.getPaymentDate() == null)
					{
					kumarPayment.setPaymentDate( new Date());
					}
					java.sql.Timestamp paymentDate = 
						new java.sql.Timestamp(kumarPayment.getPaymentDate().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, kumarPayment.getEmpId());
ps.setString(4, kumarPayment.getBranchId());
ps.setString(5, kumarPayment.getAmount());
ps.setString(6, kumarPayment.getConfirm());
ps.setTimestamp(7, paymentDate);
ps.setString(8, kumarPayment.getQtrNumber());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				kumarPayment.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE kumar_payment  set empId = ? ,branchId = ? ,amount = ? ,confirm = ? ,payment_date = ? ,qtr_number = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{kumarPayment.getEmpId(),kumarPayment.getBranchId(),kumarPayment.getAmount(),kumarPayment.getConfirm(),kumarPayment.getPaymentDate(),kumarPayment.getQtrNumber(),kumarPayment.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM kumar_payment WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public PaymentBean getById(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_payment where id = ? ";
			List<PaymentBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(PaymentBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
