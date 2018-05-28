/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EmployeeBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeDao;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Kotaiah
 *
 */@Controller
 @RequestMapping(value = "/admin")
public class PaymentController {
	 @Autowired PaymentDao paymentDao;
	 @Autowired EmployeeDao employeeDao;
	 @Autowired ServletContext objContext;
	 
		@RequestMapping(value = "/delarpayment")
	 public String delarpayment( @ModelAttribute("delarpayment") PaymentBean paymentBean,
				ModelMap model, HttpServletRequest request, HttpSession session) {

			ObjectMapper objectMapper = null;
			String sJson = null;
			List<PaymentBean> listOrderBeans = null;
			try {
				listOrderBeans = paymentDao.getallPayments(session);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
				} else {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", "''");
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "delarPayment";
		}
		
		@RequestMapping(value = "/adddelarpayment", method = RequestMethod.POST)
		public String addProductType(PaymentBean paymentBean,RedirectAttributes redir,HttpSession session) {
                 
			InputStream input = null;
			 Properties prop = new Properties();
			 
			 
			
			try {
				LoginBean objuserBeana = (LoginBean) session.getAttribute("cacheUserBean");
				
				EmployeeBean retlist =	employeeDao.getBranchHeadBean(objuserBeana.getBranchId());
				
				String phnumber =retlist.getPhoneNumber();
				
				 String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
				 input = new FileInputStream(propertiespath);
				// load a properties file
							prop.load(input);
				       String  msg = prop.getProperty("dealerConfirmedPayment");
				 msg =msg.replace("_username_",objuserBeana.getUserName() );
				 msg =msg.replace("_pass_", paymentBean.getQtrNumber());
				
				
				
				
						if(StringUtils.isNotBlank(paymentBean.getStrpaymentDate()))	{
							Date date = KumarUtil.dateFormate(paymentBean.getStrpaymentDate());
							paymentBean.setPaymentDate(date);
						}
						LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
						if (objuserBean != null) {
							paymentBean.setEmpId(objuserBean.getEmpId());
							paymentBean.setBranchId(objuserBean.getBranchId());
							paymentBean.setConfirm("0");
						}
						paymentDao.save(paymentBean);
						SendSMS.sendSMS(msg, phnumber, objContext);
					redir.addFlashAttribute("msg", "Payment Created Successfully");
					redir.addFlashAttribute("cssMsg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "redirect:delarpayment";
		}

}
