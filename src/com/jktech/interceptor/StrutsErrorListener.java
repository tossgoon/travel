package com.jktech.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.PreResultListener;
import com.opensymphony.xwork2.util.ValueStack;

public class StrutsErrorListener implements PreResultListener {

	public StrutsErrorListener() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void beforeResult(ActionInvocation actionInvocation, String result) {
		// TODO Auto-generated method stub
		// ����resultΪinput��ͼ������
		if (result != null && result.equals("input")) {
			// ����struts����ֵΪ��
			actionInvocation.setResultCode(null);
			// ��action��ȡ��fieldError�Ĵ���У����Ϣ
			ActionContext actionContext = actionInvocation
					.getInvocationContext();
			ValueStack vc = actionContext.getValueStack();
			Map<String, Object> ferrors = (Map<String, Object>) vc
					.findValue("fieldErrors");
			String errorMsg = "[";
			// List<String> msgList = new ArrayList<String>();
			for (Map.Entry<String, Object> entry : ferrors.entrySet()) {
				ArrayList list = (ArrayList) entry.getValue();
				if (list != null && list.size() > 0) {
					errorMsg += "\"" + list.get(0).toString().replace("\"", "")
							+ "\",";
					// msgList.add(list.get(0).toString());
					// returnMessage = list.get(0).toString();
					// break;
				}
			}
			errorMsg = errorMsg.substring(0, errorMsg.length() - 1)+"]";
			// ҳ���дjson
			try {
				HttpServletResponse response = (HttpServletResponse) actionContext
						.getContext().get(
								org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
				response.setContentType("application/json; charset=utf-8");
				response.setHeader("cache-control", "no-cache");
				PrintWriter writer = response.getWriter();

				writer.print("{\"success\":false,\"message\":"
						+ errorMsg + "}");
				writer.flush();
				writer.close();
			} catch (IOException e1) {

			}
		} else if (result != null && result.equals("none")) {
			try {
				// ����struts����ֵΪ��
				actionInvocation.setResultCode(null);
				// ��action��ȡ��fieldError�Ĵ���У����Ϣ
				ActionContext actionContext = actionInvocation
						.getInvocationContext();
				HttpServletResponse response = (HttpServletResponse) actionContext
						.getContext().get(
								org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
				response.setContentType("application/json; charset=utf-8");
				response.setHeader("cache-control", "no-cache");
				PrintWriter writer = response.getWriter();
				writer.print("{\"success\":true,\"message\":\"�����ɹ�\"}");
				writer.flush();
				writer.close();
			} catch (IOException e1) {

			}
		}
	}
}
