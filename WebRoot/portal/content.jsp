<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
}
.headlogo {
	text-align: center;
	width: 100%;
	height: 191px;
	min-width: 1100px;
	background-image: url(<%=contextPath%>/includes/image/logobk.png);
}
.navbarhead {
    text-align: center;
	height: 60px;
	min-width: 1100px;
	background-color: rgb(2, 189, 115);
	width:100%;
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
	padding-bottom: 18px;
	padding-left: 15px;
}
.navbarhead li a:hover {
	background-color: rgb(1,135,82);
	text-decoration:underline;
	color: #FFFFFF;
}

</style>
</head>
<body>
	<div class="headlogo" id="logoindex">
		<div style="width:1100px;margin:0 auto;">
			<img alt="" style="margin-top:30px;"
				src="<%=contextPath%>/includes/image/logofk.png">
		</div>
	</div>
	<div class="navbarhead">
		<ul style="margin-left:auto;margin-right:auto;width:1100px;">
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

	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-md-offset-1 ">
				<div id="myCarousel" class="carousel slide" style="width:900px;margin:0 auto;">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="<%=contextPath%>/includes/image/slide1.png"
								alt="First slide">
						</div>
						<div class="item">
							<img src="<%=contextPath%>/includes/image/slide1.png"
								alt="Second slide">
						</div>
						<div class="item">
							<img src="<%=contextPath%>/includes/image/slide1.png"
								alt="Third slide">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left"  href="#myCarousel"	data-slide="prev">&lsaquo;</a> 
					<a class="carousel-control right" href="#myCarousel"   data-slide="next">&rsaquo;</a>
				</div>

			</div>
		</div>
	</div>

	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>
