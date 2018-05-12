/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonUtils.CommonUtils;

/**
 * @author YOGI
 */
@Controller
public class RestController {
	@Autowired KhaibarUsersDao objKhaibarUsersDao;
	@Autowired OrdersListDao ordersListDao;
	@Autowired ItemsDao itemsDao;
	@Autowired EmployeeDao empDao;
	@Autowired CartDao cartDao;
	@Autowired ServletContext objContext;
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
	@RequestMapping(value = "/rest/sendOtp")
	public @ResponseBody String sendOtp(HttpServletRequest request,@RequestBody EmployeeBean employeeBean) {
		JSONObject objJSON = new JSONObject();
		List<Map<String,Object>> listOrderBeans=null;
		InputStream input = null;
		String resultOtp = null;
		 Properties prop = new Properties();
		try{

			EmployeeBean objEmployeeBean = empDao.mobileDuplicateCheck(employeeBean);
			if (objEmployeeBean != null ) {
				
				objJSON.put("msg", "false");
				// System.out.println(sJson);
			} else {
				 employeeBean.setOTP(CommonUtils.generatePIN());
				 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
					//String propertiespath = "C:\\PRO\\Database.properties";
				 objJSON.put("msg", "true");
					input = new FileInputStream(propertiespath);
					// load a properties file
					prop.load(input);
					String msg1 = prop.getProperty("OTPForDealer");
					msg1 =msg1.replace("_otp_", employeeBean.getOTP());
					if(StringUtils.isNotBlank(employeeBean.getPhoneNumber())){
						// delar send OTP
						resultOtp=SendSMS.sendSMS(msg1, employeeBean.getPhoneNumber(), objContext);
					
					}
			}
			
			
			objJSON.put("Otp", employeeBean.getOTP());
			

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	@RequestMapping(value = "/rest/getAllBranches")
	public @ResponseBody String getAllBranches(HttpServletRequest request) {
		JSONObject objJSON = new JSONObject();
		try{
			String sSql = "select id,branchname from kumar_branch where  status='1'";
			List<EmployeeBean> list1 = empDao.branchNames(sSql);
			
			objJSON.put("branches", list1);
			

		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(objJSON);
	}
	
	@RequestMapping(value = "rest/addDelar")
	public @ResponseBody String addDelar(@RequestBody EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		InputStream input = null;
		JSONObject jsonObject = new JSONObject();
		 Properties prop = new Properties();
		try {
			EmployeeBean objEmployeeBean = empDao.mobileDuplicateCheck(employeeBean);
			if(objEmployeeBean != null){
				jsonObject.put("msg", "Alreday Registered ");
			}else{
				employeeBean.setRoleId("3");
				employeeBean.setStatus("0");
				empDao.save(employeeBean);
				 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
					//String propertiespath = "C:\\PRO\\Database.properties";
			
					input = new FileInputStream(propertiespath);
					// load a properties file
					prop.load(input);
					String msg = prop.getProperty("send_delar_sms");
					String msg1 = prop.getProperty("send_branch_manger_delardetails");
					msg1 =msg1.replace("_name_", employeeBean.getName());
					msg1 =msg1.replace("_mobile_", employeeBean.getPhoneNumber());
					if(StringUtils.isNotBlank(employeeBean.getPhoneNumber())){
						// delar send sms
					SendSMS.sendSMS(msg, employeeBean.getPhoneNumber(), objContext);
					
					}
				EmployeeBean empbean =	empDao.getBranchEmployees(employeeBean);
				if(empbean != null){
					// branch manager send sms
					SendSMS.sendSMS(msg1, empbean.getPhoneNumber(), objContext);
				}
				jsonObject.put("msg", " Registered Successfully ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObject);
	}
	@RequestMapping(value = "rest/addtocart")
	public @ResponseBody String addtocart(@RequestBody CartBean cartBean,	ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJSON = new JSONObject();
		System.out.println(cartBean.getCartList());
		JSONArray array = new JSONArray(cartBean.getCartList());
		CartBean ordersList= null;
		try{
			int j=0;
			
			 for (int i = 0; i < array.length(); i++)
		        {
		            JSONObject jsonObj = array.getJSONObject(i);
		             ordersList = new CartBean();
		            ordersList.setUserId(String.valueOf(jsonObj.get("userId")));
		            ordersList.setQuantity(String.valueOf(jsonObj.get("quantity")));
		            ordersList.setProductId(String.valueOf(jsonObj.get("productId")));
		            ordersList.setBranchId(String.valueOf(jsonObj.get("branchId")));
		            cartDao.save(ordersList);
		            j++;
		        }

			 
		int count=	cartDao.countcartdetails(ordersList);
		
		objJSON.put("count", count);
		objJSON.put("msg", "Item successfully added to your cart");
			
		}catch(Exception e){
			e.printStackTrace();
			objJSON.put("msg", "failed");
		}
		
		
				return String.valueOf(objJSON);
	}
	@RequestMapping(value = "rest/cartdetails")
	public @ResponseBody String cartdetails(@RequestBody CartBean cartBean,	ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Map<String,Object>> listOrderBeans = null;
		ObjectMapper objectMapper =null;
		String sJson = null;
		JSONObject objJson = new JSONObject();
		try{
			listOrderBeans = objKhaibarUsersDao.getallcartDetails(cartBean);
			objJson.put("cartList", listOrderBeans);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return String.valueOf(objJson);
	}
	
}
	