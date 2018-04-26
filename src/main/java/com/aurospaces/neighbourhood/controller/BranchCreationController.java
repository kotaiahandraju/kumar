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
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.BranchcreationDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class BranchCreationController {
	
	
	private Logger logger = Logger.getLogger(BranchCreationController.class);
	@Autowired
	LoginDao  loginDao;
	@Autowired
	BranchcreationDao  branchcreationDao;
	
	@RequestMapping(value = "/branchCreation")
	public String branchCreation(@Valid @ModelAttribute("branchCreationForm") BranchcreationBean branchcreationBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BranchcreationBean> listOrderBeans = null;
		try {
			listOrderBeans = branchcreationDao.getBranchcreationDetails("1","2");
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
		return "branchCreation";
	}
	
	@RequestMapping(value = "/addBranchCreation", method = RequestMethod.POST)
	public String addBranchCreation(BranchcreationBean branchcreationBean,RedirectAttributes redir) {


		int id = 0;
		String size = null;

		try {
			branchcreationBean.setStatus("1");
			branchcreationBean.setRoleId("2");
			BranchcreationBean branchcreationBean2 = branchcreationDao.getBybranchCreationName(branchcreationBean);
			int dummyId = 0;
			if (branchcreationBean2 != null) {
				dummyId = branchcreationBean2.getId();
			}
			if (branchcreationBean.getId() != 0) {
				id = branchcreationBean.getId();
				if (id == dummyId || branchcreationBean2 == null) {

					branchcreationDao.save(branchcreationBean);
					LoginBean login = new LoginBean();
					login.setEmpId(branchcreationBean.getEmployeename());
					login.setUserName(branchcreationBean.getUserName());
					login.setPassword(branchcreationBean.getPassword());
					login.setBranchId(branchcreationBean.getBranchname());
					loginDao.updateLogin(login);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (branchcreationBean.getId() == 0 && branchcreationBean2 == null) {
				LoginBean login = new LoginBean();
				login.setEmpId(branchcreationBean.getEmployeename());
				login.setUserName(branchcreationBean.getUserName());
				login.setPassword(branchcreationBean.getPassword());
				login.setStatus("1");
				login.setRoleId("2");
				login.setBranchId(branchcreationBean.getBranchname());
				loginDao.save(login);
				branchcreationDao.save(branchcreationBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (branchcreationBean.getId() == 0 && branchcreationBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:branchCreation";
	}

	 @RequestMapping(value = "/branchCreationDelete")
	public @ResponseBody String branchCreationDelete(BranchcreationBean branchcreationBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<BranchcreationBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (branchcreationBean.getId() != 0 && branchcreationBean.getStatus() != "") {
				delete = branchcreationDao.delete(branchcreationBean.getId(),
						branchcreationBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = branchcreationDao.getBranchcreationDetails("1","2");
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			logger.fatal("error in deleteRoomType class deleteEducation method  ");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	 
	 @RequestMapping(value = "/inActiveBranchCreation")
		public @ResponseBody String inActiveBranchCreation(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<BranchcreationBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= branchcreationDao.getBranchcreationDetails(status,"3");
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}

	 @ModelAttribute("branchName")
		public LinkedHashMap<Integer, String> populateCapacity() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,branchname from kumar_branch where  status='1'";
				List<BranchcreationBean> list = branchcreationDao.branchNames(sSql);
				System.out.println("--------List-----"+list.size());
				for (BranchcreationBean bean : list) {
					statesMap.put(bean.getId(), bean.getBranchname());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
	 
	 @ModelAttribute("employeeName")
		public LinkedHashMap<Integer, String> populateProductNames() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,employeename from kumar_employee where  status='1' and roleId='2'";
				List<BranchcreationBean> list = branchcreationDao.employeeNames(sSql);
				System.out.println("--------List-----"+list.size());
				for (BranchcreationBean bean : list) {
					statesMap.put(bean.getId(), bean.getEmployeename());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
}
