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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%-- <link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" /> --%>
	<style type="text/css">
	 .divimg {
	width: 1540px;
	height: 964px;
	background-image: url(/travel/includes/image/index.jpg);
	border: 1px solid;
	margin: 0 auto;
}

body {
	 /* background-image: url(/travel/includes/image/index/index.jpg);  */
	 background-color:#97c7e9;
	text-align: center;
	/* filter: alpha(opacity = 60);
	-moz-opacity: 0.6;
	opacity: 0.6; */
	/* height:100%;
  	width:100%;
  	overflow: hidden;
  	background-size:cover; */
}

.pageoverlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;
	background-color: #383838;
	filter: alpha(opacity = 60);
	-moz-opacity: 0.6;
	opacity: 0.6;
}
.hover{
  padding: 25px;
  background-color: rgba(255,255,255,0.6);/* IE9、标准浏览器、IE6和部分IE7内核的浏览器(如QQ浏览器)会读懂 */
}
@media \0screen\,screen\9 {/* 只支持IE6、7、8 */
  .hover{
    background-color:#000000;
    filter:Alpha(opacity=50);
    position:static; /* IE6、7、8只能设置position:static(默认属性) ，否则会导致子元素继承Alpha值 */
    *zoom:1; /* 激活IE6、7的haslayout属性，让它读懂Alpha */
  }
  .hover p{
    position: relative;/* 设置子元素为相对定位，可让子元素不继承Alpha值 */
  }
}

a{
    padding-left: 40px;
    padding-right: 40px;
    display: block;
    text-align: center;
    font: 20px/60px "Microsoft Yahei";
    color: #444;
    border: 1px #DDD solid;
    border-radius: 5px;
    background: -moz-linear-gradient(top, #FFF 0%, #f4f4f4 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FFF), color-stop(100%,#f4f4f4));
    background: -webkit-linear-gradient(top, #FFF 0%,#f4f4f4 100%);
    background: -o-linear-gradient(top, #FFF 0%,#f4f4f4 100%);
    background: -ms-linear-gradient(top, #FFF 0%,#f4f4f4 100%);
    background: linear-gradient(to bottom, #FFF 0%,#f4f4f4 100%);
    transition: all 0.2s ease-out;
}
a:hover{
    background: -moz-linear-gradient(top, #5bdfcb 0%, #06b398 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#5bdfcb), color-stop(100%,#06b398));
    background: -webkit-linear-gradient(top, #5bdfcb 0%,#06b398 100%);
    background: -o-linear-gradient(top, #5bdfcb 0%,#06b398 100%);
    background: -ms-linear-gradient(top, #5bdfcb 0%,#06b398 100%);
    background: linear-gradient(to bottom, #5bdfcb 0%,#06b398 100%);
}

</style>

</head>
<body>
  <!--   <div class="pageoverlay">
	
	</div> -->
	<div style="margin:0 auto;100%;min-width:1366px;">
		<img alt="" src="/travel/includes/image/index/hemaji.gif">
	</div>
	<!-- <div style="width:1200px;height:800px;"></div> -->
	<!-- <div><img alt="" style="width:800px;" src="includes/image/index/index.jpg"></div> -->
	<!-- <div style="margin:0 auto;width:200px;"><a href="/travel/visitor/first.action" type="button">点击登陆</a></div> -->
</body>
</html>
