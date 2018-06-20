package com.aurospaces.neighbourhood.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.db.dao.ProductnameDao;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;


@Controller
@RequestMapping(value = "/admin")
public class ProductNameController {
	
	
	private Logger logger = Logger.getLogger(ProductNameController.class);
	@Autowired
	ProductnameDao productnameDao;
	
	@RequestMapping(value = "/productName")
	public String productName(@Valid @ModelAttribute("productnameForm") ProductnameBean productnameBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ProductnameBean> listOrderBeans = null;
		try {
			listOrderBeans = productnameDao.getProductName("1");
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
		return "productName";
	}
	
	@RequestMapping(value = "/addProductname", method = RequestMethod.POST)
	public String addProductname(ProductnameBean productnameBean, @RequestParam("file") MultipartFile file,RedirectAttributes redir,HttpServletRequest request) {

		System.out.println("111111111111113333333333111111111"+productnameBean);
		System.out.println("saving staffDetails page..."+file.getOriginalFilename()+"----------requestImage------"+productnameBean.getImagePath());
		int id = 0;
		String size = null;
		String name=null;
		String sTomcatRootPath = null;
		String sDirPath = null;
		String filepath = null;

		try {
			
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				name =file.getOriginalFilename();
				int n=name.lastIndexOf(".");
				String ext1 = FilenameUtils.getExtension(name);
				filepath= MiscUtils.generateRandomString(5)+"."+ext1;
				//filepath= name+file.getContentType();
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				File dir = new File(rootPath + File.separator + "documents");
				if (!dir.exists()) {
					dir.mkdirs();
				}

				File serverFile = new File(dir.getAbsolutePath() + File.separator + filepath);
				try {
					try (InputStream is = file.getInputStream(); BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
						int i;
						while ((i = is.read()) != -1) {
							stream.write(i);
						}
						stream.flush();
					}
				} catch (IOException e) {
					System.out.println("error : " + e);
				}
				filepath= "documents/"+filepath;
				productnameBean.setDocuments(filepath);
				sTomcatRootPath = System.getProperty("catalina.base");
				sDirPath = sTomcatRootPath + File.separator + "webapps"+ File.separator + "documents" ;
				System.out.println(sDirPath);
				File file1 = new File(sDirPath);
				file.transferTo(file1);
			}
			
			
			String productname = productnameBean.getProductname(); 
			byte[] bytes = productname.getBytes(StandardCharsets.ISO_8859_1);
			productname = new String(bytes, StandardCharsets.UTF_8);
			productnameBean.setProductname(productname);
			
			
			productnameBean.setProductId(productnameBean.getProducttype());
			
			productnameBean.setStatus("1");
			ProductnameBean productnameBean2 = productnameDao.getByProductName(productnameBean);
			int dummyId = 0;
			if (productnameBean2 != null) {
				dummyId = productnameBean2.getId();
			}
			if (productnameBean.getId() != 0) {
				id = productnameBean.getId();
				if (id == dummyId || productnameBean2 == null) {
					
					if(productnameBean.getDocuments() == "" || productnameBean.getDocuments() == null){
						productnameBean.setDocuments(productnameBean.getImagePath());
						//System.out.println("---------setImagepath------");
					}
					
					productnameDao.save(productnameBean);
					redir.addFlashAttribute("msg", "Product Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (productnameBean.getId() == 0 && productnameBean2 == null) {
				productnameDao.save(productnameBean);

				redir.addFlashAttribute("msg", "Product Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (productnameBean.getId() == 0 && productnameBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:productName";
	}

	 @RequestMapping(value = "/deleteProductName")
	public @ResponseBody String deleteProductName(ProductnameBean productnameBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<ProductnameBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			System.out.println("---id---"+productnameBean.getId());
			if (productnameBean.getId() != 0 && productnameBean.getStatus() != "") {
				delete = productnameDao.delete(productnameBean.getId(),
						productnameBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = productnameDao.getProductName("1");
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
	 
	 @RequestMapping(value = "/inActiveProductName")
		public @ResponseBody String inActiveProductName(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<ProductnameBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans= productnameDao.getProductName(status);
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
	 @RequestMapping(value = "/getProductNameFilter")
		public @ResponseBody String getProductNameFilter(
				HttpServletResponse response, HttpServletRequest request,
				HttpSession objSession) throws JsonGenerationException, JsonMappingException, IOException {
			List<ProductnameBean> productnameBeans=null;
			String json="";
			String productId = request.getParameter("productId");
			productnameBeans =  productnameDao.getProductNameFilter(productId);
			ObjectMapper objmapper=new ObjectMapper();
			json=objmapper.writeValueAsString(productnameBeans);
			System.out.println("productnameBeans.size()==="+productnameBeans.size());
			request.setAttribute("seviceList", json);
		  return json;


		}
		
}
