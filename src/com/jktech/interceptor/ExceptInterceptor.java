package com.jktech.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ExceptInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 4079816257872265047L;

	public ExceptInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		//Ôö¼Ó¼àÌý  
        invocation.addPreResultListener(new StrutsErrorListener());  
        String retString = invocation.invoke();  
        return retString;  
	}
}
