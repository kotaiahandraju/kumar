package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.aurospaces.neighbourhood.bean.BranchcreationBean;
import com.aurospaces.neighbourhood.bean.EmpcreationBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.EmpcreationDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class EmpCreationController {
	
	
	private Logger logger = Logger.getLogger(EmpCreationController.class);
	@Autowired
	LoginDao  loginDao;
	@Autowired
	EmpcreationDao  empcreationDao;
	
	@RequestMapping(value = "/employeeCreation")
	public String employeeCreation(@Valid @ModelAttribute("employeeCreationForm") EmpcreationBean empcreationBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<EmpcreationBean> listOrderBeans = null;
		try {
			listOrderBeans = empcreationDao.getEmployeeDetails("1");
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
	public String employeeCreationCreation(EmpcreationBean empcreationBean,RedirectAttributes redir) {


		int id = 0;
		String size = null;

		try {
			empcreationBean.setStatus("1");
			empcreationBean.setRoleId("2");
			EmpcreationBean empcreationBean2 = empcreationDao.getByEmployeeName(empcreationBean);
			int dummyId = 0;
			if (empcreationBean2 != null) {
				dummyId = empcreationBean2.getId();
			}
			if (empcreationBean.getId() != 0) {
				id = empcreationBean.getId();
				if (id == dummyId || empcreationBean2 == null) {

					empcreationDao.save(empcreationBean);
					LoginBean login = new LoginBean();
					login.setEmpId(empcreationBean.getEmp());
					login.setUserName(empcreationBean.getUserName());
					login.setPassword(empcreationBean.getPassword());
					login.setBranchId(empcreationBean.getBranchId());
					loginDao.updateLogin(login);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (empcreationBean.getId() == 0 && empcreationBean2 == null) {
				LoginBean login = new LoginBean();
				login.setEmpId(empcreationBean.getEmp());
				login.setUserName(empcreationBean.getUserName());
				login.setPassword(empcreationBean.getPassword());
				login.setStatus("1");
				login.setRoleId("2");
				login.setBranchId(empcreationBean.getBranchId());
				loginDao.save(login);
				empcreationDao.save(empcreationBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (empcreationBean.getId() == 0 && empcreationBean2 != null) {
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
	public @ResponseBody String deleteEmpCreation(EmpcreationBean empcreationBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<EmpcreationBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (empcreationBean.getId() != 0 && empcreationBean.getStatus() != "") {
				delete = empcreationDao.delete(empcreationBean.getId(),
						empcreationBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = empcreationDao.getEmployeeDetails("1");
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
	 
	 @RequestMapping(value = "/inActiveEmployeeCreation")
		public @ResponseBody String inActiveEmployeeCreation(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<EmpcreationBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= empcreationDao.getEmployeeDetails(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}

	 @ModelAttribute("branchId")
		public LinkedHashMap<Integer, String> populateCapacity() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,branchname from kumar_branch where  status='1'";
				List<EmpcreationBean> list = empcreationDao.branchNames(sSql);
				System.out.println("--------List-----"+list.size());
				for (EmpcreationBean bean : list) {
					statesMap.put(bean.getId(), bean.getBranchname());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
	 
	
}
