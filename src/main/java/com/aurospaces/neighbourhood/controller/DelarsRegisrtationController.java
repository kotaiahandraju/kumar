
package com.aurospaces.neighbourhood.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;

/**
 * @author Kotaiah
 *
 */
@Controller
public class DelarsRegisrtationController {
	@Autowired BranchDao branchDao;
	@Autowired EmployeeDao employeeDao;
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
	public String addDelar( @ModelAttribute("delar") EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {

		try {
			EmployeeBean objEmployeeBean = employeeDao.mobileDuplicateCheck(employeeBean);
			if(objEmployeeBean != null){
				redirect.addFlashAttribute("msg", "Alreday Registered ");
			}else{
				employeeDao.save(employeeBean);
				redirect.addFlashAttribute("msg", " Registered Successfully");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:LoginHome";
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
