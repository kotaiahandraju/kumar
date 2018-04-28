
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BranchcreationBean;
import com.aurospaces.neighbourhood.bean.EmpcreationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseEmpcreationDao;




@Repository(value = "empcreationDao")
public class EmpcreationDao extends BaseEmpcreationDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public List<EmpcreationBean> getEmployeeDetails(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT ec.*,kb.branchname as bName,if(ec.roleId=2,'Branch Manager','Dealer') as roleName, CASE WHEN ec.status IN ('0') THEN 'Deactive' WHEN ec.status in ('1') THEN 'Active'  ELSE '-----' END as empCreationStatus FROM empcreation ec,kumar_branch kb where kb.id=ec.branch_id and ec.status='"+status+"' order by ec.id desc";
		List<EmpcreationBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(EmpcreationBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public EmpcreationBean getByEmployeeName(EmpcreationBean empcreationBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from empcreation where userName =?  or emp=? ";
			List<EmpcreationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{empcreationBean.getUserName(),empcreationBean.getEmp()},
			ParameterizedBeanPropertyRowMapper.newInstance(EmpcreationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public List<EmpcreationBean> branchNames(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<EmpcreationBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(EmpcreationBean.class));
					return retlist;
		 }


}

