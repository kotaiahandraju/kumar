/**
 * 
 */
package com.aurospaces.neighbourhood.exceptions;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author venkateshp
 * 
 */

@ControllerAdvice
public class CustomExceptionHandler {
	private Logger logger = Logger.getLogger(CustomExceptionHandler.class);

	@ExceptionHandler(DataBaseExceptionHandler.class)
	public ModelAndView handleCustomException(DataBaseExceptionHandler ex) {
		ModelAndView model = new ModelAndView("ExceptionsHome");
		model.addObject("errCode", ex.getErrCode());
		model.addObject("errMsg", ex.getErrMsg());
		return model;

	}

}
