package com.aurospaces.neighbourhood.controller;
import javax.ws.rs.core.MediaType;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.Consumes;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.SampleBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.aurospaces.neighbourhood.util.SendSMS;

@Controller
public class LoginController {
	@Autowired KhaibarUsersDao objKhaibarUsersDao;
	
	@Autowired ServletContext objContext;
	@Autowired BranchDao branchDao;
	@Autowired LoginDao loginDao;
	@RequestMapping(value = "/LoginHome")
	public String LoginHome(Map<String, Object> model1, ModelMap model, HttpServletRequest request,
			HttpSession session)  {
		LoginBean loginBean = new LoginBean();
		model.put("loginForm", loginBean);
		try {
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				int rolId =Integer.parseInt(objuserBean.getRoleId());
				if(rolId == 1 || rolId == 2 || rolId == 3 ){
					return "redirect:admin/dashboard";
				}else{
//					return "redirect:employeeHome1.htm";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "loginPage1";
	}

	@RequestMapping(value = "/loginAction")
	public  String loginAction( @ModelAttribute("loginForm") LoginBean userObj, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redirect)	 {
//		System.out.println("loginAction page...");
		LoginBean objUserBean = null;
		JSONObject obj = new JSONObject();
		String object1 = null;
		try {
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "loginPage";
			}
			objUserBean = objKhaibarUsersDao.loginChecking(userObj);
			if (objUserBean != null ) {
//				if(objUserBean.getRoleId().equals("1")){
					session.setAttribute("cacheUserBean", objUserBean);
					session.setAttribute("roleId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUserName());
					session.setAttribute("branchName", objUserBean.getBranchName());
					if(objUserBean.getRoleId().equals("1")){
						return "redirect:admin/dashboardforbranchwise";
					}
					if(objUserBean.getRoleId().equals("2")){
						return "redirect:admin/dashboardfordealerwise";
					}
					return "redirect:admin/dashboard";
//				}
				
					
			} else {
				redirect.addFlashAttribute("msg", "Login Failed");
				request.setAttribute("msg", "Enter Valid Username/Password");
				return "loginPage1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return null;
	}
	@RequestMapping(value = "/logoutHome")
	public String logoutHome(ModelMap model, HttpServletRequest request, HttpSession objSession,
			HttpServletResponse response)  {
//		System.out.println("logout page...");
		try {

			HttpSession session = request.getSession(false);
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				session.removeAttribute("cacheUserBean");
				session.removeAttribute("cacheGuest");
				session.removeAttribute("rolId");
				session.removeAttribute("userName");
				session.removeAttribute("branchName");
				session.invalidate();
				response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// HTTP
																							// 1.1
				response.setHeader("Pragma", "no-cache"); // HTTP 1.0
				response.setDateHeader("Expires", -1); // prevents caching at
														// the proxy server
				// String baseUrl = MiscUtils.getBaseUrl(request);
				// System.out.println(baseUrl);
				// response.sendRedirect(baseUrl+"/LoginHome1.htm" );
//				response.sendRedirect(request.getContextPath() + "/LoginHome");
			}
			return "redirect:LoginHome";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "redirect:LoginHome";
	}
	
	
	
	@RequestMapping("/forgetpassword")
	 public String ShowForgetPasswordPage(Model model)
	 {
         return "forGetPassword";		 
		 
	 }
	
	@RequestMapping(value = "/forgepasssword",method=RequestMethod.POST)
		public String LoginHome(ModelMap model, HttpServletRequest request,HttpSession session,RedirectAttributes redir) throws IOException
	{
		InputStream input = null;
		 Properties prop = new Properties();
		 
		 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
		 input = new FileInputStream(propertiespath);
		// load a properties file
			prop.load(input);
		 String  msg = prop.getProperty("resetPassword");
		
		 
			String mobilenumber =request.getParameter("phoneNumber");
			
			EmployeeBean employee =loginDao.getLoginBeanByMbile(mobilenumber);
			
			if(employee != null)
			{
				//String msg ="your password is"+employee.getPassword();
				msg =msg.replace("_pass_", employee.getPassword());
				 msg =msg.replace("_username_",employee.getUsername() );
				 
				
				SendSMS.sendSMS(msg, mobilenumber, objContext);
				
				redir.addFlashAttribute("msg", "Password Sent Your Registered Mobile Number");
				redir.addFlashAttribute("cssMsg", "success");
				
			}
			else
			{
				//System.out.println("employee not registered");
				redir.addFlashAttribute("msg", "Employee Mobile Number Not Registered");
				redir.addFlashAttribute("cssMsg", "warning");
				
			}
			
			
			
		 
			return "redirect:forgetpassword";
		}
	
	
	@RequestMapping(value = "/sampleUrl")
	@ResponseBody public String sampleUrl(ModelMap model, HttpServletRequest request, HttpSession objSession,
			HttpServletResponse response)  {
//		System.out.println("logout page...");
		String name="Angular js learning";
		JSONObject jsonObject=new JSONObject();
		List<Map<String, Object>> branchBean=null;
		try {
			 //TODO: externalize the Allow-Origin
	        response.addHeader("Access-Control-Allow-Origin", "*");
	        response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE, HEAD");
	        response.addHeader("Access-Control-Allow-Headers", "X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
	        response.addHeader("Access-Control-Max-Age", "1728000");
	        branchBean= loginDao.getallPracticeData();
			jsonObject.put("data", branchBean);
			//System.out.println("hello sampleUrl ");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return String.valueOf(jsonObject);
	}
	
	@RequestMapping(value = "/sampleUrl1")
	@ResponseBody public String sampleUrl1(@RequestBody SampleBean sampleBean)  {
		JSONObject jsonObject=new JSONObject();
		System.out.println("logout sampleUrl1..."+sampleBean.getName()+"---mobile--");
		
		
		try {
			

			loginDao.saveBillDetails(sampleBean);
			
		List<Map<String, Object>> retList=loginDao.getallPracticeData();
			jsonObject.put("data", retList);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return String.valueOf(jsonObject);
	}
	
	
	@RequestMapping (value = "/sampleDeleteUrl")
	@ResponseBody public String sampleDeleteUrl(@RequestBody SampleBean sampleBean,HttpServletRequest request)  {
		JSONObject jsonObject=new JSONObject();
		
		try {
			
//			String name = request.getParameter("name");
			loginDao.deletePractice(sampleBean.getName());
			
		List<Map<String, Object>> retList=loginDao.getallPracticeData();
			jsonObject.put("data", retList);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return String.valueOf(jsonObject);
	}
	
	
	@RequestMapping(value = "/sampleUrlHome")
		public String sampleUrlHome()  {
//		
		try {
			System.out.println("Sample sampleUrl1...");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "practice";
	}
	
	
}
