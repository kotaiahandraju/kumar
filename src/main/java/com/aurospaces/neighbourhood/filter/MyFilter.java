package com.aurospaces.neighbourhood.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  
  
public class MyFilter implements Filter{  
  
public void init(FilterConfig arg0) throws ServletException {}  
      
public void doFilter(ServletRequest req, ServletResponse resp,  
        FilterChain chain) throws IOException, ServletException {  
          
	HttpServletRequest request = (HttpServletRequest) req;
    HttpServletResponse response = (HttpServletResponse) resp;
    HttpSession session = request.getSession(false);

    if (session == null || session.getAttribute("cacheUserBean") == null) {
        response.sendRedirect(request.getContextPath() + "/LoginHome.htm"); // No logged-in user found, so redirect to login page.
    } else {
        chain.doFilter(req, resp); // Logged-in user found, so just continue request.
    }
          
}  
    public void destroy() {}  
  
} 
