/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
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
@Autowired LoginDao loginDao;


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
	@ResponseBody public String authDetails( @ModelAttribute EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
		 LoginBean loginBean=null;
		 boolean result=false;
		 EmployeeBean checkEmpId=null;
		 List<Map<String,Object>> listOrderBeans =null;
			String json = null;
			JSONObject jsonObject=new JSONObject();
		try {
			System.out.println("authDetailsauthDetailsauthDetails");
			
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			String password=CommonUtils.generatePIN();
			loginBean=new LoginBean();
			employeeBean.setPassword(password);
		loginBean.setUserName(employeeBean.getUsername());
		
		loginBean.setPassword(password);
		loginBean.setBranchId(objuserBean.getBranchId());
		loginBean.setRoleId("3");
		loginBean.setStatus("1");
		loginBean.setEmpId(String.valueOf(employeeBean.getId()));
		checkEmpId=employeeDao.getByEmployeeId(employeeBean);
		if(checkEmpId != null) {
			result=employeeDao.updateUsernameAndPasswordInEmp(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
			
			loginDao.save(loginBean);
			
//			employeeDao.updateUsernameAndPasswordLogin(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
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
				
				ObjectMapper mapper = new ObjectMapper();
				listOrderBeans = employeeDao.getAllDelarsConfirm("1",session);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					jsonObject.put("allOrders1", listOrderBeans);
				} else {
					jsonObject.put("allOrders1", listOrderBeans);
				}
				
			}
		}
//		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(jsonObject);
	}
	 @RequestMapping(value = "/deleteDealer")
		public @ResponseBody String deleteDealer(EmployeeBean  employeeBean, ModelMap model,
				HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
			System.out.println("deleteCylinder page...");
			List<Map<String, Object>> listOrderBeans = null;
			JSONObject jsonObj = new JSONObject();
			ObjectMapper objectMapper = null;
			String sJson = null;
			boolean delete = false;
			try {
				if (employeeBean.getId() != 0 && employeeBean.getStatus() != "") {
					delete = employeeDao.delete(employeeBean.getId(),
							employeeBean.getStatus());
					if (delete) {
						jsonObj.put("message", "deleted");
					} else {
						jsonObj.put("message", "delete fail");
					}
				}

				listOrderBeans = employeeDao.getAllDelarsConfirm("1",session);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					jsonObj.put("allOrders1", listOrderBeans);
				} else {
					jsonObj.put("allOrders1", listOrderBeans);
				}
			} catch (Exception e) {
				e.printStackTrace();
//				logger.error(e);
//				logger.fatal("error in deleteRoomType class deleteEducation method  ");
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);

			}
			return String.valueOf(jsonObj);
		}
	
	
	 @RequestMapping(value = "/inActiveDealer")
		public @ResponseBody String inActiveDealer(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
		 JSONObject jsonObject=new JSONObject();
			List<Map<String, Object>> listOrderBeans = null;
			String sJson="";
			listOrderBeans = employeeDao.getAllDelarsConfirm(status,session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				jsonObject.put("allOrders1", listOrderBeans);
			} else {
				jsonObject.put("allOrders1", listOrderBeans);
			}
			
			return String.valueOf(jsonObject);
		}
	
}
