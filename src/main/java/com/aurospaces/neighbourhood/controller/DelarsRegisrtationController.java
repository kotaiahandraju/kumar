
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
			
			 EmployeeBean otpChecking= employeeDao.otpChecking(employeeBean);
			 if(otpChecking.getOTP().equals(employeeBean.getOTP())) {
				 EmployeeBean objEmployeeBean = employeeDao.mobileDuplicateCheck(employeeBean);
					if(objEmployeeBean != null){
//						redirect.addFlashAttribute("msg", "Alreday Registered ");
						jsonObj.put("msg", "success");
					}else{
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
							
							}
						EmployeeBean empbean =	employeeDao.getBranchEmployees(employeeBean);
						if(empbean != null){
							// branch manager send sms
							SendSMS.sendSMS(msg1, empbean.getPhoneNumber(), objContext);
						}
//						redirect.addFlashAttribute("msg", " Registered Successfully");
						jsonObj.put("msg", "fail");
					}
			 }
			
			
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
					
					jsonObj.put("fail", "failed");
					// System.out.println(sJson);
				} else {
					 employeeBean.setOTP(CommonUtils.generatePIN());
					 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
						//String propertiespath = "C:\\PRO\\Database.properties";
				
						input = new FileInputStream(propertiespath);
						// load a properties file
						prop.load(input);
						String msg1 = prop.getProperty("OTPForDealer");
						msg1 =msg1.replace("_otp_", employeeBean.getOTP());
						if(StringUtils.isNotBlank(employeeBean.getPhoneNumber())){
							
							 employeeDao.saveOtp(employeeBean);
							
							// delar send OTP
							resultOtp=SendSMS.sendSMS(msg1, employeeBean.getPhoneNumber(), objContext);
						if(resultOtp=="ok") {
							jsonObj.put("success",employeeBean.getOTP());
						}
						
						}
				}
			} catch (Exception e) {
				e.printStackTrace();
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);

			}
			return String.valueOf(jsonObj);
		}
	
	
	 
}
