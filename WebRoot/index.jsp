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
  </head>
<body>

	<div class="navbar navbar-inverse"
		style="width:100%;border-radius:0;margin-bottom:0px;">
		<div class="container">
			<div class="row">
				<div class="col-xs-7">
					<label class="navbar-brand">jkjy网络连接测试记录 Ping </label>
				</div>
				<div class="col-xs-5">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="net/iprecord.jsp" style="float:right;">所有记录</a>
							<a href="net/userrecord.jsp" style="float:right;">在线统计</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
