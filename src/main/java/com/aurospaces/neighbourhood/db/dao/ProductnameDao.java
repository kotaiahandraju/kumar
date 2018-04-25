
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseProductnameDao;




@Repository(value = "productnameDao")
public class ProductnameDao extends BaseProductnameDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public List<ProductnameBean> getProductName(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT pn.* ,pt.producttype, CASE WHEN pn.status IN ('0') THEN 'Deactive' WHEN pn.status in ('1') THEN 'Active'  ELSE '-----' END as productnameStatus FROM productname pn,producttype pt where pn.status='"+status+"' and pn.productId=pt.id order by pn.id desc";
		List<ProductnameBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public ProductnameBean getByProductName(ProductnameBean productnameBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from productname where productname= ?";
			List<ProductnameBean> retlist = jdbcTemplate.query(sql,
			new Object[]{productnameBean.getProductname()},
			ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public List<ProductnameBean> populateProductType(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<ProductnameBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
					return retlist;
		 }
	public List<ProductnameBean> populateProductName(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<ProductnameBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
					return retlist;
		 }
	
	public List<ProductnameBean> getProductNameFilter(String productId)
	{

		String query = "select pn.id,pn.productname  from productname pn where  pn.productId=? group by pn.id ";
		System.out.println(query);
		List<ProductnameBean> handler = jdbcTemplate.query(query, new Object[]{productId},ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
		 System.out.println(query);
     
		 return handler;
	}

}

