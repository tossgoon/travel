<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>陕西省延安黄龙山褐马鸡国家级自然保护区</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="OA系统">
<meta http-equiv="description" content="OA系统登陆">
<link rel="stylesheet"
	href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<style type="text/css">
.txtstyle {
	font-size: 16px;
	text-align:center;
}
.headlogo {
	 background-color: #018752; 
	 height: 70px;
	 width:100%;
}
span{
float: right;
}

</style>

</head>
<%
	String error = (String) request.getAttribute("info");
	if (error == null) {
		error = "";
	}
%>
<body>
	<div class="headlogo" id="logoindex">
		<img style="margin:20px;" alt="陕西省延安黄龙山褐马鸡国家级自然保护区"
			src="<%=contextPath%>/includes/image/oatitle2.png">
	</div>
	<div style="width:100%;background-color:#EFF4FA;height:140px;position:absolute;top:250px;z-index:-1;">
	</div>
	<s:form method="post" action="login" namespace="/visitor" role="form"
		theme="simple" id="formLogin">
		<table
			style="width:370px;border:1px solid #000000;background-color:#ffffff; float:right;margin-right:90px;margin-top:100px; height:300px;"
			cellspacing="10">
			<tr>
				<td colspan="2" style="background-color:#EFF4FA;border-bottom:1px solid;margin:0 auto;text-algin:center;height:50px;">
				<p class="txtstyle" style="padding-top:10px;">OA系 统 用 户 登 录</p>
				</td>
			</tr>

			<tr>
				<td><span style="margin-left:15px;margin-top:20px;">用户名</span></td>
				<td><input type="text" name="user.loginname" style="width:260px;margin-top:20px;"
					placeholder="输入用户名" class="form-control"></td>
			</tr>
			<tr>
				<td><span  style="margin-left:15px;">密码</span></td>
				<td><input type="password" name="user.password" style="width:260px;"
					placeholder="输入密码" class="form-control"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="登 录" class="btn btn-primary"
					style="width:260px;font-weight:bold;margin-bottom:30px;"
					id="submit1" />
					</td>
			</tr>
			<tr>
			<td colspan="2">${errorMsg}</td>
			</tr>
		</table>
	</s:form>
	<div style="clear:both;" >
	
	</div>
	<div style="margin-top:90px;"></div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
