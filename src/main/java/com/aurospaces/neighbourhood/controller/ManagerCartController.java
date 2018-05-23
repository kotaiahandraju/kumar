/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping(value = "/admin")
public class ManagerCartController {
	@Autowired CartDao cartDao;
	@RequestMapping(value = "/manageraddtocart")
	public @ResponseBody String manageraddtocart( CartBean cartBean,	ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		try{
			System.out.println("manager cart11");
			if(StringUtils.isNotBlank(cartBean.getProductId())){
				String productArray[] = cartBean.getProductId().split(",");
				String quantityArray[] = cartBean.getQuantity().split(",");
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				cartBean.setBranchId(objuserBean.getBranchId());
				for(int i=0;i<productArray.length;i++){
					cartBean.setId(0);
					cartBean.setProductId(productArray[i]);
					cartBean.setQuantity(quantityArray[i]);
					cartDao.save(cartBean);
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
	public String managercartdetails( CartBean cartBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Map<String,Object>> listOrderBeans = null;
		ObjectMapper objectMapper =null;
		String sJson = null;
		try{
			String dealerId=request.getParameter("dealerId");
			System.out.println("dealerId---"+dealerId);
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
	
	
}
