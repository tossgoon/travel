<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=contextPath%>includes/css/portal_head_modal.css">
<style type="text/css">
#portolinfo span {
	float: right;
}
</style>
</head>
<body>
	<%@ include file="headmodal.jsp"%>
	<div class="container" style="width:1024px;margin:0 auto;">
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin-top:30px;"> ${portal.title}</label>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
			   ${portal.content}
			</div>
		</div>
	</div>
	
		<%@ include file="footmodal.jsp"%>
<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/ueditor.config.js">
		
	</script>
	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/ueditor.all.min.js">
		
	</script>
	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/lang/zh-cn/zh-cn.js">
		
	</script>

	<script type="text/javascript">
		
	</script>

</body>
</html>