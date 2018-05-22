package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
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

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class BranchController {
	
	
	private Logger logger = Logger.getLogger(BranchController.class);
	@Autowired
	BranchDao branchDao;
	
	@RequestMapping(value = "/branchHome")
	public String branchHome(@Valid @ModelAttribute("branchForm") BranchBean branchBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BranchBean> listOrderBeans = null;
		try {
			System.out.println("dsgfahdfglaefrhuiwehfuwrfefluyg");
			listOrderBeans = branchDao.getBranchDetails("1");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				 System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "branchHome";
	}
	
	@RequestMapping(value = "/addBranch", method = RequestMethod.POST)
	public String addProductname(BranchBean branchBean,RedirectAttributes redir) {

		int id = 0;
		String size = null;

		try {
			branchBean.setStatus("1");
			BranchBean branchBean2 = branchDao.getBybranchName(branchBean);
			int dummyId = 0;
			if (branchBean2 != null) {
				dummyId = branchBean2.getId();
			}
			if (branchBean.getId() != 0) {
				id = branchBean.getId();
				if (id == dummyId || branchBean2 == null) {

					branchDao.save(branchBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (branchBean.getId() == 0 && branchBean2 == null) {
				branchDao.save(branchBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (branchBean.getId() == 0 && branchBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:branchHome";
	}

	 @RequestMapping(value = "/deleteBranch")
	public @ResponseBody String deleteBranch(BranchBean branchBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<BranchBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			System.out.println("---id---"+branchBean.getId());
			if (branchBean.getId() != 0 && branchBean.getStatus() != "") {
				delete = branchDao.delete(branchBean.getId(),
						branchBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = branchDao.getBranchDetails("1");
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
	 
	 @RequestMapping(value = "/inActiveBranch")
		public @ResponseBody String inActiveBranch(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<BranchBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= branchDao.getBranchDetails(status);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				System.out.println(sJson+"aaaaaa111");
			}
			
			return sJson;
		}
	 
	/* @ModelAttribute("productType")
		public LinkedHashMap<Integer, String> populateCapacity() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,producttype from producttype where  status='1'";
				List<ProductnameBean> list = branchDao.populateProductType(sSql);
				System.out.println("--------List-----"+list.size());
				for (ProductnameBean bean : list) {
					statesMap.put(bean.getId(), bean.getProducttype());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}	
	 @RequestMapping(value = "/getProductNameFilter")
		public @ResponseBody String getProductNameFilter(
				HttpServletResponse response, HttpServletRequest request,
				HttpSession objSession) throws JsonGenerationException, JsonMappingException, IOException {
			List<ProductnameBean> productnameBeans=null;
			String json="";
			String productId = request.getParameter("productId");
			productnameBeans =  branchDao.getProductNameFilter(productId);
			ObjectMapper objmapper=new ObjectMapper();
			json=objmapper.writeValueAsString(productnameBeans);
			System.out.println("productnameBeans.size()==="+productnameBeans.size());
			request.setAttribute("seviceList", json);
		  return json;


		}*/
		
}
