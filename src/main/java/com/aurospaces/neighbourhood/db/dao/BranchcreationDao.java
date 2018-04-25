//
//package com.aurospaces.neighbourhood.db.dao;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
//import org.springframework.stereotype.Repository;
//
//import com.aurospaces.neighbourhood.bean.BranchBean;
//import com.aurospaces.neighbourhood.bean.BranchcreationBean;
//import com.aurospaces.neighbourhood.bean.ProductnameBean;
//import com.aurospaces.neighbourhood.daosupport.CustomConnection;
//import com.aurospaces.neighbourhood.db.basedao.BaseBranchcreationDao;
//
//
//
//
//@Repository(value = "branchcreationDao")
//public class BranchcreationDao extends BaseBranchcreationDao
//{
//@Autowired
//	CustomConnection custom;
//	JdbcTemplate jdbcTemplate; 
//	public List<BranchcreationBean> getBranchcreationDetails(String status){  
//		jdbcTemplate = custom.getJdbcTemplate();
//		 
//		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
//		
//		 String sql =  "SELECT b.*, CASE WHEN b.status IN ('0') THEN 'Deactive' WHEN b.status in ('1') THEN 'Active'  ELSE '-----' END as branchCreationStatus FROM Kumar_branchcreation b where b.status='"+status+"'order by b.id desc";
//		List<BranchcreationBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
//				ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
//		
//		if (retlist.size() > 0)
//			return retlist;
//		return null;
//		    
//		}  
//	
//	public BranchcreationBean getBybranchCreationName(BranchcreationBean branchname) {
//		 jdbcTemplate = custom.getJdbcTemplate();
//			String sql = "SELECT * from Kumar_branchcreation where userName = ? AND branchname =?";
//			List<BranchcreationBean> retlist = jdbcTemplate.query(sql,
//			new Object[]{branchname.getUserName(),branchname.getBranchname()},
//			ParameterizedBeanPropertyRowMapper.newInstance(BranchcreationBean.class));
//			if(retlist.size() > 0)
//				return retlist.get(0);
//			return null;
//		}
//	
//	public List<BranchBean> branchNames(String sql ){
//		 jdbcTemplate = custom.getJdbcTemplate();
//				List<BranchBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
//					return retlist;
//		 }
//	public List<ProductnameBean> employeeNames(String sql ){
//		 jdbcTemplate = custom.getJdbcTemplate();
//				List<ProductnameBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ProductnameBean.class));
//					return retlist;
//		 }
//
//
//}
//
