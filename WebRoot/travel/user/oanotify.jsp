<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath() + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>OA系统-通知公告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="OA系统">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
</head>
<style type="text/css">
body{
	background-color: #f2f2f2;
}
td{
text-align:center;
}
th{
text-align:center;
}
</style>
<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;公告通知
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li class="activeli"><a href="javascript:void(0)">公告通知</a></li>
					<li><a href="/travel/oa/querysend.action">发文管理</a></li>
					<li><a href="/travel/oa/queryreceive.action">收文管理</a></li> 
					<li><a href="/travel/oa/queryfolderlist.action">网络硬盘</a></li>
					<li><a href="/travel/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
					<li><a href="/travel/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li><a href="/travel/survey/animalsuredit.jsp" target="_blank">野生动物监测状况 </a></li>
					<li><a href="/travel/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
					<li><a href="/travel/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="/travel/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
					<li><a href="/travel/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li><a href="/travel/weather/weather.jsp">气象数据 </a></li>
					<li><a href="/travel/travel/user/oauserinfo.jsp">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <h3>通知公告</h3>
			   <hr>
			   <div style="width:100%;height:490px;">
			   
			   <table style="width:90%;text-align:center;" class="table">
					<thead>
							<tr height="26px">
								<th width="100" style="display:none;">ID</th>
								<th style="text-align:center;" width="260">标题</th>
								<th width="160">发布日期</th>
								<th width="90">查看</th>
							</tr>
					</thead>
					<tbody>
						<c:forEach var="notify" items="${notifyList}">
							<tr align="center" height="24px">
									<td  style="display:none;">${notify.id}</td>
									<td>${notify.title}</td>
									<td>${notify.pubdatestr}</td>
									<td>
									    <%-- <c:if test="${notify.status!=true}"> --%>
											<a href="/travel/oa/viewnotify.action?notifyid=${notify.id}"
												style="margin-right:10px;">查看详情</a>
										<%-- </c:if> --%>
									</td>
							</tr>
						</c:forEach>
					</tbody>	
				</table>
			   </div>
					<div style="margin-top:10px;">
							<a id="firstpage" href="/travel/oa/querynotifysend.action?pagesize=10&pagenum=1">第一页</a>
							<a id="lastpage"  href="/travel/oa/querynotifysend.action?pagesize=10&pagenum=${page.currentPage-1 }">上一页</a>
							<a id="nextpage"  href="/travel/oa/querynotifysend.action?pagesize=10&pagenum=${page.currentPage+1 }">下一页</a>
							<a id="endpage"	  href="/travel/oa/querynotifysend.action?pagesize=10&pagenum=${page.totalPage }">最后一页</a>
							<label id="pagecount "> ${page.currentPage }/${page.totalPage }</label>
					</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
	
		
	</script>
</body>
</html>
