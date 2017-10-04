<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
String contextPath = request.getContextPath() + "/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- <!DOCTYPE html> -->
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>陕西延安黄龙山褐马鸡国家自然保护区</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="黄龙山,褐马鸡,国家自然保护区">
	<meta http-equiv="description" content="保护区网站">
	<meta http-equiv="refresh" content="7;url=/visitor/first.action">
	<style type="text/css">
body {
	 background-color:#97c7e9;
	 text-align: center;
	 padding:0px;
}

a{
  text-decoration:none;
}
</style>

</head>
<body>
	<div style="margin:0 auto;100%;min-width:1366px;">
		<img id="pic" width="1366px;" alt="" src="/travel/includes/image/index/indexhemaji.gif">
	</div>
	<div style="position:absolute;top:20px;right:20px;"><a href="/visitor/first.action" type="button">&gt;&gt;点击登陆</a></div>
    <script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script language="javascript" type="text/javascript"> 
		var i = 7; 
		var intervalid; 
		intervalid = setInterval("fun()", 1000); 
		function fun() { 
			if (i == 0) { 
					window.location.href = "/visitor/first.action"; 
					clearInterval(intervalid); 
			} 
			//document.getElementById("mes").innerHTML = i; 
			i--; 
		}
		$(function(){
			ChangePicSize($(document).width());
		});
		$(window).resize(function () {          //当浏览器大小变化时
			ChangePicSize($(document).width());
		});
		//调整图片大小:原始大小为1920(宽)*1080(高)
		function ChangePicSize(docwidth){
				if(docwidth>1366){
					$("#pic").css("width", docwidth); // 设定实际显示宽度
				}
		}
	</script> 
</body>
</html>
