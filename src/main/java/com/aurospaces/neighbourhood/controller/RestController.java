/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author YOGI
 */
@Controller
public class RestController {
	@Autowired KhaibarUsersDao objKhaibarUsersDao;
	@Autowired OrdersListDao ordersListDao;
	@Autowired ItemsDao itemsDao;
	@RequestMapping(value = "/rest/getLogin")
	public @ResponseBody String getLogin(@RequestBody LoginBean loginBean ,  HttpServletRequest request) throws Exception {
		List<Map<String,Object>>  list=null;
		JSONObject objJSON = new JSONObject();
		try{
			ObjectMapper objectMapper = new ObjectMapper();
			String branchid = null;
			list = objKhaibarUsersDao.getloginChecking(loginBean);
			System.out.println(loginBean);
			if(list != null){
				
				for (Map<String, Object> map : list) {
					System.out.println(map.get("branchId"));
					branchid = String.valueOf(map.get("branchId"));
				}
//				 branchid = list.getBranchId();
				objJSON.put("loginList", list);
				
			}else{
				objJSON.put("loginList", "");
			}
			List<Map<String,Object>> delarlist = objKhaibarUsersDao.getDonarList(branchid);
			objJSON.put("delarlist", delarlist);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/rest/getProductListAll", method=RequestMethod.POST, consumes = "application/json", produces = "application/json")
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
	
	@RequestMapping(value = "/rest/placingorder")
	public @ResponseBody String placingorder(HttpServletRequest request,@RequestBody ProductnameBean productnameBean) {
		JSONObject objJSON = new JSONObject();
		System.out.println(productnameBean.getProductlist());
		JSONArray array = new JSONArray(productnameBean.getProductlist());
		try{
			int j=0;
			KumarUtil utils = new KumarUtil();
			String invoiceId = utils.randNum();
			 for (int i = 0; i < array.length(); i++)
		        {
		            JSONObject jsonObj = array.getJSONObject(i);
		            OrdersListBean ordersList = new OrdersListBean();
		            ordersList.setDelerId(String.valueOf(jsonObj.get("delarId")));
		            ordersList.setQuantity(String.valueOf(jsonObj.get("quantity")));
		            ordersList.setProductId(String.valueOf(jsonObj.get("productId")));
		            ordersList.setInvoiceId(invoiceId);
		            ordersListDao.save(ordersList);
		            j++;
		        }

			 objJSON.put("msg", "Successfully "+j+" Product's has been ordered");
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@RequestMapping(value = "/rest/vieworders")
	public @ResponseBody String vieworders(HttpServletRequest request,@RequestBody ProductnameBean productnameBean) {
		JSONObject objJSON = new JSONObject();
		List<Map<String,Object>> list=null;
		try{
			list = objKhaibarUsersDao.viewOrderList(productnameBean.getDelarId());
			objJSON.put("ordersList", list);

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@RequestMapping(value = "/rest/getinvoicedata")
	public @ResponseBody String getinvoicedata(HttpServletRequest request,@RequestBody OrdersListBean ordersListBean) {
		JSONObject objJSON = new JSONObject();
		List<Map<String,Object>> list=null;
		try{
			list = ordersListDao.getInvoiceData(ordersListBean);
			objJSON.put("ordersList", list);

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@RequestMapping(value = "/rest/subcategory")
	public @ResponseBody String subcategory(HttpServletRequest request) {
		JSONObject objJSON = new JSONObject();
		List<Map<String,Object>> list=null;
		try{
			list = itemsDao.getSubcategory();
			objJSON.put("subcategory", list);

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@RequestMapping(value = "/rest/getProductList")
	public @ResponseBody String getProductList(HttpServletRequest request,@RequestBody ItemsBean itemsBean) {
		JSONObject objJSON = new JSONObject();
		List<Map<String,Object>> list=null;
		try{
			list = itemsDao.getsubgategoryProductList(itemsBean);
			objJSON.put("productList", list);

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
}
	