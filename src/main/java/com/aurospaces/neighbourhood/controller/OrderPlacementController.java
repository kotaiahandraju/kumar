package com.aurospaces.neighbourhood.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.ItemsDao;
import com.aurospaces.neighbourhood.db.dao.ProductnameDao;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@RequestMapping(value="/admin")
public class OrderPlacementController {
	@Autowired EmployeeDao employeeDao;
	@Autowired
	ItemsDao  itemsDao;
	@Autowired
	ProductnameDao productnameDao;
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
	
}
