
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseItemsDao;




@Repository(value = "itemsDao")
public class ItemsDao extends BaseItemsDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	public List<ItemsBean> getItems(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT i.* ,pn.productname as productIdName,pt.producttype As productTypeName, CASE WHEN i.status IN ('0') THEN 'Deactive' WHEN i.status in ('1') THEN 'Active'  ELSE '-----' END as itemsStatus   FROM items i, productname pn,producttype pt where i.status='"+status+"' and i.productId=pt.id and  i.productname=pn.id order by i.id desc";
		List<ItemsBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public ItemsBean getByItemSerialNo(ItemsBean itemsBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from items where serialno = ?";
			List<ItemsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{itemsBean.getSerialno()},
			ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}


}

