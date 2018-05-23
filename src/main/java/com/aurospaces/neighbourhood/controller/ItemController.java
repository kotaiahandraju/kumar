package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
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

import com.aurospaces.neighbourhood.bean.BranchProducts;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.BranchProductsDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.ProductnameDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class ItemController {
	
	
	private Logger logger = Logger.getLogger(ItemController.class);
	@Autowired
	ItemsDao  itemsDao;
	@Autowired
	ProductnameDao productnameDao;
	@Autowired BranchProductsDao branchProductsDao;
	@Autowired  BranchDao branchDao;
	@RequestMapping(value = "/items")
	public String items(@Valid @ModelAttribute("itemsForm") ItemsBean itemsBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		try {
			listOrderBeans = itemsDao.getItems("1");
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
		return "items";
	}
	
	@RequestMapping(value = "/addItems", method = RequestMethod.POST)
	public String addProductType(ItemsBean itemsBean,RedirectAttributes redir,HttpSession session) {


		int id = 0;
		String size = null;

		try {
			
			String itemdescrption = itemsBean.getItemdescrption(); 
			byte[] bytes = itemdescrption.getBytes(StandardCharsets.ISO_8859_1);
			itemdescrption = new String(bytes, StandardCharsets.UTF_8);
			itemsBean.setItemdescrption(itemdescrption);
			
			String itemcode = itemsBean.getItemcode(); 
			byte[] bytes1 = itemcode.getBytes(StandardCharsets.ISO_8859_1);
			itemcode = new String(bytes1, StandardCharsets.UTF_8);
			itemsBean.setItemcode(itemcode);
			
			
			
			itemsBean.setProductId(itemsBean.getProducttype());
			itemsBean.setProductname(itemsBean.getProductname());
			itemsBean.setStatus("1");
			ItemsBean itemsBean2 = itemsDao.getByItemSerialNo(itemsBean);
			int dummyId = 0;
			if (itemsBean2 != null) {
				dummyId = itemsBean2.getId();
			}
			if (itemsBean.getId() != 0) {
				id = itemsBean.getId();
				if (id == dummyId || itemsBean2 == null) {

					itemsDao.save(itemsBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			
			if (itemsBean.getId() == 0 && itemsBean2 == null) {
				itemsDao.save(itemsBean);
				LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
				if (objuserBean != null && objuserBean.getRoleId().equals("1")) {
					
						BranchProducts	branchProducts = new BranchProducts();
						branchProducts.setProductId(String.valueOf(itemsBean.getId()));
						branchProducts.setBranchId("all");
						branchProductsDao.save(branchProducts);
				}
					if (objuserBean != null && objuserBean.getRoleId().equals("2")) {
						BranchProducts	branchProducts1 = new BranchProducts();
						branchProducts1.setProductId(String.valueOf(itemsBean.getId()));
						branchProducts1.setBranchId(objuserBean.getBranchId());
						branchProductsDao.save(branchProducts1);
					}
				
				
				
				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (itemsBean.getId() == 0 && itemsBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:items";
	}

	 @RequestMapping(value = "/itemDelete")
	public @ResponseBody String itemDelete(ItemsBean productTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<ItemsBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (productTypeBean.getId() != 0 && productTypeBean.getStatus() != "") {
				delete = itemsDao.delete(productTypeBean.getId(),
						productTypeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = itemsDao.getItems("1");
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
	 
	 @RequestMapping(value = "/inActiveItem")
		public @ResponseBody String inActiveItem(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<ItemsBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= itemsDao.getItems(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}

	 @ModelAttribute("productType")
		public LinkedHashMap<Integer, String> populateCapacity() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,producttype from producttype where  status='1'";
				List<ProductnameBean> list = productnameDao.populateProductType(sSql);
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
	 
	 @ModelAttribute("productName")
		public LinkedHashMap<Integer, String> populateProductNames() {
			LinkedHashMap<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id,productname from productname where  status='1'";
				List<ProductnameBean> list = productnameDao.populateProductName(sSql);
				System.out.println("--------List-----"+list.size());
				for (ProductnameBean bean : list) {
					statesMap.put(bean.getId(), bean.getProductname());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
}
