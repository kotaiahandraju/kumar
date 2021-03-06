/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.OrdersListBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.OrdersListDao;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;


@Controller
@RequestMapping(value = "/admin")
public class ManagerCartController {
	@Autowired CartDao cartDao;
	@Autowired	ItemsDao  itemsDao;
	@Autowired OrdersListDao listDao;
	
	@RequestMapping(value="/managerorderplace")
	public String managerorderplace(@ModelAttribute("managerorderLstForm") OrdersListBean ordersListBean,HttpServletRequest request){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		try{
			listOrderBeans = itemsDao.getItems("1");
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
		return "managerorderplace";
		
	}
	
	@RequestMapping(value="/managerOrderplaceNew")
	public String managerOrderplaceNew(@ModelAttribute("managerorderLstForm") OrdersListBean ordersListBean,HttpServletRequest request){
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ItemsBean> listOrderBeans = null;
		Map<String,Map<String,Object>> sub_category_map = new HashMap<String,Map<String,Object>>();
		try{
			listOrderBeans = itemsDao.getItems("1");
			for(ItemsBean item:listOrderBeans){
				String key = item.getProductname()+"##"+item.getProductIdName();
				if(sub_category_map.containsKey(key)){
					//System.out.println("keyyy1"+key);
					//System.out.println("111111111111111111111111111111111");
					Map<String,Object> val_map = sub_category_map.get(key);
					//System.out.println("map1"+val_map);
					val_map.put(item.getItemcode()+"##"+item.getId()+"##"+item.getItemprice(),item.getItemdescrption());
					//System.out.println("map2"+val_map);
					
				}else{
					//System.out.println("keyyy2"+key);
					//System.out.println("22222222222222222222222222222");
					Map<String,Object> val_map = new HashMap<String,Object>();
					val_map.put(item.getItemcode()+"##"+item.getId()+"##"+item.getItemprice(),item.getItemdescrption());
					//System.out.println("map1"+val_map);
					//System.out.println("itemCode---"+item.getId());
					sub_category_map.put(key, val_map);
					//System.out.println("map2"+val_map);
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
		return "managerOrderplaceNew";
		
	}
	
	@RequestMapping(value = "/manageraddtocart")
	public @ResponseBody String manageraddtocart( CartBean cartBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		try{
			System.out.println("manager cart11");
			if(StringUtils.isNotBlank(cartBean.getProductId())){
				String productArray[] = cartBean.getProductId().split(",");
				String quantityArray[] = cartBean.getQuantity().split(",");
				String amountArray[] = cartBean.getAmount().split(",");
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				cartBean.setBranchId(objuserBean.getBranchId());
				for(int i=0;i<productArray.length;i++){
				int totalamount	=Integer.parseInt(amountArray[i]) * Integer.parseInt(quantityArray[i]);
					cartBean.setId(0);
					cartBean.setProductId(productArray[i]);
					cartBean.setQuantity(quantityArray[i]);
					cartBean.setAmount(amountArray[i]);
					cartBean.setTotalamount(String.valueOf(totalamount));
					
					List<CartBean> cartList= cartDao.checkProductIdAndDealerId(cartBean);
					if(cartList.size() > 0) {
						for (CartBean cartBean2 : cartList) {
							String existProductId=cartBean2.getProductId();
							String existQty=cartBean2.getQuantity();
							if(existProductId.equals(cartBean.getProductId())) {
								
								int iQty=Integer.parseInt(existQty)+Integer.parseInt(quantityArray[i]);
								cartBean.setQuantity(String.valueOf(iQty));
//								int iAmount=Integer.parseInt(cartBean2.getAmount())+Integer.parseInt(amountArray[i]);
								int itoAmount=Integer.parseInt(cartBean2.getTotalamount()) + totalamount;
//								cartBean.setAmount(String.valueOf(iAmount));
								cartBean.setTotalamount(String.valueOf(itoAmount));
							}
							cartDao.updateCart(cartBean);
						}
						
							
					}else {
						cartDao.save(cartBean);
					}
					
					
					
				}
				
			}
			}
		int count=	cartDao.countcartdetails(cartBean);
		
			objJson.put("count", count);
			objJson.put("msg", "Item successfully added to your cart");
			
		}catch(Exception e){
			e.printStackTrace();
			objJson.put("msg", "failed");
		}
		
		
				return String.valueOf(objJson);
	}
	@RequestMapping(value = "/managercartdetails")
	public String managercartdetails( @ModelAttribute("managercartdetailsForm") OrdersListBean ordersListBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Map<String,Object>> listOrderBeans = null;
		ObjectMapper objectMapper =null;
		String sJson = null;
		try{
			String dealerId=request.getParameter("dealerId");
			request.setAttribute("dealerId", dealerId);
			listOrderBeans = cartDao.getallManagercartDetails(dealerId);
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
		
		return "managercartdetails";
	}
	
	@RequestMapping(value = "/managercountCartdetails")
	public @ResponseBody String managercountCartdetails( CartBean cartBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		
		try{
			int count=	cartDao.countcartdetails(cartBean);
			objJson.put("count", count);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return String.valueOf(objJson);
	}
	@RequestMapping(value = "/managerdeletecart")
	public @ResponseBody String managerdeletecart( CartBean cartBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		List<Map<String,Object>> listOrderBeans = null;
		try{
			String delerId=request.getParameter("delerId");
			int delete=	cartDao.delete(cartBean.getId());
			if(delete == 0){
				objJson.put("msg", "failed");

			}else{
				
				objJson.put("msg", "Are you sure you want to delete this item?");
			}
			listOrderBeans = cartDao.getallManagercartDetails(delerId);
				objJson.put("allOrders1", listOrderBeans);
			int count=	cartDao.countcartdetails(cartBean);
			objJson.put("count", count);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return String.valueOf(objJson);
	}
	@RequestMapping(value = "/managercartList")
	@ResponseBody public String managercartList(OrdersListBean ordersListBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Map<String,Object>> listOrderBeans = null;
		ObjectMapper objectMapper =null;
		String sJson = null;
		JSONObject jsonObject=new JSONObject();
		try{
			listOrderBeans = cartDao.getallManagercartDetails(ordersListBean.getDelerId());
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
//				System.out.println(listOrderBeans);
				jsonObject.put("list", listOrderBeans);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return String.valueOf(jsonObject);
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
	
	
}
