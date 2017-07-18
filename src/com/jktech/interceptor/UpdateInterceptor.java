package com.jktech.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;
public class UpdateInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3512230583136384103L;

	public UpdateInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String intercept(ActionInvocation invoke) throws Exception {
		// TODO Auto-generated method stub
		if ("update".equals(invoke.getProxy().getMethod())) {
			if (invoke.getAction() instanceof IUpdate) {
				IUpdate update = (IUpdate) invoke.getAction();
				String[] ids = (String[]) invoke.getInvocationContext()
						.getParameters().get("id");
				if (ids != null && ids.length > 0) {
					update.preUpdate(ids[0]);
				}
			}
		}
		return invoke.invoke();
	}

}
