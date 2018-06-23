package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BasePaymentDao;




@Repository(value = "PaymentDao")
public class PaymentDao extends BasePaymentDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	
	public List<PaymentBean> getallPayments(HttpSession session){
		jdbcTemplate = custom.getJdbcTemplate();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select *,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate  from kumar_payment kp where 1=1 ");
		LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
		if (objuserBean != null) {
			if(objuserBean.getRoleId().equals("3")){
				buffer.append(" and empId= '"+objuserBean.getEmpId()+"' ");
			}
			if(objuserBean.getRoleId().equals("2")){
				buffer.append(" and branchId= '"+objuserBean.getBranchId()+"' ");
			}
			buffer.append(" order by kp.payment_date desc,kp.confirm asc");
		}
		String sql =buffer.toString();
		List<PaymentBean> list = jdbcTemplate.query(sql, new Object[]{},ParameterizedBeanPropertyRowMapper.newInstance(PaymentBean.class));
		if(list.size() > 0)
			return list;
		return null;
		
	}
	public Boolean updateConfirmStatus(int id, String status,String comment) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update kumar_payment set confirm='" + status + "', comment='" + comment +"' where id = ?";
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}
	public List<PaymentBean> getdelarpaymentdetails(PaymentBean paymentBean){
		jdbcTemplate = custom.getJdbcTemplate();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select *,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate  from kumar_payment where 1=1 ");
				buffer.append(" and empId= '"+paymentBean.getEmpId()+"' ");
		String sql =buffer.toString();
		List<PaymentBean> list = jdbcTemplate.query(sql, new Object[]{},ParameterizedBeanPropertyRowMapper.newInstance(PaymentBean.class));
		if(list.size() > 0)
			return list;
		return null;
		
	}
	public List<PaymentBean>  getdelarpaymentdetailsBranches(PaymentBean paymentBean){
		jdbcTemplate = custom.getJdbcTemplate();
		
	String sql =" select kp.*,DATE_FORMAT(payment_date,'%d-%b-%Y') as strpaymentDate,ke.name  from kumar_payment kp,kumar_employee ke where 1=1 and kp.empId=ke.id 	 and branchId= '"+paymentBean.getBranchId()+"' ";
		System.out.println(sql);
		List<PaymentBean>  list = jdbcTemplate.query(sql, new Object[]{},ParameterizedBeanPropertyRowMapper.newInstance(PaymentBean.class));
		if(list.size() > 0)
			return list;
		return null;
		
	}

	public void dealerpaymentstatusupdate(PaymentBean paymentBean) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update kumar_payment set `comment`=?,  `confirm`=? WHERE id=?";
		jdbcTemplate.update(sql, new Object[]{paymentBean.getComment(),paymentBean.getConfirm(),paymentBean.getId()});
	}
	/*public getMobileNoByDealerId(String empId){
		List<Map<String,Object>> list=null;
		
			jdbcTemplate = custom.getJdbcTemplate();
			String sql ="select * from kumar_employee where id=?";
			list =jdbcTemplate.queryForList(sql, new Object[]{empId});
			System.out.println(sql);
			if(list.size() > 0)
				return list.get(0);
			return null;
			
	}*/
		
	

}

