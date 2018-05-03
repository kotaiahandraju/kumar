
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseEmployeeDao;




@Repository(value = "EmployeeDao")
public class EmployeeDao extends BaseEmployeeDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	public List<EmployeeBean> getEmployeeDetails(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT ec.*,kb.branchname as bName,if(ec.roleId=2,'Branch Manager','Dealer') as roleName, CASE WHEN ec.status IN ('0') THEN 'Deactive' WHEN ec.status in ('1') THEN 'Active'  ELSE '-----' END as empCreationStatus FROM kumar_employee ec,kumar_branch kb where kb.id=ec.branch_id and ec.status='"+status+"' and roleId='2' order by ec.id desc";
		List<EmployeeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public EmployeeBean getByEmployeeName(EmployeeBean employeeBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from kumar_employee where username =?  and roleId=? ";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{employeeBean.getUsername(),employeeBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public List<EmployeeBean> branchNames(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<EmployeeBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
					return retlist;
		 }
	
	public EmployeeBean mobileDuplicateCheck(EmployeeBean employee){
		
		try{
			 jdbcTemplate = custom.getJdbcTemplate();
			String sql = " select * from kumar_employee where phone_number=?";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
					new Object[]{employee.getPhoneNumber()},ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
					if(retlist.size() > 0)
						return retlist.get(0);
					return null;
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return employee;
		
	}
	
	public EmployeeBean getBranchEmployees(EmployeeBean employeeBean){
		jdbcTemplate = custom.getJdbcTemplate();
		try{
			String sql = "select * from kumar_employee where branch_id='"+employeeBean.getBranchId()+"' and roleId='2'  ";
			List<EmployeeBean> list = jdbcTemplate.query(sql, new Object[]{},ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
			if(list.size() >0)
				return list.get(0);
			return null;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
		
	}
 public List<Map<String,Object>> getAllDelarsConfirm(String status,HttpSession session){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT ke.*,kb.`branchname` FROM `kumar_employee` ke,`kumar_branch` kb WHERE ke.`branch_id`=kb.id and `roleId`='3' ");
		 
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				 buffer.append(" and ke.branch_id ='"+objuserBean.getBranchId()+"' ");
			}
		 String sql=buffer.toString();
		 List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		 if(list.size() >0)
			 return list;
		 return null;
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	return null;
	 
 }
 public List<Map<String,Object>> getAllDelarspayments(HttpSession session){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT *,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate FROM `kumar_payment` where 1=1 ");
		 
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				 buffer.append(" and branchId ='"+objuserBean.getBranchId()+"' ");
			}
		 String sql=buffer.toString();
		 List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		 if(list.size() >0)
			 return list;
		 return null;
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	return null;
	 
 }

}

