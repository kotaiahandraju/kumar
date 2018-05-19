package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.aurospaces.neighbourhood.util.SendSMS;

@Controller
public class LoginController {
	@Autowired KhaibarUsersDao objKhaibarUsersDao;
	
//	@Autowired SendSMS sendSMS;
	
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
	
	
	
	@RequestMapping(value = "/forgepasssword",method=RequestMethod.POST)
		public String LoginHome(ModelMap model, HttpServletRequest request,HttpSession session) throws IOException
	{
			String mobilenumber =request.getParameter("mobile");
			
			EmployeeBean employee =loginDao.getLoginBeanByMbile(mobilenumber);
			
			if(employee != null)
			{
				String msg ="your password is"+employee.getPassword();
				ServletContext objContext = null;
				//sendSMS.sendSMS(msg, mobilenumber, objContext);
				
			}
			else
			{
				System.out.println("employee not registered");
				
			}
			
			
			
		 
			return "loginPage1";
		}
}
