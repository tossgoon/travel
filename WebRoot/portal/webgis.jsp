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

<%
java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currDate = new java.util.Date();
String currentDate = dateFormat.format(currDate);
String currentTime = timeFormat.format(currDate);
System.out.println(currentDate + "/当前日期");
System.out.println(currentTime + "/当前时间");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- <!DOCTYPE html> -->
<html>
<head>
<base href="<%=basePath%>">
<title>欢迎访问本站!</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="保护区网站">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<link rel="stylesheet"	href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"	href="<%=contextPath%>/includes/css/index.css" />

<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	background-color: rgb(226, 252, 231);
}

.headlogo {
	text-align: center;
	width: 100%;
	height: 550px;
	min-width: 1174px;
	margin: 0 auto;
	background-image: url(<%=contextPath%>/includes/image/bann3.jpg);
}

.navbarhead {
	text-align: center;
	height: 60px;
	min-width: 1174px;
	background-color: #02BD73;
	width: 100%;
	margin: 0 auto;
}

.navbarhead li {
	list-style-image: none;
	list-style-type: none;
	margin-right: 5px;
	float: left;
}

.navbarhead li a {
	font-size: 18px;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	margin: 0px;
	padding-top: 18px;
	display: block;
	padding-right: 15px;
	padding-bottom: 16px;
	padding-left: 15px;
}

.navbarhead li a:hover {
	background-color: #018752;
	text-decoration: none;
	color: #FFFFFF;
}

.carousel-inner img {
	margin: 0 auto;
	width: auto;
}

#myCarousel {
	width: 700px;
	height: 438px;
	margin: 0 auto;
}

.leftpanel {
	width: 700px;
	margin: 0 auto;
	float: left;
}

.rightpanel {
	margin: 0 auto;
	float: right;
	width: 420px;
}

.maincontent {
	width: 1174px;
	margin: 0 auto;
	background-color: #ffffff;
}

.title1 a {
	font-size: 18px;
	color: #2E2E2E;
	text-decoration: none;
	margin-left: 20px;
}

.title1 a:hover {
	color: #006400;
	text-decoration: none;
}

.title2 {
	margin-left: 20px;
}

.titlepanel {
	font-size: 18px;
	padding-left: 20px;
}

.titlepaneldiv {
	border-bottom: 3px solid #018752;
	width: 120px;
	position: relative;
	top: 1px;
	padding-bottom: 12px;
	font-weight: bold;
	padding-top: 30px;
}

.panelcontent {
	border-top: 1px solid #A8A8A8;
	padding-top: 12px;
}

.subtitlediv {
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 16px;
	width: 100%;
	border-bottom: 1px solid #C2C2C2;
	font-size: 22px;
	margin-bottom: 16px;
}

.subtitle {
	border-left: 8px solid #018752;
	padding-left: 14px;
}

.sublist {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
	border-bottom: 1px dotted;
	font-size: 16px;
}

.morea {
	font-size: 12px;
	float: right;
	margin-top: -15px;
}

.testfont {
	font-size: 40px;
	font-weight: bold;
	margin-top: 100px;
	font-family: KaiTi;
	color: red;
}

.testfont1 {
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
	color: #FF7F00;
}
/* 滚动图片 */
#demo {
	background: #FFF;
	overflow: hidden;
	border: 1px dashed #CCC;
	width: 800px;
}

#demo img {
	border: 3px solid #F2F2F2;
}

#indemo {
	float: left;width: 800%;

}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}
</style>
</head>
<body>
    <%@ include file="headmodal.jsp"%>
	<div class="maincontent" id="themap" style="height:600px;margin-top:15px;border:1px solid;">
	</div>
	<%@ include file="footmodal.jsp"%>
	<%--    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
   <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script> --%>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=3ad53ae8a26edf19caf8573cbdbb9b15"></script> 
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/includes/js/travel/rolling.js"></script>
	<script type="text/javascript">
	
	    var map;
		$(function() {
			//初始化地图
			map = new AMap.Map('themap',{
			    zoom: 10,
			    //dragEnable:false,
			    zoomEnable:false,
			    layers: [new AMap.TileLayer.Satellite(),new AMap.TileLayer.RoadNet()],
			    center: [109.753373,35.732862]//new AMap.LngLat(116.39,39.9)
			});
		});
	</script>
</body>
</html>
