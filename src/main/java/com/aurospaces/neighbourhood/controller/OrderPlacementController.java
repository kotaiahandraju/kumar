package com.aurospaces.neighbourhood.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.aurospaces.neighbourhood.db.dao.ProductnameDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	KumarUtil kumarUtil= new KumarUtil();
	@RequestMapping(value="/orderplacing")
	public String orderPlacement(HttpServletRequest request){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		try{
			System.out.println("orderPlacementorderPlacementorderPlacement");
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
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "orderPlacement";
		
	}
	@RequestMapping(value="/dealerorderproducts")
	public @ResponseBody String dealerorderproducts(OrdersListBean orderslistbean,ModelMap model,HttpServletRequest request,RedirectAttributes redir,HttpSession session){
		JSONArray jsonArray = new JSONArray();
		
		
		try{
			if(StringUtils.isNotBlank(orderslistbean.getProductId())){
				String productArray[] = orderslistbean.getProductId().split(",");
				String quantityArray[] = orderslistbean.getQuantity().split(",");
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				String prefix = "Kumar";
				
				// create instance of Random class
		        Random rand = new Random();
		                        
		        // Generate random integers in range 0 to 999
		        int rand_int = rand.nextInt(10000);
				
				orderslistbean.setDelerId(objuserBean.getEmpId());
				orderslistbean.setBranchId(objuserBean.getBranchId());
				prefix = prefix+"-"+ objuserBean.getBranchId()+"-";
				System.out.println(" Custom generated Sequence value " + prefix.concat(new Integer(rand_int).toString()));
				JSONObject jsonObj1 = new JSONObject();
				JSONObject jsonObj2 = new JSONObject();
				for(int i=0;i<productArray.length;i++){
					orderslistbean.setId(0);
					orderslistbean.setProductId(productArray[i]);
					orderslistbean.setQuantity(quantityArray[i]);
					orderslistbean.setInvoiceId(kumarUtil.randNum());
					orderslistbean.setOrderId(prefix.concat(new Integer(rand_int).toString()));
					ordersListDao.save(orderslistbean);
					jsonObj1.put("invoiceId", orderslistbean.getInvoiceId());
					jsonObj1.put("orderId", orderslistbean.getOrderId());
					
					jsonObj2.put(orderslistbean.getProductId(), orderslistbean.getQuantity()) ;
					
					model.addAttribute("invoiceDetails", jsonObj1);
					model.addAttribute("productList", jsonObj2);
					jsonArray.put(jsonObj1);
					jsonArray.put(jsonObj2);
				}
				 cartDao.deleteByUserId(Integer.parseInt(objuserBean.getEmpId()));
			}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(jsonArray);
		
	}
	
	 @RequestMapping(value = "/orederLists")
		public @ResponseBody String orederLists(@RequestParam("dealerId") String dealerId,HttpServletRequest request, HttpSession session) {
			System.out.println("orederLists page...");
			List<Map<String, Object>> listOrderBeans = null;
			JSONObject jsonObj = new JSONObject();
			ObjectMapper objectMapper = null;
			String sJson = null;
			boolean delete = false;
			try {

				listOrderBeans = listDao.getOrderList(dealerId);
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
	public String orderslist(@ModelAttribute("orderLstForm") EmployeeBean employeeBean,HttpServletRequest request){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		try{
			/*System.out.println("orderPlacementorderPlacementorderPlacement");
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
			}*/
			
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
			
			
			String sSql = "select id ,name from kumar_employee where roleId='3' and branch_id='"+objuserBean.getBranchId()+"' ";
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
	
	@RequestMapping("/saveDispatchedItemsData")
	public @ResponseBody String saveDispatchedItemsData(HttpServletRequest request,HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			
			
			String order_id = request.getParameter("order_id");
			String product_id = request.getParameter("product_id");
			String quantity = request.getParameter("quantity");
			String balance_qty = request.getParameter("balance_qty");
			Map<String,String> data = new HashMap<String,String>();
			data.put("order_id", order_id);
			data.put("product_id", product_id);
			data.put("quantity", quantity);
			//generate invoice number
			data.put("invoice_no", "eee");
			int bal_qty = 1;
			if(StringUtils.isNotBlank("balance_qty")){
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
	public  String myOrders(Model model,HttpServletRequest request) 
	{
		/*System.out.println("...............enter into myorders list...............");
		model.addAttribute("orderLstForm",new OrdersListBean());
		return "ordersList";*/
		System.out.println("orederLists page...");
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {

			//String dealerId=request.getParameter("dealerId");
			listOrderBeans = listDao.getMyOrdersList();
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
		return "ordersList";
		
	}
}
