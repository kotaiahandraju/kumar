
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.aurospaces.neighbourhood.util.SendSMS;

/**
 * @author Kotaiah
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class DealerCreationController {
	@Autowired BranchDao branchDao;
	@Autowired EmployeeDao employeeDao;
	@Autowired ServletContext objContext;
	@Autowired LoginDao loginDao;
	
	@RequestMapping(value = "/dealercreation")
	public String dealercreation( @ModelAttribute("delarForm") EmployeeBean employeeBean, HttpServletRequest request, HttpSession session) {

		try {
System.out.println("Dealer Creation Page");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "dealercreation";
	}
	@RequestMapping(value = "/addDealer")
	public String addDealer( @ModelAttribute("delar") EmployeeBean employeeBean,ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) throws IOException {
		LoginBean objLoginBean = new LoginBean();
		InputStream input = null;
		 Properties prop = new Properties();
		// String msg ="";
		 
		Random random = new Random();
		String  randompassword = String.format("%05d", random.nextInt(100000));
		employeeBean.setPassword(randompassword);
		
		String phnumber =employeeBean.getPhoneNumber();
		
		//String msg ="your KMPOS login details are username : "+phnumber+" password is :"+employeeBean.getPassword();
		
		 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
		 input = new FileInputStream(propertiespath);
		       String  msg = prop.getProperty("smsUsernameAndPassword");
		 msg =msg.replace("_username_",phnumber );
		 msg =msg.replace("_pass_", employeeBean.getPassword());
		 
		
	
		
		
		try {
			EmployeeBean objEmployeeBean = employeeDao.mobileDuplicateCheck(employeeBean);
			if(objEmployeeBean != null){
				redirect.addFlashAttribute("msg", "Alreday Registered ");
				redirect.addFlashAttribute("cssMsg", "warning");
			}else{
				employeeBean.setRoleId("3");
				employeeBean.setStatus("0");
				employeeBean.setStatus("1");
				employeeBean.setConfirm("1");
				LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
				if (objuserBean != null) {
					employeeBean.setBranchId(objuserBean.getBranchId());
					objLoginBean.setBranchId(objuserBean.getBranchId());

	}
				employeeDao.save(employeeBean);
				objLoginBean.setEmpId(String.valueOf(employeeBean.getId()));
				objLoginBean.setStatus("1");
				objLoginBean.setRoleId("3");
				objLoginBean.setUserName(employeeBean.getUsername());
				objLoginBean.setPassword(employeeBean.getPassword());
				loginDao.save(objLoginBean);
				SendSMS.sendSMS(msg, phnumber, objContext);
				redirect.addFlashAttribute("msg", " Registered Successfully");
				redirect.addFlashAttribute("cssMsg", "success");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:dealercreation";
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
	
	
	
	
	
	
	 
}
