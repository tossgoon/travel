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
<title>气象信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="褐马鸡,保护区,气象信息">
<meta http-equiv="description" content="气象信息">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	float: right;
}

body {
	background-color: #f2f2f2;
}

#formAnimal span {
	float: right;
}

.row {
	margin-top: 4px;
	margin-bottom: 4px;
}
th,td{
text-align:center;}
</style>
</head>

<body>
    <%@ include file="/oaadmin/oahead.jsp"%>
    <div class="contentstyle">
	<div class="container" style="width:1056px;background-color:#ffffff;margin:0 auto;margin-bottom:10px;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：OA管理&gt;&gt; 历史天气信息    </span>
					<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<!-- <div class="panel-heading">OA管理：动物状况监测信息编辑 </div> -->
					<div class="panel-body">
						<div  style="width:100%;margin:0 auto;">
								<div class="container" style="width:1000px;">
										<div class="row">
											<div class="col-md-12">
											   <p id="weathertime" style="font-size:14px;"></p>
											</div>
										</div>
										<div class="row" style="margin-top:30px;">
											<div class="col-md-12">
												<table style="width:100%;font-size:14px;" class="table">
												   <thead>
												      <tr  align="center">
												           <th>时间</th>
												           <th>降雨量</th>
												           <th>空气温度</th>
												           <th>空气湿度</th>
												           <th>大气压力</th>
												           <th>光合有效</th>
												           <th>风向</th>
												           <th>紫外辐射</th>
												           <th>土壤酸碱</th>
												           <th>PM25</th>
												           <th>详情</th>
												      </tr>
												   </thead>
												   <tbody id="tbweather">
													<c:forEach var="w" items="${wlist}">
														<tr align="center" height="24px">
															<td>${w.weatherdatestr}</td>
															<td>${w.jiangyuliang}</td>
															<td>${w.kongqiwendu}</td>
															<td>${w.kongqishidu}</td>
															<td>${w.daqiyali}</td>
															<td>${w.guangheyouxiao}</td>
															<td>${w.fengxiang}</td>
															<td>${w.ziwaifushe}</td>
															<td>${w.turangsuanjian}</td>
															<td>${w.pm25}</td>
															<td ><a	href="/travel/dept/query.action?id=${dept.id}">查看</a>&nbsp;&nbsp;
															</td>
														</tr>
													</c:forEach>
												</tbody>
												</table>
											</div>
										</div>
									</div>
						</div>
					</div>
				</div>				
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<a id="firstpage" href="/travel/visitor/queryweatherlist.action?pagesize=10&pagenum=1">第一页</a> 
				<a id="lastpage"  href="/travel/visitor/queryweatherlist.action?pagesize=10&pagenum=${page.currentPage-1 }" >上一页</a> 
				<a id="nextpage"  href="/travel/visitor/queryweatherlist.action?pagesize=10&pagenum=${page.currentPage+1 }" >下一页</a>
				<a id="endpage"   href="/travel/visitor/queryweatherlist.action?pagesize=10&pagenum=${page.totalPage }" >最后一页</a>
				<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
</body>
</html>
