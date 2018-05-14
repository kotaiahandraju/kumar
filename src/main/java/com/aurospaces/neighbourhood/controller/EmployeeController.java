package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class EmployeeController {
	
	
	private Logger logger = Logger.getLogger(EmployeeController.class);
	@Autowired
	EmployeeDao empDao;
	@Autowired
	LoginDao loginDao;
	@SuppressWarnings("unused")
	@RequestMapping(value = "/employeeCreation")
	public String employeeCreation( @ModelAttribute("employeeCreationForm") EmployeeBean employeeBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<EmployeeBean> listOrderBeans = null;
		try {
		listOrderBeans = empDao.getEmployeeDetails("1");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "employeeCreation";
	}
	
	@RequestMapping(value = "/addEmployeeCreation", method = RequestMethod.POST)
	public String employeeCreationCreation(EmployeeBean employeeBean,RedirectAttributes redir) {

		int id = 0;
		try {
		employeeBean.setStatus("1");
			employeeBean.setRoleId("2");
			EmployeeBean employeeBean2 = empDao.getByEmployeeName(employeeBean);
			int dummyId = 0;
			if (employeeBean2 != null) {
				dummyId = employeeBean2.getId();
			}
			if (employeeBean.getId() != 0) {
				id = employeeBean.getId();
				if (id == dummyId || employeeBean2 == null) {

					empDao.save(employeeBean);
					LoginBean login = new LoginBean();
					login.setEmpId(employeeBean.getName());
					login.setUserName(employeeBean.getUsername());
					login.setPassword(employeeBean.getPassword());
					login.setBranchId(employeeBean.getBranchId());
					loginDao.updateLogin(login);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (employeeBean.getId() == 0 && employeeBean2 == null) {
				empDao.save(employeeBean);
				LoginBean login = new LoginBean();
				login.setEmpId(String.valueOf(employeeBean.getId()));
				login.setUserName(employeeBean.getUsername());
				login.setPassword(employeeBean.getPassword());
				login.setStatus("1");
				login.setRoleId("2");
				login.setBranchId(employeeBean.getBranchId());
				loginDao.save(login);
				

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (employeeBean.getId() == 0 && employeeBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:employeeCreation";
	}

	 @RequestMapping(value = "/deleteEmpCreation")
	public @ResponseBody String deleteEmpCreation(EmployeeBean employeeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<EmployeeBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (employeeBean.getId() != 0 && employeeBean.getStatus() != "") {
				delete = empDao.delete(employeeBean.getId(),
						employeeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = empDao.getEmployeeDetails("1");
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			logger.fatal("error in deleteRoomType class deleteEducation method  ");
			jsonObj.put("message", "excetption" + e);
			return sJson;

		}
		return sJson;
	}
	 
	 @SuppressWarnings("unused")
	@RequestMapping(value = "/inActiveEmployeeCreation")
		public @ResponseBody String inActiveEmployeeCreation(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<EmployeeBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= empDao.getEmployeeDetails(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				 System.out.println(sJson);
			}
			
			return sJson;
		}

	 @ModelAttribute("branchId")
		public LinkedHashMap<Integer, String> populateCapacity() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,branchname from kumar_branch where  status='1'";
				List<EmployeeBean> list = empDao.branchNames(sSql);
				System.out.println("--------List-----"+list.size());
				for (EmployeeBean bean : list) {
					statesMap.put(bean.getId(), bean.getBranchname());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
	 
	 
}
