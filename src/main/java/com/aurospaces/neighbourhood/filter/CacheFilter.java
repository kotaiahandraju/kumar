/**
 * 
 */
/**
 * @author yogi
 *
 */
package com.aurospaces.neighbourhood.filter;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class CacheFilter implements Filter {


public void init(FilterConfig config) throws ServletException {
    this.filterConfig = config;
}

private FilterConfig filterConfig;
public FilterConfig getFilterConfig() {
    return this.filterConfig;
}
public void setFilterConfig (FilterConfig filterConfig) {
    this.filterConfig = filterConfig;
}
public void destroy() {
    this.filterConfig = null;
}

public void doFilter (ServletRequest request,
                      ServletResponse response,
                      FilterChain chain) {
	 Integer days = 50;

    try {
            if (response instanceof HttpServletResponse) {
                Calendar c = Calendar.getInstance();
                c.setTime( new Date() );
                c.add( Calendar.DATE, days );

                //HTTP header date format: Thu, 01 Dec 1994 16:00:00 GMT
                String o = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss zzz").format( c.getTime() );            
                ((HttpServletResponse) response).setHeader( "Expires", o );
                
                // Set the Cache-Control and Expires header
               /* httpresponse.setHeader("Cache-Control", "private") ;
                Date expiresDate = new Date(new Date().getTime() + 3600*1000*500); 
                ((HttpServletResponse) response).setHeader("Set-Cookie", "Expires=" + DateUtil.formatDate(expiresDate) + ";");*/
               // httpresponse.setHeader("Expires", "60*60*24*365") ;
                // Print out the URL we're filtering
                String name = ((HttpServletRequest)request).getRequestURI();
            }
            chain.doFilter (request, response);
    } catch (IOException e) {
        System.out.println ("IOException in NoCacheFilter");
        e.printStackTrace() ;
    } catch (ServletException e) {
        System.out.println ("ServletException in NoCacheFilter");
        e.printStackTrace() ;
    }
}
}