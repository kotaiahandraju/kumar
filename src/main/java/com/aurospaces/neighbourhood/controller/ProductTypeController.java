package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.List;

import javax.enterprise.inject.Model;
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

import com.aurospaces.neighbourhood.bean.ProductTypeBean;
import com.aurospaces.neighbourhood.db.dao.ProductTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class ProductTypeController {
	
	
	private Logger logger = Logger.getLogger(ProductTypeController.class);
	@Autowired
	ProductTypeDao productTypeDao;
	
	@RequestMapping(value = "/producttype")
	public String producttype(@Valid @ModelAttribute("productForm") ProductTypeBean productTypeBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ProductTypeBean> listOrderBeans = null;
		try {
			listOrderBeans = productTypeDao.getProductType("1");
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
		return "producttype";
	}
	
	@RequestMapping(value = "/addProductType")
	public String addProductType(@ModelAttribute ProductTypeBean productTypeBean, RedirectAttributes redir) {

//			System.out.println("111111111111111111111111111"+productTypeBean.getId());
		int id = 0;
		String size = null;

		try {
			
			productTypeBean.setStatus("1");
			ProductTypeBean productTypeBean2 = productTypeDao.getByProductTpye(productTypeBean);
//			System.out.println("111111111111113333333333111111111"+productTypeBean2);
			int dummyId = 0;
			if (productTypeBean2 != null) {
				dummyId = productTypeBean2.getId();
			}
			if (productTypeBean.getId() != 0) {
				id = productTypeBean.getId();
				if (id == dummyId || productTypeBean2 == null) {

					productTypeDao.save(productTypeBean);
					redir.addFlashAttribute("msg", "Product Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (productTypeBean.getId() == 0 && productTypeBean2 == null) {
				productTypeDao.save(productTypeBean);

				redir.addFlashAttribute("msg", "Product Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (productTypeBean.getId() == 0 && productTypeBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:producttype";
	}

	 @RequestMapping(value = "/deleteproducttype")
	public @ResponseBody String deleteproducttype(ProductTypeBean productTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<ProductTypeBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			
			System.out.println("1111111111111111111111111111");
			if (productTypeBean.getId() != 0 && productTypeBean.getStatus() != "") {
				delete = productTypeDao.delete(productTypeBean.getId(),
						productTypeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = productTypeDao.getProductType("1");
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
	 
	 @RequestMapping(value = "/inActiveProductType")
		public @ResponseBody String inActiveRoomType(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<ProductTypeBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= productTypeDao.getProductType(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}

		
}
