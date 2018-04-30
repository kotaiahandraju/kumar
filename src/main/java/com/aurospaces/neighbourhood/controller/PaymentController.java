/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.util.Date;
import java.util.List;

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

import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.aurospaces.neighbourhood.util.KumarUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Kotaiah
 *
 */@Controller
 @RequestMapping(value = "/admin")
public class PaymentController {
	 @Autowired PaymentDao paymentDao;
	 
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

			try {
						if(StringUtils.isNotBlank(paymentBean.getStrpaymentDate()))	{
							Date date = KumarUtil.dateFormate(paymentBean.getStrpaymentDate());
							paymentBean.setPaymentDate(date);
						}
						LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
						if (objuserBean != null) {
							paymentBean.setEmpId(objuserBean.getEmpId());
							paymentBean.setBranchId(objuserBean.getBranchId());
						}
						paymentDao.save(paymentBean);
					redir.addFlashAttribute("msg", "Paymnet Created Successfully");
					redir.addFlashAttribute("cssMsg", "success");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "redirect:delarpayment";
		}

}
