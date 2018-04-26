/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;

/**
 * @author YOGI
 */
@Controller
public class RestController {
	@Autowired KhaibarUsersDao objKhaibarUsersDao;
	@RequestMapping(value = "/rest/getLogin")
	public @ResponseBody String getLogin(@RequestBody LoginBean loginBean ,  HttpServletRequest request) throws Exception {
		List<Map<String,Object>> list=null;
		JSONObject objJSON = new JSONObject();
		try{
			list = objKhaibarUsersDao.getloginChecking(loginBean);
			System.out.println(loginBean);
			if(list != null){
				objJSON.put("loginList", list);
				
			}else{
				objJSON.put("loginList", "");
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/rest/getProductList", method=RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String getProductList() throws Exception {
		List<Map<String,Object>> list=null;
		JSONObject objJSON = new JSONObject();
		try{
			list = objKhaibarUsersDao.getProductList();
			System.out.println(list.size());
			if(list != null){
				objJSON.put("loginList", list);
				
			}else{
				objJSON.put("loginList", "");
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@SuppressWarnings("unused")
	@RequestMapping(value = "/rest/getProductCategory")
	public @ResponseBody String getProductCategory() throws Exception {
		List<Map<String,Object>> list=null;
		JSONObject objJSON = new JSONObject();
		try{
			list = objKhaibarUsersDao.getProductCategory();
			System.out.println(list.size());
			if(list != null){
				objJSON.put("loginList", list);
				
			}else{
				objJSON.put("loginList", "");
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@SuppressWarnings("unused")
	@RequestMapping(value = "/rest/getProductSubCategory")
	public @ResponseBody String getProductSubCategory() throws Exception {
		List<Map<String,Object>> list=null;
		JSONObject objJSON = new JSONObject();
		try{
			list = objKhaibarUsersDao.getProductSubCategory();
			System.out.println(list.size());
			if(list != null){
				objJSON.put("loginList", list);
				
			}else{
				objJSON.put("loginList", "");
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	
	/*@RequestMapping(value="/getproducts", method=RequestMethod.POST, consumes = "application/json", produces = "application/json")  
	public String  getProductslist() throws JsonProcessingException, JSONException {
		LOGGER.debug("Calling getproducts at controller");
		List<Product> listOrderBeans =  productDao.getProductDetails();
		
		JSONObject json =new JSONObject();
		
		
		
		
			
			//ObjectMapper objectMapper = new ObjectMapper();
			//String userjson = objectMapper.writeValueAsString(userBean);
			//String categoryjson = objectMapper.writeValueAsString(listOrderBeans);
			
			if(null != listOrderBeans)
			{
				json.put("productDetails", listOrderBeans);
				
			}
			else
				//code="NOT_FOUND";
				
				json.put("productDetails", "NOT_FOUND");
		
		

		
		return String.valueOf(json);
	}*/
}
	