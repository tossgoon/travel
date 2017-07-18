<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">

</head>
<body>

<%@ include file="headmodal.jsp"%>

	<div class="container">

		<div class="row">

			<div class="col-md-9"></div>

		</div>
	</div>

	<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.config.js">  </script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.all.min.js">	</script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/lang/zh-cn/zh-cn.js">	</script>
	
	<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
	</script>
	
</body>
</html>