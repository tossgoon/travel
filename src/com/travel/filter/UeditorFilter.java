package com.travel.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter;

//UeditorFilter 继承了StrutsPreparedAndExecuteFilter，如果是ueitor的路径，则放行；否则，使用struts2过滤
public class UeditorFilter extends StrutsPrepareAndExecuteFilter {

	 @Override
	public void doFilter(ServletRequest req, ServletResponse res,  
            FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest request = (HttpServletRequest) req;  
        String url = request.getRequestURI();           
        //System.out.println(url);           
        if (url.contains("/ueditor/jsp/")) {               
            //System.out.println("使用自定义过滤器");               
            chain.doFilter(req, res);           
        }else{               
            //System.out.println("使用默认过滤器");               
            super.doFilter(req, res, chain);           
        }   
    }  
}
