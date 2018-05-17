package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.SendSMS;

import CommonUtils.CommonUtils;

/**
 * @author Kotaiah
 *
 */
@Controller
public class DelarsRegisrtationController {
	@Autowired BranchDao branchDao;
	@Autowired OrdersListDao listDao;
	@Autowired EmployeeDao employeeDao;
	@Autowired ServletContext objContext;
	@RequestMapping(value = "/dealerregistration")
	public String cylinderHome( @ModelAttribute("delar") EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session) {

		try {
System.out.println("delar registration");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "dealerregistration";
	}
	@RequestMapping(value = "/addDelar")
	@ResponseBody public String addDelar( @ModelAttribute("delar") EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
			JSONObject jsonObj = new JSONObject();
		try {
			 
					 EmployeeBean objEmployeeBean = employeeDao.mobileDuplicateCheck(employeeBean);
						if(objEmployeeBean != null){
							jsonObj.put("msg", "fail");
	//						redirect.addFlashAttribute("msg", "Alreday Registered ");
						}else{
							
							//String result = this.isValidOtp(employeeBean);
							/*if(result.equalsIgnoreCase("count_exceeded")){
								jsonObj.put("msg", "fail"); 
								jsonObj.put("otp_result", "count_exceeded");
								return String.valueOf(jsonObj);
							}else */
							String received_otp = employeeBean.getOTP();
							String otp = employeeDao.getOtpOf(employeeBean.getPhoneNumber())+"";
							   if(StringUtils.isNotBlank(received_otp)  &&  otp.equals(received_otp)){
								   employeeDao.updateOtpStatus(employeeBean.getPhoneNumber(),otp);
								   jsonObj.put("otp_result", "matched");
									employeeBean.setRoleId("3");
									employeeBean.setStatus("0");
									employeeDao.save(employeeBean);
									 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
										//String propertiespath = "C:\\PRO\\Database.properties";
								
										input = new FileInputStream(propertiespath);
										// load a properties file
										prop.load(input);
										String msg = prop.getProperty("send_delar_sms");
										String msg1 = prop.getProperty("send_branch_manger_delardetails");
										msg1 =msg1.replace("_name_", employeeBean.getName());
										msg1 =msg1.replace("_mobile_", employeeBean.getPhoneNumber());
										if(StringUtils.isNotBlank(employeeBean.getPhoneNumber())){
											// delar send sms
										SendSMS.sendSMS(msg, employeeBean.getPhoneNumber(), objContext);
										
										jsonObj.put("msg", "success");
										}
									EmployeeBean empbean =	employeeDao.getBranchEmployees(employeeBean);
									if(empbean != null){
										// branch manager send sms
										SendSMS.sendSMS(msg1, empbean.getPhoneNumber(), objContext);
									}
									jsonObj.put("msg", "success");
							   }else{
								   //employeeDao.updateCount(mobileNum, otp);
								   jsonObj.put("msg", "fail"); 
									jsonObj.put("otp_result", "mismatched");
									return String.valueOf(jsonObj);
							   }
	//						redirect.addFlashAttribute("msg", " Registered Successfully");
							
						}
				// }
			 
			 /*else{
				 jsonObj.put("msg", "fail");
			 }*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	@ModelAttribute("branches")
	public Map<Integer, String> populatestores() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id ,branchname from kumar_branch where status='1'";
			List<BranchBean> list = branchDao.populate(sSql);
			for (BranchBean bean : list) {
				statesMap.put(bean.getId(), bean.getBranchname());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	 @RequestMapping(value = "/validateOTP")
		public @ResponseBody String validateOTP(EmployeeBean employeeBean,HttpServletRequest request, HttpSession session) {
			System.out.println("validateOTP...");
			List<Map<String, Object>> listOrderBeans = null;
			JSONObject jsonObj = new JSONObject();
			InputStream input = null;
			String resultOtp = null;
			 Properties prop = new Properties();
			try {

				
				listOrderBeans = listDao.getValidateOTP(employeeBean.getPhoneNumber());
				if (listOrderBeans.size() !=0) {
					
					jsonObj.put("msg", "failed");
				} else {
					/*String result = this.isValidOtp(employeeBean);
					if(result.equalsIgnoreCase("count_exceeded")){
						jsonObj.put("msg", "fail"); 
						jsonObj.put("otp_result", "count_exceeded");
						return String.valueOf(jsonObj);
					}else if(result.equalsIgnoreCase("mismatched")){
						jsonObj.put("msg", "fail"); 
						jsonObj.put("otp_result", "mismatched");
						return String.valueOf(jsonObj);
					}else if(result.equalsIgnoreCase("matched")){*/
						employeeBean.setOTP(CommonUtils.generatePIN());
						 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
					
							input = new FileInputStream(propertiespath);
							// load a properties file
							prop.load(input);
							String msg1 = prop.getProperty("OTPForDealer");
							msg1 =msg1.replace("_otp_", employeeBean.getOTP());
							if(StringUtils.isNotBlank(employeeBean.getPhoneNumber())){
								
								 boolean success = employeeDao.saveOtp(employeeBean);
								 jsonObj.put("mobileStr", employeeBean.getPhoneNumber().substring(employeeBean.getPhoneNumber().length()-3));
								// delar send OTP
								resultOtp=SendSMS.sendSMS(msg1, employeeBean.getPhoneNumber(), objContext);
								jsonObj.put("success",employeeBean.getOTP());
							if(resultOtp.equals("OK")) {
								jsonObj.put("msg", "success");
							}else{
								jsonObj.put("msg", "failed");
							}
							
							}
					//}
					 
				}
			} catch (Exception e) {
				e.printStackTrace();
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);

			}
			return String.valueOf(jsonObj);
		}
	
	 @RequestMapping(value = "/resendOtp")
	 public @ResponseBody String resendOtp(EmployeeBean employeeBean,HttpServletRequest request, HttpSession session) {
	   JSONObject objJson = new JSONObject();
		try {
				String mobileNum = employeeBean.getPhoneNumber();
				int count = employeeDao.getOTPCount(mobileNum);
				if(count<=4){
					objJson.put("mobileStr", mobileNum.substring(mobileNum.length()-3));
					String otp = employeeDao.getOtpOf(mobileNum);
				   if(StringUtils.isNotBlank(otp)){
					   try{
						   String response = SendSMS.sendSMS("OTP for your registration is: "+otp, mobileNum,objContext);
						   
						   if("OK".equalsIgnoreCase(response)){
							   employeeDao.updateCount(mobileNum, otp);
							   objJson.put("message", "success");
						   }else{
							   objJson.put("message", "failed");
						   }
					   }catch(Exception e){
						   e.printStackTrace();
						   objJson.put("message", "failed");
					   }
					   
					   
				   }else{
					   objJson.put("message", "failed");
					   objJson.put("otp_result", "count_exceeded");
				   }
				}else{
					
				}
				
			   
			
		} catch (Exception e) {
		   e.printStackTrace();
		   objJson.put("message", "failed");
		 }
		return objJson.toString();
	 }
	 
	   /*public String   isValidOtp(EmployeeBean employeeBean)
	   {
		   String mobileNum = employeeBean.getPhoneNumber();
		   String received_otp = employeeBean.getOTP();
		   *//*************
			check OTP limit for the day
			
			*************//*
		   int count = employeeDao.getOTPCount(mobileNum);
		   if(count<=4){
			   String otp = employeeDao.getOtpOf(employeeBean.getPhoneNumber())+"";
			   if(StringUtils.isNotBlank(received_otp)  &&  otp.equals(received_otp)){
				   employeeDao.updateOtpStatus(mobileNum,otp);
				   return "matched";
			   }else{
				   employeeDao.updateCount(mobileNum, otp);
				   return "mismatched";
			   }
		   }else{
			   return "count_exceeded";
		   }
		   
		   
		   

	   }*/
	 
}
