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
<title>陕西延安黄龙山褐马鸡国家级自然保护区</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="黄龙山,褐马鸡,自然保护区">
<meta http-equiv="description" content="陕西延安黄龙山褐马鸡国家级自然保护区">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<link rel="stylesheet"	href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"	href="<%=contextPath%>/includes/css/index.css" />

<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	background-color: rgb(226, 252, 231);
	position: absolute;
	width: 100%;
	min-height: 100%;
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
.dropdown-menu li {
	width:100%;
	border-bottom:1px solid #C4C4C4;
}
.dropdown-menu li a {
	font-size: 16px;
	color: #000000;
	text-decoration: none;
	margin: 0px;
	padding-top: 14px;
	display: block;
	padding-right: 15px;
	padding-bottom: 14px;
	padding-left: 15px;
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
.title1{
   margin-top:5px;
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
	margin:10px;
	margin-left:20px;
}

.titlepanel {
	font-size: 18px;
	padding-left: 20px;
	border-left:5px solid #018752;
	margin-left:20px;
}

.titlepaneldiv {
	border-bottom: 3px solid #36648B;
	width: 130px;
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

#indemo,#indemop,#indemos {
	float: left;width: 800%;

}

#demo1,#demop1,#demos1 {
	float: left;
}

#demo2,#demop2,#demos2 {
	float: left;
}
#logoindex a{
color:#ffffff;
}
</style>
</head>
<body>
	<div class="headlogo" id="logoindex">
		<div style="position:absolute;z-index:10;top:16px;right:16px;font-color:#fff;">
			<a href="#" style="font-color:#fff;" onClick="window.external.AddFavorite('http://hemaji.gov.cn','陕西延安黄龙山褐马鸡国家级自然保护区')">加入收藏</a>
			| <a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://hemaji.gov.cn');">设为首页</a>
		</div>
		
		<%-- <img alt="" style="position:absolute;z-index:9;top:200px;margin-left:-500px;left:50%;width:1000px;" src="<%=contextPath%>/includes/image/toptitle.png"> --%> 
		
		<div style="position:absolute;z-index:9;width:100%;min-width:1200px;text-align:center;left:0px;right:0px;top:200px;margin:0 auto;">
		    <img alt="" style="width:1100px;" src="<%=contextPath%>/includes/image/toptitle.png"> 
		</div>
		
		<div class="login-content">
			<div class="bg_item bg_item1">
				<div class="item1"></div>
			</div>
			<div class="bg_item bg_item2">
				<div class="item2"></div>
			</div>
			<div class="bg_item bg_item3">
				<div class="item3"></div>
			</div>
		</div>
	</div>
	<div class="navbarhead">
		<ul style="margin:0 auto;width:1250px;">
			<li><a href="javascript:void(0)">首页</a></li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" target="_blank">
                    	保护区介绍
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/show.action?id=24" target="_blank">保护区简介</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=54" target="_blank">保护区历史</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=55" target="_blank">组织机构</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=56" target="_blank">人员编制</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=57" target="_blank">工作职能</a></li>
                </ul>
            </li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	保护区动态
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=1"  target="_blank">工作动态</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=3"  target="_blank">政务公开</a></li>
                </ul>
            </li>
			<li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=2">政策法规</a></li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	保护区防护
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=13"  target="_blank">野生动植物保护</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=8"  target="_blank">防火管理</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=9"  target="_blank">防虫管理</a></li>
                </ul>
            </li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	科普知识
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=5"  target="_blank">保护区动物</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=10"  target="_blank">保护区植物</a></li>
                </ul>
            </li>
			<li><a href="<%=contextPath%>/weather/weather.jsp" target="_blank">森林火险气象等级</a></li>
			<li><a href="<%=contextPath%>/visitor/show.action?id=50" target="_blank">联系我们</a></li>
			<li><a href="<%=contextPath%>/travel/user/login.jsp" target="_blank">OA办公系统</a></li>
		</ul>
	</div>
	<div style="padding-top:15px;padding-bottom:35px;width:100%;background-color:#ffffff;height:60px;">
		<div style="width:1174px;margin:0 auto;">
			<label	style="font-size:12px;font-weight:normal;margin-left:20%;float:left;">今日天气：<%=currentDate%></label>
			<label>森林火险气象等级：</label><label id="firelevel" style="background-color:#f2f2f2"></label>
			<iframe name="sinaWeatherTool"
				src="http://weather.news.sina.com.cn/chajian/iframe/weatherStyle1.html?city=%E5%BB%B6%E5%AE%89"
				width="200" height="20" marginwidth="0" marginheight="0" hspace="0"
				vspace="0" frameborder="0" scrolling="no"
				style="vertical-align:middle;background:none;float:left;">
			</iframe>

			<s:form role="form" class="input-group" theme="simple"	id="formSearch" action="searchpage" namespace="/visitor"
				style="width:220px;float:right;margin-right:60px;">
				<input type="text" class="form-control input-sm" name="keywords"
					placeholder="输入内容进行查询...">
				<span class="input-group-btn"> <button	class="btn btn-default  btn-sm" type="submit">查询</button>
				</span>
			</s:form>
			<!-- /input-group -->
		</div>
	</div>
	<div class="maincontent">
	
	<div class="leftpanel">
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<c:forEach var="portal" items="${portalWorkPics}"
						varStatus="status">
						<c:choose>
							<c:when test="${status.first}">
								<div class="item active">
									<a target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
									<img style="height:438px;width:100%;"
										src="${portal.pictureurl}" alt="${portal.title}">
									 <div class="carousel-caption">${portal.title}</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
								<a target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
									<img style="height:438px;width:100%;"
										src="${portal.pictureurl}" alt="${portal.title}">
									<div class="carousel-caption">${portal.title}</div>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
				<div class="titlepaneldiv">
					<span class="titlepanel" >工作动态</span>
				</div>
				<a class="morea" href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=1"> 更多&gt;&gt; </a>
			<div class="panelcontent">
				<c:forEach var="portal" items="${portalWorkList}" varStatus="status">
					<p class="title1">
						<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">${portal.title}</a>
					</p>
					<p class="title2">
						${portal.pubdatestr}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						${portal.subtitle}</p>
					<hr	style='height:1px;border:none;border-top:1px dashed #C2C2C2;margin:0 auto;' />
				</c:forEach>
			</div>
			<div class="titlepaneldiv">
				<span class="titlepanel">政策法规</span>
			</div>
			<a class="morea" target="_blank"  href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=2"> 更多&gt;&gt; </a>
			<div class="panelcontent">
				<c:forEach var="portal" items="${portalLawList}">
					<p class="title1">
						<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">${portal.title}</a>
					</p>
					<p class="title2">
						${portal.pubdatestr}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						${portal.subtitle}</p>
					<hr	style='height:1px;border:none;border-top:1px dashed #C2C2C2;margin:0 auto;' />
				</c:forEach>
			</div>
			<div class="titlepaneldiv">
				<span class="titlepanel">政务公开</span>
			</div>
			<a class="morea" target="_blank"  href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=3"> 更多&gt;&gt; </a>
			<div class="panelcontent">
				<c:forEach var="portal" items="${portalAffairsList}">
					<p class="title1">
						<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">${portal.title}</a>
					</p>
					<p class="title2">
						${portal.pubdatestr}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						${portal.subtitle}</p>
					<hr	style='height:1px;border:none;border-top:1px dashed #C2C2C2;margin:0 auto;' />
				</c:forEach>
			</div>
		</div>
		<div class="rightpanel">
			<div class="panel panel-success">
				<div class="panel-body">
					<div class="subtitlediv">
						<span class="subtitle">保护区介绍</span><a  target="_blank" 	style="font-size:12px;float:right;margin-top:12px;" href="<%=contextPath%>/visitor/show.action?id=24">
							更多&gt;&gt; </a>
					</div>
					
					<p style='font-size:16px;line-height:28px;'><label style='padding-left:30px;font-size:16px;'>陕西延安黄龙山褐马鸡国家级自然保护区</label>位于陕西省延安市的黄龙、宜川两县境内，是陕北黄土高原上唯一保存完整的天然次生林区。保护区地形复杂、山势陡峻，沟壑纵横、生境多样、自然资源丰富。总面积81753公顷，其中核心区25906公顷，缓冲区24825公顷，实验区31022公顷，森林覆盖率86.6%.....
					</p>
					<div style="text-align:center;margin:0 auto;"><img alt="褐马鸡" style="width:350px;" src="<%=contextPath%>/includes/image/chickshow.jpg"></div>
					
					<%-- <c:forEach var="portal" items="${portalIntroList}"
						varStatus="status">
						<c:if test="${status.first}">	
					   ${portal.content}
					</c:if>
					</c:forEach> --%>
				</div>
			</div>

			<div class="panel panel-success">
				<div class="panel-body">
					<div class="subtitlediv">
						<span class="subtitle">科普知识</span><a 	style="font-size:12px;float:right;margin-top:12px;" href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=5">
							更多&gt;&gt; </a>
					</div>
					<c:forEach var="portal" items="${portalAnimalList}">
						<div class='sublist'>
							<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
								${portal.title} </a>
						</div>
					</c:forEach>
					<c:forEach var="portal" items="${portalPlantList}">
						<div class='sublist'>
							<a target="_blank"  href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
								${portal.title} </a>
						</div>
					</c:forEach>
					<div style="width:100%;text-align:center;margin-top:10px;height:230px;">
					    <div id="youkuplayer" style="width:100%;height:230px"></div>
					</div>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-body">
					<div class="subtitlediv">
						<span class="subtitle">保护区防护</span><a  target="_blank" 	style="font-size:12px;float:right;margin-top:12px;" href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=8">
							更多&gt;&gt; </a>
					</div>
					<c:forEach var="portal" items="${portalPlantAnimalProtectList}">
						<div class='sublist'>
							<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
								${portal.title} </a>
						</div>
					</c:forEach>
					<c:forEach var="portal" items="${portalFireList}">
						<div class='sublist'>
							<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
								${portal.title} </a>
						</div>
					</c:forEach>
					<c:forEach var="portal" items="${portalInsectList}">
						<div class='sublist'>
							<a  target="_blank" href="<%=contextPath%>/visitor/show.action?id=${portal.id}">
								${portal.title} </a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="maincontent"  >
	        <div class="titlepaneldiv" style="width:320px;">
				 <span class="titlepanel">图片赏析 &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" id="animallink" style="color:#228B22;font-weight:normal;" onclick="ChangeAnimal()">动物</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="plantlink" style="color:#436EEE;font-weight:normal;" href="javascript:void(0)"onclick="ChangePlant()">植物</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="landscapelink" style="color:#436EEE;font-weight:normal;" href="javascript:void(0)"onclick="ChangeLandscape()">景观</a>
			</span>
				 </div>
	        <div class="panelcontent" id="demo" style="overflow: hidden;border: 1px dashed #CCC;	width: 100%;">
	        
	        <div id="indemo" >
				<div id="demo1">
				    <c:forEach var="portal" items="${pictureList}">
						<c:if test="${not empty portal.pictureurl}">
						  <a target="_blank"  href="<%=contextPath%>/visitor/show.action?id=${portal.id}"><img style="width:300px;height:200px;"src="${portal.pictureurl}" alt="${portal.title}"></a>
						</c:if>
					</c:forEach>
				</div>
				<div id="demo2"></div>
			</div>
			
			<div id="indemop" style="display:none;">
				<div id="demop1">
				    <c:forEach var="portal" items="${pictureListPlant}">
						<c:if test="${not empty portal.pictureurl}">
						  <a target="_blank"  href="<%=contextPath%>/visitor/show.action?id=${portal.id}"><img style="width:300px;height:200px;"src="${portal.pictureurl}" alt="${portal.title}"></a>
						</c:if>
					</c:forEach>
				</div>
				<div id="demop2"></div>
			</div>	
			
			<div id="indemos" style="display:none;">
				<div id="demos1">
				    <c:forEach var="portal" items="${pictureLisLandscape}">
						<c:if test="${not empty portal.pictureurl}">
						  <a target="_blank"  href="<%=contextPath%>/visitor/show.action?id=${portal.id}"><img style="width:300px;height:200px;"src="${portal.pictureurl}" alt="${portal.title}"></a>
						</c:if>
					</c:forEach>
				</div>
				<div id="demos2"></div>
			</div>	
			           
		</div>
	</div>
	<div class="maincontent" id="themap" style="height:600px;margin-top:15px;border:1px solid;">
	</div>
	<div class="maincontent" style="padding-bottom:120px;">
	      <div class="titlepaneldiv">
				<span class="titlepanel">友情链接</span>
			</div>
		<div class="panelcontent" style="margin:0 auto;text-align:center;">
			<a style="margin-right:12px;" href="http://www.forestry.gov.cn/"target="_blank">国家林业局</a> 
			<a style="margin-right:12px;" href="http://www.snly.gov.cn/" target="_blank">陕西省林业厅</a>
			<a style="margin-right:12px;" href="http://www.yaslyj.gov.cn/"	target="_blank">延安市林业局</a>
			<a style="margin-right:12px;" href="http://www.slfh.gov.cn/slfhw/default.aspx" target="_blank">中国森林防火网</a>
			<a style="margin-right:12px;" href="http://www.lknet.ac.cn/" target="_blank">中国林业信息网</a>
			<a style="margin-right:12px;" href="http://www.shaanxi.gov.cn/" target="_blank">陕西省人民政府</a>
			<a style="margin-right:12px;" href="http://www.yanan.gov.cn/" target="_blank">延安市人民政府</a>
		</div>
	</div>
	<%@ include file="footmodal.jsp"%>
	<%--    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
   <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script> --%>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=3ad53ae8a26edf19caf8573cbdbb9b15"></script> 
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/includes/js/travel/rolling.js"></script>
	<script type="text/javascript" src="//player.youku.com/jsapi"></script>
	<script type="text/javascript">
    	player = new YKU.Player('youkuplayer',{
    	 styleid: '0',
    	 client_id: 'YOUR YOUKUOPENAPI CLIENT_ID',
    	 vid: 'XMzA0MzM4ODAzNg',
    	 newPlayer: true
	   });
	    var map;//地图
	    var marker;//标记
	    var contextPath="<%=contextPath%>";
		$(function() {
			$("#myCarousel").carousel({
				interval : 7000
			});
			//初始化地图
			map = new AMap.Map('themap',{
			    zoom: 10,
			    //dragEnable:false,
			    zoomEnable:false,
			    layers: [new AMap.TileLayer.Satellite(),new AMap.TileLayer.RoadNet()],
			    center: [109.803373,35.600862]//new AMap.LngLat(116.39,39.9)
			});
			
			marker = new AMap.Marker({
				icon : contextPath+'/includes/image/redmarker.png',//24px*24px
		        position: map.getCenter()
		    });
		    marker.setMap(map);
		    // 设置label标签
		    marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
		        offset: new AMap.Pixel(-100, -30),//修改label相对于maker的位置
		        content: "<label style='font-size:14px;'>陕西延安黄龙山褐马鸡国家级自然保护区</label>"
		    });
		    //获取防火等级
		    $.ajax({
				type : "get",
				url : contextPath+"/visitor/queryfireinfo.action",
				//data :{datestr: $("#computedate").val()},
				//data :{datestr: datestr},
				cache : false, 
				dataType : "json",
				success : function(data) {
					var fire=data.fire;
					$("#firelevel").html(fire.levelstr);
					if(fire.level==1){
						$("#firelevel").css("color","#00ff00");
					}
					else if(fire.level==2){
						$("#firelevel").css("color","#0000ff");
						
					}else if(fire.level==3){
						$("#firelevel").css("color","#EE9A00");
					}else if(fire.level==4){
						$("#firelevel").css("color","#FF8C00");
					}else if(fire.level==5){
						$("#firelevel").css("color","#ff0000");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					//alert(XMLHttpRequest.status);
					$("#firelevel").html("--");
				}
			});
		});
		function ChangeAnimal(){
			$("#indemo").show();
			$("#indemop").hide();
			$("#indemos").hide();
			$("#animallink").css("color","#228B22");
			$("#plantlink").css("color","#436EEE");
			$("#landscapelink").css("color","#436EEE");
		}
		function ChangePlant(){
			$("#indemo").hide();
			$("#indemop").show();
			$("#indemos").hide();
			$("#animallink").css("color","#436EEE");
			$("#plantlink").css("color","#228B22");
			$("#landscapelink").css("color","#436EEE");
		}
		function ChangeLandscape(){
			$("#indemo").hide();
			$("#indemop").hide();
			$("#indemos").show();
			$("#animallink").css("color","#436EEE");
			$("#plantlink").css("color","#436EEE");
			$("#landscapelink").css("color","#228B22");
		}
	</script>
</body>
</html>
