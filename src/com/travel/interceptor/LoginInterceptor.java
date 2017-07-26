package com.travel.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2796326480994355318L;

	@Override
	public String intercept(ActionInvocation invo) throws Exception {
		// TODO Auto-generated method stub
		//取得请求相关的ActionContext实例
		ActionContext ctx=invo.getInvocationContext();
		Map session=ctx.getSession();
		String user=(String) session.get("loginname");
		//如果没有登陆，则返回重新登陆
		if(user!=null){
			return invo.invoke();
		}
		ctx.put("tip", "还未登陆");
		return Action.LOGIN;
	}

}
