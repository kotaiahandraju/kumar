
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BranchcreationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseBranchcreationDao;




@Repository(value = "branchcreationDao")
public class BranchcreationDao extends BaseBranchcreationDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	public List<BranchcreationBean> getBranchcreationDetails(String status,String roleId){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT b.*,kb.branchname as bName,ke.employeename as empName, CASE WHEN b.status IN ('0') THEN 'Deactive' WHEN b.status in ('1') THEN 'Active'  ELSE '-----' END as branchCreationStatus FROM Kumar_branchcreation b,kumar_branch kb,kumar_employee ke where kb.id=b.branchname and ke.id=b.employeename and b.status='"+status+"' and b.roleId='"+roleId+"' order by b.id desc";
		List<BranchcreationBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public BranchcreationBean getBybranchCreationName(BranchcreationBean branchname) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from Kumar_branchcreation where userName =?  or employeename =? ";
			List<BranchcreationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{branchname.getUserName(),branchname.getBranchname(),branchname.getEmployeename()},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public List<BranchcreationBean> branchNames(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<BranchcreationBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
					return retlist;
		 }
	public List<BranchcreationBean> employeeNames(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<BranchcreationBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
					return retlist;
		 }


}

