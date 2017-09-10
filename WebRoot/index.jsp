<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
String contextPath = request.getContextPath() + "/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎访问本站!</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="保护区网站">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
	<style type="text/css">
	.divimg {
		width: 1540px;
		height: 964px;
		background-image: url(/travel/includes/image/index.jpg);
		border: 1px solid;
		margin: 0 auto;
	}

	body {
		background-image: url(/travel/includes/image/index.jpg);
		text-align: center;
	}
</style>

</head>
<body>

	<div style="margin:0 auto;90%;margin-top:200px;"><img alt="" src="/travel/includes/image/indextitle2.png"></div>
	<div style="width:1200px;height:800px;"></div>
	<a href="/travel/visitor/first.action" style="font-size:20px;background-color:#ffffff;">点击登陆</a>
	
	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
