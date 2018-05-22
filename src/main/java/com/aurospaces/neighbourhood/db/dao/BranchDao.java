
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseBranchDao;




@Repository(value = "branchDao")
public class BranchDao extends BaseBranchDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public List<BranchBean> getBranchDetails(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT b.*, CASE WHEN b.status IN ('0') THEN 'Deactive' WHEN b.status in ('1') THEN 'Active'  ELSE '-----' END as branchStatus   FROM kumar_branch b where b.status='"+status+"'order by b.id desc";
		List<BranchBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public BranchBean getBybranchName(BranchBean branchBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_branch where branchname = ?";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{branchBean.getBranchname()},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	public List<BranchBean> populate(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<BranchBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
					return retlist;
		 }
	
	public BranchBean getBybranchCodeById(String string) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT branchcode from kumar_branch where id = ?";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{string},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

}

