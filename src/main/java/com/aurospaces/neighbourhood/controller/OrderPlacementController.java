package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.db.dao.ProductnameDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonUtils.CommonUtils;
@Controller
@RequestMapping(value="/admin")
public class OrderPlacementController {
	@Autowired EmployeeDao employeeDao;
	@Autowired	ItemsDao  itemsDao;
	@Autowired	ProductnameDao productnameDao;
	@Autowired OrdersListDao ordersListDao;
	@Autowired OrdersListDao listDao;
	@Autowired ServletContext objContext;
	@Autowired CartDao cartDao;
	@Autowired BranchDao branchDao;
	KumarUtil kumarUtil= new KumarUtil();
	@RequestMapping(value="/orderplacing")
	public String orderPlacement(HttpServletRequest request){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		Map<String,Map<String,Object>> sub_category_map = new HashMap<String,Map<String,Object>>();
		try{

			listOrderBeans = itemsDao.getItems("1");
			for(ItemsBean item:listOrderBeans){
				String key = item.getProductname()+"##"+item.getProductIdName();
				if(sub_category_map.containsKey(key)){
					Map<String,Object> val_map = sub_category_map.get(key);
					val_map.put(item.getItemcode()+"##"+item.getId()+"##"+item.getItemprice(),item.getItemdescrption());
					
				}else{
					Map<String,Object> val_map = new HashMap<String,Object>();
					val_map.put(item.getItemcode()+"##"+item.getId()+"##"+item.getItemprice(),item.getItemdescrption());
					sub_category_map.put(key, val_map);
				}
			}
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(sub_category_map);
			request.setAttribute("sub_category_map", sJson);
			
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}
			
		
			
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "orderPlacement";
		
	}
	@RequestMapping(value="/dealerorderproducts")
	public @ResponseBody String dealerorderproducts(OrdersListBean orderslistbean,ModelMap model,HttpServletRequest request,RedirectAttributes redir,HttpSession session){
		JSONArray jsonArray = new JSONArray();
		InputStream input = null;
		String body = null;
		 Properties prop = new Properties();
		
		try{
			if(StringUtils.isNotBlank(orderslistbean.getProductId())){
				String productArray[] = orderslistbean.getProductId().split(",");
				String quantityArray[] = orderslistbean.getQuantity().split(",");
				String amountArray[] = orderslistbean.getAmount().split(",");
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				String prefix = "Kumar";
				
				// create instance of Random class
		        Random rand = new Random();
		                        
		        // Generate random integers in range 0 to 999
		        int rand_int = rand.nextInt(10000);
		        String branchCode=null;
				int branchCount=0;
				if(StringUtils.isEmpty(orderslistbean.getDelerId())) {
					orderslistbean.setDelerId(objuserBean.getEmpId());
				}
				orderslistbean.setBranchId(objuserBean.getBranchId());
//				List<BranchBean> orderList=ordersListDao.getOrderListCountByBranchId(objuserBean.getBranchId());
				BranchBean branchList= branchDao.getBybranchCodeById(objuserBean.getBranchId());
				if(branchList ==null) {
					branchCount=1;
					
				}else {
						branchCode=branchList.getBranchcode();
						 branchCount=branchList.getBranchCount()+1;
				}
				
//				prefix = prefix+"-"+ objuserBean.getBranchId()+"-";
//				System.out.println(" Custom generated Sequence value " + prefix.concat(new Integer(rand_int).toString()));
				JSONObject jsonObj1 = new JSONObject();
				JSONObject jsonObj2 = new JSONObject();
				for(int i=0;i<productArray.length;i++){
					
					int totalamount	=Integer.parseInt(amountArray[i]) * Integer.parseInt(quantityArray[i]);
					
					orderslistbean.setId(0);
					orderslistbean.setProductId(productArray[i]);
					orderslistbean.setQuantity(quantityArray[i]);
					orderslistbean.setInvoiceId(kumarUtil.randNum());
					orderslistbean.setAmount(amountArray[i]);
					orderslistbean.setTotalamount(String.valueOf(totalamount));
					int year=Integer.parseInt(CommonUtils.getYear())+1;
					branchCount=Integer.parseInt(String.format("%4s", branchCount).replace(' ', '0'));
//					System.out.println(String.format("%4s", branchCount).replace(' ', '0'));
					orderslistbean.setOrderId(branchCode+"/"+CommonUtils.getYear()+""+year+"/"+CommonUtils.getMonth()+"/"+String.format("%4s", branchCount).replace(' ', '0'));
					ordersListDao.save(orderslistbean);
					
						}
					jsonObj1.put("invoiceId", orderslistbean.getInvoiceId());
					jsonObj1.put("orderId", orderslistbean.getOrderId());
					
					jsonObj2.put(orderslistbean.getProductId(), orderslistbean.getQuantity()) ;
					
					model.addAttribute("invoiceDetails", jsonObj1);
					model.addAttribute("productList", jsonObj2);
					jsonArray.put(jsonObj1);
					jsonArray.put(jsonObj2);
				}
			
			
			String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			//String propertiespath = "C:\\PRO\\Database.properties";
	
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			 EmployeeBean objDealerMobileNo=null;
				EmployeeBean objMobileNo=employeeDao.getMobileNo(objuserBean.getEmpId());
				String mobileNo=objMobileNo.getPhoneNumber();
				 //System.out.println("----branch mobile :"+mobileNo);
				String msg = prop.getProperty("smsForManager");
				msg =msg.replace("_invoice_",orderslistbean.getOrderId());
				if(StringUtils.isNotBlank(mobileNo)){
					// delar send sms
				SendSMS.sendSMS(msg,mobileNo, objContext);
				
				}
				 String roleId=objuserBean.getRoleId();
				 //System.out.println("roleId=="+roleId+"----objMobileNo.getBranchId()---"+objMobileNo.getBranchId());
				 if(roleId.equals("3")) {
					// System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
					 objDealerMobileNo= employeeDao.getBranchHeadBean(objMobileNo.getBranchId());
				 }else {
					  objDealerMobileNo=employeeDao.getMobileNo(orderslistbean.getDelerId());
				 }
				
				if(objDealerMobileNo !=null) {
					String dealerMobile=objDealerMobileNo.getPhoneNumber();
					//System.out.println("dealer Id "+dealerMobile);
						String msg1 = prop.getProperty("smsForDealer");
						msg1 =msg1.replace("_invoice_",orderslistbean.getOrderId());
						SendSMS.sendSMS(msg1,dealerMobile, objContext);
				}
				

				if(StringUtils.isEmpty(orderslistbean.getDelerId())) {
				 cartDao.deleteByUserId(Integer.parseInt(objuserBean.getEmpId()));
				}else {
					cartDao.deleteByUserId(Integer.parseInt(orderslistbean.getDelerId()));
				}
			
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(jsonArray);
		
	}
	
	
	 @RequestMapping(value = "/orederLists")
		public @ResponseBody String orederLists(@RequestParam("dealerId") String dealerId,@RequestParam("status") String status,HttpServletRequest request, HttpSession session) {
//			System.out.println("orederLists page...");
			List<Map<String, Object>> listOrderBeans = null;
			JSONObject jsonObj = new JSONObject();
			ObjectMapper objectMapper = null;
			String sJson = null;
			boolean delete = false;
			try {

				LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
				if(objuserBean.getRoleId().equals("3")){ // means dealer
					dealerId = objuserBean.getEmpId();
				}
				listOrderBeans = listDao.getOrdersList(dealerId,objuserBean.getBranchId(),status);
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
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);

			}
			return String.valueOf(jsonObj);
		}
	

	@RequestMapping(value="/orderslist")
	public String orderslist(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			all_orders = listDao.getAllOrders(objuserBean.getBranchId());
			if (all_orders != null && all_orders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(all_orders);
				request.setAttribute("all_orders", sJson);
			} else {
				request.setAttribute("all_orders", "''");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "orderslist";
		
	}
	
	@ModelAttribute("dealersList")
	public Map<Integer, String> populateDealers(HttpSession session) {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			
			
			String sSql = "select id ,CONCAT(name, ' ( ', businessName,' )') AS   name from kumar_employee where roleId='3' and branch_id='"+objuserBean.getBranchId()+"' ";
			List<EmployeeBean> list = listDao.populateDealers(sSql);
			for (EmployeeBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	@RequestMapping("/getItemsOfOrder")
	public @ResponseBody String getItemsOfOrder(HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			
			
			String order_id = request.getParameter("order_id");
			List<Map<String,Object>> itemsList = listDao.getItemsOfOrder(order_id);
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
	
	@RequestMapping("/getDeliveredItemsHistory")
	public @ResponseBody String getDeliveredItemsHistory(HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			
			String order_id = request.getParameter("order_id");
			List<Map<String,Object>> itemsList = listDao.getDeliveredItemsHistory(order_id);
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
	
	@RequestMapping("/saveDispatchedItemsData")
	public @ResponseBody String saveDispatchedItemsData(HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			
			
			String order_id = request.getParameter("order_id");
			String product_id = request.getParameter("product_id");
			String quantity = request.getParameter("quantity");
			String balance_qty = request.getParameter("balance_qty");
			String nullify_qty = request.getParameter("nullify_qty");
			Map<String,String> data = new HashMap<String,String>();
			data.put("order_id", order_id);
			data.put("product_id", product_id);
			data.put("quantity", StringUtils.isNotBlank(quantity)?quantity:"0");
			data.put("nullified_qty", StringUtils.isNotBlank(nullify_qty)?nullify_qty:"0");
			//generate invoice number
			data.put("invoice_no", "eee");
			int bal_qty = 1;
			if(StringUtils.isNotBlank(balance_qty)){
				bal_qty = Integer.parseInt(balance_qty);
			}
			boolean success = listDao.saveInvoice(data,bal_qty);
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
	


	@RequestMapping(value = "/myorderLists")
	public  String myOrders(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,Model model,HttpServletRequest request,HttpSession session) 
	{
		/*System.out.println("...............enter into myorders list...............");
		model.addAttribute("orderLstForm",new OrdersListBean());
		return "ordersList";*/
		//System.out.println("orederLists page...");
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if(objuserBean != null){
				
				//String dealerId=request.getParameter("dealerId");
				listOrderBeans = listDao.getOrderList(objuserBean.getEmpId()+"");
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
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return "myOrdersList";
		
	}
	
	@RequestMapping(value = "/dashboardforbranchwise")
	public  String getProductsDeliveredQtyBranchWise(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,Model model,HttpServletRequest request,HttpSession session) 
	{
		List<Map<String, Object>> branch_prod_list = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			
			if(objuserBean.getRoleId().equalsIgnoreCase("1")){
				String sSql = "select id ,branchname from kumar_branch where status='1'";
				List<BranchBean> list = branchDao.populate(sSql);
				request.setAttribute("branches_list", list);
			}else if(objuserBean.getRoleId().equalsIgnoreCase("2")){ // branch manager
			}
			
			
			String role_id = objuserBean.getRoleId();
			
			Map<String,Map<String,Object>> prod_map = new HashMap<String,Map<String,Object>>();
			Map<String,String> branches_map = new HashMap<String,String>();
			if(objuserBean != null){
				if(role_id.equalsIgnoreCase("1")){ // means Admin
					branch_prod_list = listDao.getProductsDeliveredQtyOfBranch(request.getParameter("branch_id"));
				}else if(role_id.equalsIgnoreCase("2")){ //means branch Manager
					branch_prod_list = listDao.getProductsDeliveredQtyOfBranch(objuserBean.getBranchId());
				}
				
				for(Map<String, Object> row:branch_prod_list){
					if(!branches_map.containsKey((String)row.get("branch_name"))){
						branches_map.put((String)row.get("branch_name"), (String)row.get("branch_name"));
					}
					String product_id = (String)row.get("category")+"##"+(String)row.get("sub_category")+"##"+(String)row.get("item_code");
					if(prod_map.containsKey(product_id)){
						Map<String,Object> branch = (Map<String,Object>)prod_map.get(product_id);
						branch.put((String)row.get("branch_name"), row.get("delivered")+","+row.get("nullified"));
						//total_delivered += ((Double)row.get("delivered")).longValue();
						//total_nullified += ((Double)row.get("nullified")).longValue();
					}else{
						Map<String,Object> branch = new HashMap<String,Object>();
						branch.put((String)row.get("branch_name"), row.get("delivered")+","+row.get("nullified"));
						prod_map.put(product_id, branch);
						//total_delivered += ((Double)row.get("delivered")).longValue();
						//total_nullified += ((Double)row.get("nullified")).longValue();
					}
					
				}
				
				List<Map<String, Object>> ordered_list = null ;
				if(role_id.equalsIgnoreCase("1")){ // means Admin
					ordered_list = listDao.getProductsOrderedQtyOfBranch(request.getParameter("branch_id"));
				}else if(role_id.equalsIgnoreCase("2")){ //means branch Manager
					ordered_list = listDao.getProductsOrderedQtyOfBranch(objuserBean.getBranchId());
				}
				
				for(Map<String, Object> row:ordered_list){
					if(!branches_map.containsKey((String)row.get("branch_name"))){
						branches_map.put((String)row.get("branch_name"), (String)row.get("branch_name"));
					}
					String prod_name = (String)row.get("category")+"##"+(String)row.get("sub_category")+"##"+(String)row.get("item_code");
					if(prod_map.containsKey(prod_name)){
						Map<String,Object> branch_map = (Map<String,Object>)prod_map.get(prod_name);
						if(branch_map.containsKey(row.get("branch_name"))){
							String values = (String)branch_map.get((String)row.get("branch_name"));
							branch_map.put((String)row.get("branch_name"), ((Double)row.get("ordered")).intValue()+","+values);
							//total_orders += ((Double)row.get("ordered")).longValue();
						}else{
							branch_map.put((String)row.get("branch_name"), ((Double)row.get("ordered")).intValue()+",0,0");
							prod_map.put(prod_name, branch_map);
							//total_orders += ((Double)row.get("ordered")).longValue();
						}
					}else{
						Map<String,Object> branch = new HashMap<String,Object>();
						branch.put((String)row.get("branch_name"), ((Double)row.get("ordered")).intValue()+",0,0");
						prod_map.put(prod_name, branch);
						//total_orders += ((Double)row.get("ordered")).longValue();
					}
				}
				
				Collection<Map<String,Object>> branch_maps = prod_map.values();
				Iterator<Map<String,Object>> iter = branch_maps.iterator();
				while(iter.hasNext()){
					Map<String, Object> branch_map = iter.next();
					Set br_keys = branches_map.keySet();
					Iterator iter2 = br_keys.iterator();
					while(iter2.hasNext()){
						String branch_name = (String)iter2.next();
						if(!branch_map.containsKey(branch_name)){
							branch_map.put(branch_name, "0,0,0");
						}
					}
				}
				Iterator prod_keys = prod_map.keySet().iterator();
				while(prod_keys.hasNext()){
					String key = (String)prod_keys.next();
					Map<String,Object> value =  prod_map.get(key);
					Map<String, Object> sortedValue = new TreeMap<String, Object>(value);
					prod_map.put(key, sortedValue);
				}
				
				Map<String, String> sortedBranches = new TreeMap<String, String>(branches_map);
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(sortedBranches);
				request.setAttribute("branches_map", sJson);
				
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(prod_map);
				request.setAttribute("delivered_qty_list", sJson);
				
				/*branch_prod_list = listDao.getProductsDeliveredQtyBranchWise();
				objectMapper = new ObjectMapper();
				if (branch_prod_list != null && branch_prod_list.size() > 0) {
	
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(branch_prod_list);
					request.setAttribute("delivered_qty_list", sJson);
				} else {
					request.setAttribute("delivered_qty_list", "''");
				}*/
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "productsDeliveredQtyBranchWise";
		
	}
	
	@RequestMapping(value = "/dashboardfordealerwise")
	public  String getProductsDeliveredQtyDealerWise(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,Model model,HttpServletRequest request,HttpSession session) 
	{
		List<Map<String, Object>> branch_prod_list = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			String role_id = objuserBean.getRoleId();
			
			long total_orders=0l, total_delivered=0l, total_nullified=0l, total_pending=0l;
			Map<String,Map<String,Object>> prod_map = new HashMap<String,Map<String,Object>>();
			Map<String,String> branches_map = new HashMap<String,String>();
			if(objuserBean != null){
				if(role_id.equalsIgnoreCase("1")){ // means Admin
					branch_prod_list = listDao.getProductsDeliveredQtyBranchWise();
				}else if(role_id.equalsIgnoreCase("2")){ //means branch Manager
					branch_prod_list = listDao.getProductsDeliveredQtyDealerWise(objuserBean.getBranchId(),request.getParameter("dealer_id"));
				}
				
				for(Map<String, Object> row:branch_prod_list){
					if(!branches_map.containsKey((String)row.get("dealer_name"))){
						branches_map.put((String)row.get("dealer_name"), (String)row.get("dealer_name"));
					}
					String product_id = (String)row.get("category")+"##"+(String)row.get("sub_category")+"##"+(String)row.get("item_code");
					if(prod_map.containsKey(product_id)){
						Map<String,Object> branch = (Map<String,Object>)prod_map.get(product_id);
						branch.put((String)row.get("dealer_name"), row.get("delivered")+","+row.get("nullified"));
						//total_delivered += ((Double)row.get("delivered")).longValue();
						//total_nullified += ((Double)row.get("nullified")).longValue();
					}else{
						Map<String,Object> branch = new HashMap<String,Object>();
						branch.put((String)row.get("dealer_name"), row.get("delivered")+","+row.get("nullified"));
						prod_map.put(product_id, branch);
						//total_delivered += ((Double)row.get("delivered")).longValue();
						//total_nullified += ((Double)row.get("nullified")).longValue();
					}
					
				}
				
				List<Map<String, Object>> ordered_list = null ;
				if(role_id.equalsIgnoreCase("1")){ // means Admin
					ordered_list = listDao.getProductsOrderedQtyBranchWise();
				}else if(role_id.equalsIgnoreCase("2")){ //means branch Manager
					ordered_list = listDao.getProductsOrderedQtyDealerWise(objuserBean.getBranchId(),request.getParameter("dealer_id"));
				}
				for(Map<String, Object> row:ordered_list){
					if(!branches_map.containsKey((String)row.get("dealer_name"))){
						branches_map.put((String)row.get("dealer_name"), (String)row.get("dealer_name"));
					}
					String prod_name = (String)row.get("category")+"##"+(String)row.get("sub_category")+"##"+(String)row.get("item_code");
					if(prod_map.containsKey(prod_name)){
						Map<String,Object> branch_map = (Map<String,Object>)prod_map.get(prod_name);
						if(branch_map.containsKey(row.get("dealer_name"))){
							String values = (String)branch_map.get((String)row.get("dealer_name"));
							branch_map.put((String)row.get("dealer_name"), ((Double)row.get("ordered")).intValue()+","+values);
							//total_orders += ((Double)row.get("ordered")).longValue();
						}else{
							branch_map.put((String)row.get("dealer_name"), ((Double)row.get("ordered")).intValue()+",0,0");
							prod_map.put(prod_name, branch_map);
							//total_orders += ((Double)row.get("ordered")).longValue();
						}
					}else{
						Map<String,Object> branch = new HashMap<String,Object>();
						branch.put((String)row.get("dealer_name"), ((Double)row.get("ordered")).intValue()+",0,0");
						prod_map.put(prod_name, branch);
						//total_orders += ((Double)row.get("ordered")).longValue();
					}
				}
				Collection<Map<String,Object>> branch_maps = prod_map.values();
				Iterator<Map<String,Object>> iter = branch_maps.iterator();
				while(iter.hasNext()){
					Map<String, Object> branch_map = iter.next();
					Set br_keys = branches_map.keySet();
					Iterator iter2 = br_keys.iterator();
					while(iter2.hasNext()){
						String branch_name = (String)iter2.next();
						if(!branch_map.containsKey(branch_name)){
							branch_map.put(branch_name, "0,0,0");
						}
					}
				}
				Iterator prod_keys = prod_map.keySet().iterator();
				while(prod_keys.hasNext()){
					String key = (String)prod_keys.next();
//					System.out.println("---key-- ::"+key);
					
					
					Map<String,Object> value =  prod_map.get(key);
//					System.out.println("---value-- ::"+value);
					Map<String, Object> sortedValue = new TreeMap<String, Object>(value);
					prod_map.put(key, sortedValue);
				}
				Map<String, String> sortedBranches = new TreeMap<String, String>(branches_map);
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(sortedBranches);
				request.setAttribute("branches_map", sJson);
				
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(prod_map);
				request.setAttribute("delivered_qty_list", sJson);
				
				/*branch_prod_list = listDao.getProductsDeliveredQtyBranchWise();
				objectMapper = new ObjectMapper();
				if (branch_prod_list != null && branch_prod_list.size() > 0) {
	
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(branch_prod_list);
					request.setAttribute("delivered_qty_list", sJson);
				} else {
					request.setAttribute("delivered_qty_list", "''");
				}*/
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "productsDeliveredQtyDealerWise";
		
	}
	
	@RequestMapping(value="/reportAllOrdersPage")
	public String reportAllOrdersPage(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if(objuserBean.getRoleId().equalsIgnoreCase("1")){
				String sSql = "select id ,branchname from kumar_branch where status='1'";
				List<BranchBean> list = branchDao.populate(sSql);
				request.setAttribute("branches_list", list);
				
				all_orders = listDao.getAllOrders("","","");
				
			}else if(objuserBean.getRoleId().equalsIgnoreCase("2")){ // branch manager
				all_orders = listDao.getAllOrders("","",objuserBean.getBranchId());
			}
			if (all_orders != null && all_orders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(all_orders);
				request.setAttribute("all_orders", sJson);
			} else {
				request.setAttribute("all_orders", "''");
			}
			request.setAttribute("list_type", "all");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "reportAllOrders";
		
	}
	
	@RequestMapping(value="/reportAllOrders")
	public @ResponseBody String reportAllOrders(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		JSONObject jsonObj = new JSONObject();
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			String list_type = request.getParameter("list_type");
			String from_date = request.getParameter("from_date");
			String to_date = request.getParameter("to_date");
			String branch_id = request.getParameter("branch_id");
			if(branch_id.equalsIgnoreCase("all")){
				branch_id = null;
			}
			if(StringUtils.isNotBlank(list_type)){
				if(list_type.equalsIgnoreCase("all")){
					all_orders = listDao.getAllOrders(from_date,to_date,branch_id);
				}else if(list_type.equalsIgnoreCase("delivered")){
					all_orders = listDao.getAllOrders(from_date,to_date,branch_id,"completed");
				}else if(list_type.equalsIgnoreCase("pending")){
					all_orders = listDao.getAllOrders(from_date,to_date,branch_id,"pending");
				}else if(list_type.equalsIgnoreCase("partially")){
					all_orders = listDao.getAllOrders(from_date,to_date,branch_id,"partially");
				}
			}
			
			if (all_orders != null && all_orders.size() > 0) {
				jsonObj.put("all_orders", all_orders);
			} else {
				jsonObj.put("all_orders", "");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsonObj.toString();
		
	}
	@RequestMapping(value="/reportPendingOrders")
	public String reportPendinglOrders(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if(objuserBean.getRoleId().equalsIgnoreCase("1")){
				String sSql = "select id ,branchname from kumar_branch where status='1'";
				List<BranchBean> list = branchDao.populate(sSql);
				request.setAttribute("branches_list", list);
				
				all_orders = listDao.getAllOrders("","","","pending");
				
			}else if(objuserBean.getRoleId().equalsIgnoreCase("2")){ // branch manager
				all_orders = listDao.getAllOrders("","",objuserBean.getBranchId(),"pending");
			}
			if (all_orders != null && all_orders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(all_orders);
				request.setAttribute("all_orders", sJson);
			} else {
				request.setAttribute("all_orders", "''");
			}
			request.setAttribute("list_type", "pending");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "reportPendingOrders";
		
	}
	@RequestMapping(value="/reportPartiallyDeliveredOrders")
	public String reportPartiallyDeliveredOrders(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if(objuserBean.getRoleId().equalsIgnoreCase("1")){
				String sSql = "select id ,branchname from kumar_branch where status='1'";
				List<BranchBean> list = branchDao.populate(sSql);
				request.setAttribute("branches_list", list);
				
				all_orders = listDao.getAllOrders("","","","partially");
				
			}else if(objuserBean.getRoleId().equalsIgnoreCase("2")){ // branch manager
				all_orders = listDao.getAllOrders("","",objuserBean.getBranchId(),"partially");
			}
			if (all_orders != null && all_orders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(all_orders);
				request.setAttribute("all_orders", sJson);
			} else {
				request.setAttribute("all_orders", "''");
			}
			request.setAttribute("list_type", "partially");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "reportAllOrders";
		
	}
	@RequestMapping(value="/reportDeliveredOrders")
	public String reportDeliveredOrders(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request,HttpSession session){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> all_orders = null;
		try{
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if(objuserBean.getRoleId().equalsIgnoreCase("1")){
				String sSql = "select id ,branchname from kumar_branch where status='1'";
				List<BranchBean> list = branchDao.populate(sSql);
				request.setAttribute("branches_list", list);
				
				all_orders = listDao.getAllOrders("","","","completed");
				
			}else if(objuserBean.getRoleId().equalsIgnoreCase("2")){ // branch manager
				all_orders = listDao.getAllOrders("","",objuserBean.getBranchId(),"completed");
			}
			if (all_orders != null && all_orders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(all_orders);
				request.setAttribute("all_orders", sJson);
			} else {
				request.setAttribute("all_orders", "''");
			}
			request.setAttribute("list_type", "delivered");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "reportAllOrders";
		
	}
}
