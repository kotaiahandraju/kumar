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
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.CartBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.db.dao.CartDao;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Kotaiah
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class CartController {
	@Autowired CartDao cartDao;
	@RequestMapping(value = "/addtocart")
	public @ResponseBody String addtocart( CartBean cartBean,	ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		try{
			if(StringUtils.isNotBlank(cartBean.getProductId())){
				String productArray[] = cartBean.getProductId().split(",");
				String quantityArray[] = cartBean.getQuantity().split(",");
			LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				cartBean.setUserId(objuserBean.getEmpId());
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
			objJson.put("msg", "success");
			
		}catch(Exception e){
			e.printStackTrace();
			objJson.put("msg", "failed");
		}
		
		
				return String.valueOf(objJson);
	}
	@RequestMapping(value = "/cartdetails")
	public String cartdetails( CartBean cartBean,	ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Map<String,Object>> listOrderBeans = null;
		ObjectMapper objectMapper =null;
		String sJson = null;
		try{
			listOrderBeans = cartDao.getallcartDetails();
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
		
		return "cardetails";
	}
	
	@RequestMapping(value = "/countCartdetails")
	public @ResponseBody String countCartdetails( CartBean cartBean,ModelMap model, HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		
		try{
			int count=	cartDao.countcartdetails(cartBean);
			objJson.put("count", count);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return String.valueOf(objJson);
	}
}