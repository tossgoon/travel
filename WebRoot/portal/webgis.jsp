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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>地理位置</title>
<link rel="stylesheet"
	href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=contextPath%>/includes/css/portal_head_modal.css">
</head>

<body>
    <%@ include file="headmodal.jsp"%>
   <div class="contentstyle">
	<div  id="themap" style="height:600px;width:1174px;margin:0 auto;">
	</div>
	</div>
	<%@ include file="footmodal.jsp"%>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=3ad53ae8a26edf19caf8573cbdbb9b15"></script> 
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
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
