<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<title>网站搜索</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="网站搜索">
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">


<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	background-color: rgb(226, 252, 231);
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
</style>

</head>
<body>
	<%@ include file="/portal/headmodal.jsp"%>
	<div class="contentstyle">
	<div class="container" style="width:100%;margin:0 auto;text-align:center;margin-top:20px;">
		<div class="row">
			<div class="col-md-12" style="margin:0 auto;">
				<div	style="width:1024px;margin:0 auto;padding-top:20px;text-align:left;background-color:#ffffff;border-bottom:1px solid #228B22;padding-left:20px;padding-bottom:12px;">
					<span>当前位置：首页&gt;&gt;网站查询
					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;text-align:left;margin:0 auto;padding-top:20px;">
					<div class="panel-body" style="height:500px;">
						<c:forEach var="portal" items="${portals}">
							<p class="title1">
								<a href="<%=contextPath%>/visitor/show.action?id=${portal.id}">${portal.title}</a>
							</p>
							<p class="title2">
								${portal.pubdatestr}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<c:choose>
									 <c:when test="${ptype=='0'}">
							保护区介绍
						</c:when>
						<c:when test="${ptype=='1'}">
							工作动态
						</c:when>
						<c:when test="${ptype=='2'}">
							政策法规
						</c:when>
						<c:when test="${ptype=='3'}">
							政务公开
						</c:when>
						<c:when test="${ptype=='4'}">
							志愿者之家
						</c:when>
						<c:when test="${ptype=='5'}">
							科普知识（动物）
						</c:when>
						<c:when test="${ptype=='6'}">
							联系我们
						</c:when>
						<c:when test="${ptype=='7'}">
							图片赏析（动物）
						</c:when>
						<c:when test="${ptype=='8'}">
							保护区防护（防火）
						</c:when>
						<c:when test="${ptype=='9'}">
							保护区防护（防虫）
						</c:when>
						<c:when test="${ptype=='10'}">
							科普知识（植物）
						</c:when>
						<c:when test="${ptype=='11'}">
							图片赏析（植物）
						</c:when>
						<c:when test="${ptype=='12'}">
							图片赏析（景观）
						</c:when>
						<c:when test="${ptype=='13'}">
							保护区防护（野生动植物）
						</c:when>
						 <c:otherwise>
                                                         其他
    					</c:otherwise>
								</c:choose>
							</p>
							<hr	style='height:1px;border:none;border-top:1px dashed #C2C2C2;margin:0 auto;' />
						</c:forEach>
					</div>

					<div class="panel-footer">
						<a id="firstpage" href="<%=contextPath%>/visitor/searchpage.action?pagesize=7&pagenum=1&keywords=${keywords}">第一页</a> 
						<a id="lastpage"  href="<%=contextPath%>/visitor/searchpage.action?pagesize=7&pagenum=${page.currentPage-1 }&keywords=${keywords}" >上一页</a> 
						<a id="nextpage"  href="<%=contextPath%>/visitor/searchpage.action?pagesize=7&pagenum=${page.currentPage+1 }&keywords=${keywords}" >下一页</a>
						<a id="endpage"   href="<%=contextPath%>/visitor/searchpage.action?pagesize=7&pagenum=${page.totalPage }&keywords=${keywords}" >最后一页</a>
						<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
    <%@ include file="footmodal.jsp"%>
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
