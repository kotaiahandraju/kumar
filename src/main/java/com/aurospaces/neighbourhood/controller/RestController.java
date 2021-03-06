/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.bean.ProductnameBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.KhaibarUsersDao;
import com.aurospaces.neighbourhood.db.dao.LoginDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
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
	@Autowired PaymentDao paymentDao;
	@Autowired LoginDao loginDao;
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
			String delarId = null;
			OrdersListBean ordersList = null;
			 for (int i = 0; i < array.length(); i++)
		        {
		            JSONObject jsonObj = array.getJSONObject(i);
		             ordersList = new OrdersListBean();
		            ordersList.setDelerId(String.valueOf(jsonObj.get("delarId")));
		            ordersList.setQuantity(String.valueOf(jsonObj.get("quantity")));
		            ordersList.setProductId(String.valueOf(jsonObj.get("productId")));
		            ordersList.setBranchId(String.valueOf(jsonObj.get("branchId")));
		            ordersList.setInvoiceId(invoiceId);
		            ordersListDao.save(ordersList);
		            j++;
		            delarId =String.valueOf(jsonObj.get("delarId"));
		        }
			 cartDao.deleteByUserId(Integer.parseInt(delarId));
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
				employeeBean.setConfirm("0");
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

			 
		int count=	cartDao.countcartdetailsforMobile(ordersList);
		
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
	
	@RequestMapping(value = "rest/adddelarpayment")
	public @ResponseBody String addProductType(@RequestBody PaymentBean paymentBean) {
      JSONObject jsonObj = new JSONObject();
		try {
					if(StringUtils.isNotBlank(paymentBean.getStrpaymentDate()))	{
						Date date = KumarUtil.dateFormate(paymentBean.getStrpaymentDate());
						paymentBean.setPaymentDate(date);
					}
					paymentBean.setConfirm("0");
					paymentBean.setComment(" ");
					paymentDao.save(paymentBean);
					jsonObj.put("msg", "Paymnet Created Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	
	@RequestMapping(value = "rest/deletecart")
	public @ResponseBody String deletecart(@RequestBody CartBean cartBean) {
      JSONObject jsonObj = new JSONObject();
		try {
					
					int i = cartDao.delete(cartBean.getId());
					if(i !=0){
					jsonObj.put("msg", "deleted");
					}else{
						jsonObj.put("msg", "failed");
					}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	@RequestMapping(value = "rest/delarpaymentdetails")
	public @ResponseBody String delarpaymentdetails(@RequestBody PaymentBean paymentBean) {
      JSONObject jsonObj = new JSONObject();
      List<PaymentBean> listOrderBeans = null;
		try {
			
			listOrderBeans = paymentDao.getdelarpaymentdetails(paymentBean);
					jsonObj.put("paymentlist", listOrderBeans);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	@RequestMapping(value = "rest/delarpaymentbranches")
	public @ResponseBody String delarpaymentbranches(@RequestBody PaymentBean paymentBean) {
      JSONObject jsonObj = new JSONObject();
      List<PaymentBean>  listOrderBeans = null;
		try {
			
			listOrderBeans = paymentDao.getdelarpaymentdetailsBranches(paymentBean);
					jsonObj.put("paymentlist", listOrderBeans);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	@RequestMapping(value = "rest/delarconfirmation")
	public @ResponseBody String delarconfirmation(@RequestBody EmployeeBean employeeBean) {
      JSONObject jsonObj = new JSONObject();
      List<Map<String,Object>> listOrderBeans = null;
		try {
			
			listOrderBeans = empDao.getAllDelarsConfirm1(employeeBean);
					jsonObj.put("dealarlist", listOrderBeans);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(jsonObj);
	}
	@RequestMapping(value = "rest/authDetails")
	@ResponseBody public String authDetails(@RequestBody EmployeeBean employeeBean,	ModelMap model, HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
		 LoginBean loginBean=null;
		 boolean result=false;
		 EmployeeBean checkEmpId=null;
		 List<Map<String,Object>> listOrderBeans =null;
			String json = null;
			JSONObject jsonObject=new JSONObject();
		try {
			System.out.println("authDetailsauthDetailsauthDetails");
			
			boolean duplicate = empDao.isUsernameDuplicate(employeeBean.getUsername());
			if(duplicate){
				jsonObject.putOnce("msg", "true");
				return jsonObject.toString();
			}
			String password=CommonUtils.generatePIN();
			loginBean=new LoginBean();
			employeeBean.setPassword(password);
		loginBean.setUserName(employeeBean.getUsername());
		
		loginBean.setPassword(password);
		loginBean.setBranchId(employeeBean.getBranchId());
		loginBean.setRoleId("3");
		loginBean.setStatus("1");
		loginBean.setEmpId(String.valueOf(employeeBean.getId()));
		checkEmpId=empDao.getByEmployeeId(employeeBean);
		if(checkEmpId != null) {
			result=empDao.updateUsernameAndPasswordInEmp(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
			
			loginDao.save(loginBean);
			
//			employeeDao.updateUsernameAndPasswordLogin(employeeBean.getId(), employeeBean.getUsername(), employeeBean.getPassword());
			if(result) {
				 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
					//String propertiespath = "C:\\PRO\\Database.properties";
			
					input = new FileInputStream(propertiespath);
					// load a properties file
					prop.load(input);
					String msg = prop.getProperty("smsUsernameAndPassword");
					msg =msg.replace("_username_", employeeBean.getUsername());
					msg =msg.replace("_pass_", employeeBean.getPassword());
					if(StringUtils.isNotBlank(checkEmpId.getPhoneNumber())){
						
						// delar send sms
					SendSMS.sendSMS(msg, checkEmpId.getPhoneNumber(), objContext);
					
					}
				jsonObject.put("msg",  " Registered Successfully");
				
				
				
			}
		}
//		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(jsonObject);
	}
	
	@RequestMapping(value = "rest/dealerpaymentstatus")
	public @ResponseBody String dealerpaymentstatus(@RequestBody PaymentBean paymentBean) {
      JSONObject jsonObj = new JSONObject();
		try {
			
			paymentDao.dealerpaymentstatusupdate(paymentBean);
			jsonObj.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			jsonObj.put("msg", "failed");
		}
		return String.valueOf(jsonObj);
	}
	
	@RequestMapping(value = "rest/dealersList") 
	public @ResponseBody  String populateDealers(@RequestBody PaymentBean paymentBean, HttpSession session) {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		JSONObject jsonObject =new JSONObject();
		try {
			
			String sSql = "select id ,CONCAT(name, ' ( ', businessName,' )') AS   name from kumar_employee where roleId='3' and branch_id='"+paymentBean.getBranchId()+"' ";
			List<EmployeeBean> list = ordersListDao.populateDealers(sSql);
			jsonObject.put("dealersList", list);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return String.valueOf(jsonObject);
	}
	@RequestMapping(value = "rest/orderslist") 
	public @ResponseBody  String orderslist(@RequestBody OrdersListBean ordersListBean, HttpSession session) {
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObject =new JSONObject();
		try {
			listOrderBeans = ordersListDao.getOrderListAllForMobile(ordersListBean.getBranchId());
			jsonObject.put("orderslist", listOrderBeans);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return String.valueOf(jsonObject);
	}
	@RequestMapping(value = "rest/orderslistbasedealer") 
	public @ResponseBody  String orderslistbasedealer(@RequestBody OrdersListBean ordersListBean, HttpSession session) {
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObject =new JSONObject();
		try {
			listOrderBeans = ordersListDao.getOrderListDealerForMobile(ordersListBean.getDelerId());
			jsonObject.put("orderslist", listOrderBeans);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return String.valueOf(jsonObject);
	}
	@RequestMapping("rest/getItemsOfOrder")
	public @ResponseBody String getItemsOfOrder(@RequestBody OrdersListBean ordersListBean, HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			
			List<Map<String,Object>> itemsList = ordersListDao.getItemsOfOrder(ordersListBean.getOrderId());
			if(itemsList.size()>0){
				jsonObj.put("itemsList", itemsList);
			}else{
				jsonObj.put("itemsList", "");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return jsonObj.toString();
	}
	
	@RequestMapping("rest/saveDispatchedItemsData")
	public @ResponseBody String saveDispatchedItemsData(@RequestBody OrdersListBean ordersListBean,HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		Map<String,String> data = new HashMap<String,String>();
		try {
			
			String balance_qty = ordersListBean.getBalanceqty();
			data.put("order_id", ordersListBean.getOrderId());
			data.put("product_id", ordersListBean.getProductId());
			data.put("quantity", ordersListBean.getQuantity());
			//generate invoice number
			data.put("invoice_no", "eee");
			int bal_qty = 1;
			if(StringUtils.isNotBlank(balance_qty)){
				bal_qty = Integer.parseInt(balance_qty);
			}
			boolean success = ordersListDao.saveInvoice(data,bal_qty);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return jsonObj.toString();
	}
}
	