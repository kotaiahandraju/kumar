
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ProductTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseProductTypeDao;




@Repository(value = "productTypeDao")
public class ProductTypeDao extends BaseProductTypeDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	public List<ProductTypeBean> getProductType(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT p.*,CASE WHEN p.status IN ('0') THEN 'Deactive' WHEN p.status in ('1') THEN 'Active'  ELSE '-----' END as productstatus FROM producttype p where p.status='"+status+"' order by p.id desc";
		List<ProductTypeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ProductTypeBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public ProductTypeBean getByProductTpye(ProductTypeBean productTypeBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from producttype where producttype = ?";
			List<ProductTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{productTypeBean.getProducttype()},
			ParameterizedBeanPropertyRowMapper.newInstance(ProductTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	
}

