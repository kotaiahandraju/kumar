package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
			String sql = "SELECT * from kumar_employee where username =?  or phone_number=?  or branch_id =? or email =?";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{employeeBean.getUsername(),employeeBean.getPhoneNumber(),employeeBean.getBranchId(),employeeBean.getEmail()},
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
			String sql = " select * from kumar_employee where phone_number=? or  gstno =? or email =? ";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
					new Object[]{employee.getPhoneNumber(),employee.getGstno(),employee.getEmail()},ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
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
		 buffer.append("SELECT ke.*,kb.`branchname` FROM `kumar_employee` ke,`kumar_branch` kb WHERE ke.`branch_id`=kb.id and `roleId`='3' and confirm ='1' and ke.status ='"+status+"'   ");
		 
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
 
 public Boolean updateUsernameAndPasswordInEmp(int id,String username, String password) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update kumar_employee set username='" + username + "',password='" + password + "',confirm='1',status='1' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
 public Boolean updateUsernameAndPasswordLogin(int id,String username, String password) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update login set userName='" + username + "',password='" + password + "' where empId = ?";
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
 public EmployeeBean getByEmployeeId(EmployeeBean employeeBean) {
	 jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from kumar_employee where id='"+employeeBean.getId()+"' ";
		List<EmployeeBean> retlist = jdbcTemplate.query(sql,
		new Object[]{},
		ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
		if(retlist.size() > 0)
			return retlist.get(0);
		return null;
	}
 public List<Map<String,Object>> getAllDelarspayments(HttpSession session){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT kp.*,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate,ke.`name` FROM `kumar_payment`kp,`kumar_employee` ke  where 1=1 and ke.`id`=kp.`empId`");
		 
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				 buffer.append(" and kp.branchId ='"+objuserBean.getBranchId()+"' ");
			}
			buffer.append(" order by kp.payment_date desc,kp.confirm asc");
		 String sql=buffer.toString();
		 System.out.println(sql);
		 List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		 if(list.size() >0)
			 return list;
		 return null;
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	return null;
	 
 }
 public List<Map<String,Object>> getO(HttpSession session){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT kp.*,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate,ke.`name` FROM `kumar_payment`kp,`kumar_employee` ke  where 1=1 and ke.`id`=kp.`empId` ");
		 
		 LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				 buffer.append(" and kp.branchId ='"+objuserBean.getBranchId()+"' ");
			}
		 String sql=buffer.toString();
		 System.out.println(sql);
		 List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		 if(list.size() >0)
			 return list;
		 return null;
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	return null;
	 
 }
 public EmployeeBean otpChecking(EmployeeBean employee){
		
		try{
			 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select  * from otp where phoneNumber=? and OTP=? order by id desc limit 1";
			List<EmployeeBean> retlist = jdbcTemplate.query(sql,
					new Object[]{employee.getPhoneNumber(),employee.getOTP()},ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
					if(retlist.size() > 0)
						return retlist.get(0);
					return null;
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return employee;
		
	}
 public boolean updateOtpStatus(String mobileNum,String otp){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "update otp set status='1'  where phoneNumber = "+mobileNum+"  and otp = "+otp+" and date(updated_time) = current_date() ";
		try{
			int updated_count = jdbcTemplate.update(qryStr);
			if(updated_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
 public boolean updateCount(String mobileNum,String otp){
	jdbcTemplate = custom.getJdbcTemplate();
	String qryStr = "update otp set count=(count+1)  where phoneNumber = "+mobileNum+"  and otp = "+otp+" and date(updated_time) = current_date() ";
	try{
		int updated_count = jdbcTemplate.update(qryStr);
		if(updated_count==1)
			return true;
		
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
	return false;
}
	public boolean saveOtp( final EmployeeBean kumarEmployee) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		try{
			// check if an entry exists for the current date
			String selectQry = "select count(*) from otp  where  phoneNumber = "+kumarEmployee.getPhoneNumber()+" and date(updated_time) = current_date() ";
			int existing_count = jdbcTemplate.queryForInt(selectQry);
			String qryStr = "";
			if(existing_count==0){
				qryStr = "insert into otp(created_time,OTP,phoneNumber,status,count) "
						+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+kumarEmployee.getOTP()+"',"+kumarEmployee.getPhoneNumber()+",'0',0)";
			}else{
				qryStr = "update otp set OTP = '"+kumarEmployee.getOTP()+"', count = (count+1) where phoneNumber = '"+kumarEmployee.getPhoneNumber()+"' and date(updated_time) = current_date() ";
			}
		
			int updated_count = jdbcTemplate.update(qryStr);
			if(updated_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
 public int getOTPCount(String mobileNum){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select count from otp where phoneNumber = "+mobileNum+" and date(updated_time) = current_date() ";
		try{
			int count = jdbcTemplate.queryForInt(qryStr);
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}

	}
 public String getOtpOf(String mobileNum){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select otp from otp where  phoneNumber = "+mobileNum+" and date(updated_time) = current_date() ";
		try{
			long otp = jdbcTemplate.queryForLong(qryStr);
			return otp+"";
			
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
 public boolean isUsernameDuplicate(String userName){
	 jdbcTemplate =custom.getJdbcTemplate();
	 
		 StringBuffer buffer = new StringBuffer();
		 buffer.append(" select count(*) from login where upper(userName) = upper('"+userName+"') ");
		 int count = jdbcTemplate.queryForInt(buffer.toString());
		 if(count>0){
			 return true; 
		 }else
			 return false;
 }
 
 //mobile app using 
 public List<Map<String,Object>> getAllDelarsConfirm1(EmployeeBean employeeBean){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT ke.*,kb.`branchname` FROM `kumar_employee` ke,`kumar_branch` kb WHERE ke.`branch_id`=kb.id and `roleId`='3' ");
		 
				 buffer.append(" and ke.branch_id ='"+employeeBean.getBranchId()+"' ");
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
 
 
 public List<Map<String,Object>> getInactiveDelarsConfirm(String status,HttpSession session){
	 jdbcTemplate =custom.getJdbcTemplate();
	 try{
		 StringBuffer buffer = new StringBuffer();
		 buffer.append("SELECT ke.*,kb.`branchname` FROM `kumar_employee` ke,`kumar_branch` kb WHERE ke.`branch_id`=kb.id and `roleId`='3' and confirm ='1' and ke.status='"+status+"'  ");
		 
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

public Boolean dealerEmailExistsOrNot(String cemail) {
	
	
	 jdbcTemplate =custom.getJdbcTemplate();
		
		 String  hql =" select count(*) from kumar_employee where  email='"+cemail+"' ";
		 
		 int count = jdbcTemplate.queryForInt(hql);
		 if(count>0){
			 return true; 
		 }else
			 return false;
}

public Boolean dealerEmailExistsOrNotOnEdit(String cemail, String editFields) {
	jdbcTemplate =custom.getJdbcTemplate();
		
		 String  hql =" select count(*) from kumar_employee where  email='"+cemail+"' and id <>  "+editFields+" ";
		 
		 System.out.println(hql);
		 
		 int count = jdbcTemplate.queryForInt(hql);
		 if(count>0){
			 return true; 
		 }else
			 return false;
}

public Boolean dealerGstExistsOrNot(String cgstno) {
	
	jdbcTemplate =custom.getJdbcTemplate();
	
	 String  hql =" select count(*) from kumar_employee where  gstno='"+cgstno+"' ";
	 
	 int count = jdbcTemplate.queryForInt(hql);
	 if(count>0){
		 return true; 
	 }else
		 return false;
}


public Boolean dealerGstExistsOrNotOnEdit(String cgstno, String editFields) {
	jdbcTemplate =custom.getJdbcTemplate();
	
	 String  hql =" select count(*) from kumar_employee where  gstno='"+cgstno+"' and id <>  "+editFields+" ";	 
	 int count = jdbcTemplate.queryForInt(hql);
	 if(count>0){
		 return true; 
	 }else
		 return false;
}

public Boolean dealerContactPhoneExistsOrNot(String phoneNumber) {
	jdbcTemplate =custom.getJdbcTemplate();
	
	 String  hql =" select count(*) from kumar_employee where  phone_number='"+phoneNumber+"' ";
	 
	 int count = jdbcTemplate.queryForInt(hql);
	 if(count>0){
		 return true; 
	 }else
		 return false;
}

public Boolean dealerContactPhoneExistsOrNotOnEdit(String phoneNumber, String editFields) {
	jdbcTemplate =custom.getJdbcTemplate();
	
	 String  hql =" select count(*) from kumar_employee where  phone_number='"+phoneNumber+"' and id <>  "+editFields+" ";	 
	 int count = jdbcTemplate.queryForInt(hql);
	 if(count>0){
		 return true; 
	 }else
		 return false;
}

public EmployeeBean getBranchHeadBean(String branchId) {
	
	jdbcTemplate = custom.getJdbcTemplate();
	String sql = "select * from kumar_employee where branch_id = ? and   roleId= '2' ";
	List<EmployeeBean> retlist = jdbcTemplate.query(sql,
	new Object[]{branchId},
	ParameterizedBeanPropertyRowMapper.newInstance(EmployeeBean.class));
	if(retlist.size() > 0)
		return retlist.get(0);
	return null;
}



public Boolean UsernameExistsOrNotOnEdit(String username, String editFields) {
	jdbcTemplate =custom.getJdbcTemplate();
		
		 String  hql =" select count(*) from kumar_employee where  username='"+username+"' and id <>  "+editFields+" ";
		 
		 System.out.println(hql);
		 
		 int count = jdbcTemplate.queryForInt(hql);
		 if(count>0){
			 return true; 
		 }else
			 return false;
}


 
}

