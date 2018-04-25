
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CylindermasterBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseCylindermasterDao;




@Repository(value = "cylindermasterDao")
public class CylindermasterDao extends BaseCylindermasterDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	@SuppressWarnings("unchecked")
	
	public List<CylindermasterBean> getCylinders(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT sm.storename,co.companyname , c. *,cs.name as cylinderstatus,i.name As sizeName,DATE_FORMAT(c.expirydate,'%d-%b-%Y') AS expirtdate1 , CASE WHEN c.status IN ('0') THEN 'Deactive' WHEN c.status in ('1') THEN 'Active'  ELSE '-----' END as cylendersstatus   FROM companymaster co,cylindermaster c,items i,cylinderstatus cs,storesmaster sm where  c.size=i.id and cs.id=c.cylinderstatus and co.id=c.ownercompany and sm.id=c.store and c.status='"+status+"' order by c.id desc";
		List<CylindermasterBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(CylindermasterBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
}

