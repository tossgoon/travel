<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<title>OA系统-组织架构</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="OA系统">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
</head>
<style type="text/css">
body{
	background-color: #f2f2f2;
}
td{
text-align:center;
}
th{
text-align:center;
}
</style>
<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统>>组织架构
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li><a href="/travel/oa/querynotifysend.action?pagesize=7&pagenum=1">公告通知</a></li>
					<li><a href="/travel/oa/querydeal.action">待办事务</a></li>
					<li class="activeli"><a href="javascript:void(0)">组织架构</a></li>
					<li><a href="/travel/travel/user/oadepartment.jsp">部门信息</a></li>
					<li><a href="/travel/travel/user/oaaddress.jsp">办公通讯录</a></li>
					<li><a href="/travel/travel/user/oadaily.jsp">日程安排</a></li>
					<li><a href="/travel/oa/querysend.action">发文管理</a></li>
					<li><a href="/travel/oa/queryreceive.action">收文管理</a></li>
					<li><a href="/travel/travel/user/oafilelist.jsp">资料中心</a></li>
					<li><a href="/travel/travel/user/oauserinfo.jsp">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <h3>组织架构(单位整体的组织架构图)</h3>
			   <hr>
				待完善......
			</div>
			<div style="clear:both;"></div>
			
		</div>
	</div>
<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
	
		
	</script>
</body>
</html>
