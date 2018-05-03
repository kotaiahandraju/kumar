/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Kotaiah
 *
 */
@Controller
@RequestMapping(value="/admin")
public class BranchManagerController {
@Autowired EmployeeDao employeeDao;
@Autowired PaymentDao paymentDao;
@Autowired HttpSession session;
	@RequestMapping(value="/dealeraccountconfirm")
	public String getDelarConfirmation(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		try{
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarsConfirm("1",session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
			} else {
				request.setAttribute("allOrders1", "''");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "dealerconfirm";
		
	}
	@RequestMapping(value="/dealerpaymentconfirm")
	public String dealerpaymentconfirm(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		try{
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarspayments(session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
			} else {
				request.setAttribute("allOrders1", "''");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "managerpaymentconfirm";
		
	}
	@RequestMapping(value="/paymentConfirmStatus")
	public @ResponseBody String  paymentConfirmStatus(HttpServletRequest request){
		List<Map<String,Object>> listOrderBeans =null;
		String json = null;
		String confirm = null;
		JSONObject jsonObject = new JSONObject();
		int id =0;
		try{
			id = Integer.parseInt(request.getParameter("id"));
			confirm = request.getParameter("confirm");
			paymentDao.updateConfirmStatus(id,confirm);
			ObjectMapper mapper = new ObjectMapper();
			listOrderBeans = employeeDao.getAllDelarspayments(session);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				json =mapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", json);
				jsonObject.put("allOrders1", listOrderBeans);
			} else {
				request.setAttribute("allOrders1", "''");
				jsonObject.put("allOrders1", listOrderBeans);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return String.valueOf(jsonObject);
		
	}
	
}
