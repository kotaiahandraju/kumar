
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BillingBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseBillingDao;




@Repository(value = "billingDao")
public class BillingDao extends BaseBillingDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public List<BillingBean> getBillingDetails(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT b.*, CASE WHEN b.status IN ('0') THEN 'Deactive' WHEN b.status in ('1') THEN 'Active'  ELSE '-----' END as billingStatus FROM billing b where b.status=? order by b.id desc";
		List<BillingBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BillingBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public ItemsBean getBybillingNo(BillingBean billingBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from billing where id = ?";
			List<ItemsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{billingBean.getProductid()},
			ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}


}

