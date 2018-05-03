/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonUtils.CommonUtils;

/**
 * @author Kotaiah
 *
 */
@Controller
@RequestMapping(value="/admin")
public class BranchManagerController {
@Autowired EmployeeDao employeeDao;
@Autowired PaymentDao paymentDao;
@Autowired ServletContext objContext;
@Autowired HttpSession session;
	@RequestMapping(value="/dealeraccountconfirm")
	public String getDelarConfirmation(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		try{
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarsConfirm("1",session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
			} else {
				request.setAttribute("allOrders1", "''");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "dealerconfirm";
		
	}
	@RequestMapping(value="/dealerpaymentconfirm")
	public String dealerpaymentconfirm(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		try{
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarspayments(session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
			} else {
				request.setAttribute("allOrders1", "''");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "managerpaymentconfirm";
		
	}
	@RequestMapping(value="/paymentConfirmStatus")
	public @ResponseBody String  paymentConfirmStatus(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		String confirm = null;
		JSONObject jsonObject = new JSONObject();
		int id =0;
		try{
			id = Integer.parseInt(request.getParameter("id"));
			confirm = request.getParameter("confirm");
			paymentDao.updateConfirmStatus(id,confirm);
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarspayments(session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
				jsonObject.put("allOrders1", listOrderBeans);
			} else {
				request.setAttribute("allOrders1", "''");
				jsonObject.put("allOrders1", listOrderBeans);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(jsonObject);
		
	}
	
	@RequestMapping(value = "/authDetails")
	public String authDetails( @ModelAttribute EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
		 LoginBean loginBean=null;
		 boolean result=false;
		 EmployeeBean checkEmpId=null;
		try {
			System.out.println("authDetailsauthDetailsauthDetails");
			loginBean=new LoginBean();
			employeeBean.setPassword(CommonUtils.generatePIN());
		System.out.println("login id"+CommonUtils.generatePIN());
		checkEmpId=employeeDao.getByEmployeeId(employeeBean);
		if(checkEmpId != null) {
			loginBean.setPassword(CommonUtils.generatePIN());
			result=employeeDao.updateUsernameAndPasswordInEmp(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
			employeeDao.updateUsernameAndPasswordLogin(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
			if(result) {
				 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
					//String propertiespath = "C:\\PRO\\Database.properties";
			
					input = new FileInputStream(propertiespath);
					// load a properties file
					prop.load(input);
					String msg = prop.getProperty("smsUsernameAndPassword");
					msg =msg.replace("_username_", employeeBean.getUsername());
					msg =msg.replace("_pass_", employeeBean.getPassword());
					if(StringUtils.isNotBlank(checkEmpId.getPhoneNumber())){
						
						// delar send sms
					SendSMS.sendSMS(msg, checkEmpId.getPhoneNumber(), objContext);
					
					}
				/*EmployeeBean empbean =	employeeDao.getBranchEmployees(employeeBean);
				if(empbean != null){
					// branch manager send sms
					SendSMS.sendSMS(msg1, empbean.getPhoneNumber(), objContext);
				}*/
				redirect.addFlashAttribute("msg", " Registered Successfully");
				
			}
		}
//		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return body;
	}
}
