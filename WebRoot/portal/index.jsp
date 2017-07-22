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
<title>欢迎访问本站!</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="保护区网站">
<link rel="stylesheet"	href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<style type="text/css">
body{
 font-family:"Microsoft Yahei";
 background-color:rgb(226,252,231);
}
.headlogo {
	text-align: center;
	width: 100%;
	height: 361px;
	min-width: 1100px;
	background-image: url(<%=contextPath%>/includes/image/bann.jpg);
	margin:0 auto;
}
.navbarhead {
    text-align: center;
	height: 60px;
	min-width: 1100px;
	background-color: rgb(2, 189, 115);
	width:100%;
	margin:0 auto;
}
.navbarhead li {
	list-style-image: none;
	list-style-type: none;
	margin-right:5px;
	float: left;
}

.navbarhead li a {
    font-size:18px;
    font-weight:bold;
	color: #FFFFFF;
	text-decoration: none;
	margin: 0px;
	padding-top: 18px;
	display: block; /* 作为一个块 */
	padding-right: 15px; /* 设置块的属性 */
	padding-bottom: 16px;
	padding-left: 15px;
}
.navbarhead li a:hover {
	background-color: rgb(1,135,82);
	text-decoration:none;
	color: #FFFFFF;

}

</style>
</head>
<body>

	<div class="headlogo" id="logoindex">
		<div style="width:900px;margin:0 auto;">
			<img alt="" style="margin-top:100px;"
				src="<%=contextPath%>/includes/image/logotitle.png">
		</div>
	</div>
	<div class="navbarhead">
		<ul style="margin:0 auto;width:1100px;">
			<li><a href="http://www.baidu.com">首页</a></li>
			<li><a href="http://www.Code52.Net">保护区介绍</a></li>
			<li><a href="http://www.yahoo.com">工作动态</a></li>
			<li><a href="http://www.google.com">政策法规</a></li>
			<li><a href="http://www.google.com">政务公开</a></li>
			<li><a href="http://www.google.com">志愿者之家</a></li>
			<li><a href="http://www.google.com">科普知识</a></li>
			<li><a href="http://www.google.com">地理位置</a></li>
			<li><a href="http://www.google.com">联系我们</a></li>
		</ul>
	</div>

	<div class="container" style="width:100%;margin-top:5px;">
		<div class="row">
			<div class="col-md-8">
				<div id="myCarousel" class="carousel slide"
					style="width:600px;margin:0 auto;">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<c:forEach var="portal" items="${portalWorkPics}">
							<div class="item">
								<img src="${portal.pictureurl}"	alt="${portal.title}">
							</div>
						</c:forEach>
						<div class="item">
								<img src="<%=contextPath%>/includes/image/bann.jpg"	alt="110">
							</div>
					</div>
					
					
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</div>
			<div class="col-md-4"><img src="<%=contextPath%>/includes/image/bann.jpg"	alt="110"></div>
		</div>
	</div>

	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>
