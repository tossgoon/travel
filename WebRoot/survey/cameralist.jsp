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
<title>红外相机监测数据查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="褐马鸡,保护区">
<meta http-equiv="description" content="红外相机监测数据查询">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
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
     <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;红外相机数据查询
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
	<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel">
				<ul>
				    <c:if test="${usertype==1}">
				    <li><a href="<%=contextPath%>/survey/querychickpage.action">褐马鸡监测查询</a></li>
					</c:if>
					<li class="activeli"><a href="javascript:void(0)">	红外相机监测查询</a></li>
					<c:if test="${usertype==1}">
					<li><a href="<%=contextPath%>/survey/queryanimalpage.action">野生动物监测查询</a></li>
					<li><a href="<%=contextPath%>/survey/queryplantpage.action">森林植物群落查询	</a></li>
					<li><a href="<%=contextPath%>/survey/queryimportpage.action">动植物信息查询	</a></li>
					<li><a href="<%=contextPath%>/survey/queryprotectpage.action">保护区巡护查询	</a></li>
					</c:if>
					<c:if test="${usertype==0}">
						<li><a href="<%=contextPath%>/survey/chickedit.jsp"	>褐马鸡种群状况 </a></li>
						<li><a href="<%=contextPath%>/survey/cameraedit.jsp"> 红外相机监测状况</a></li>
						<li><a href="<%=contextPath%>/survey/animalsuredit.jsp">野生动物监测状况</a></li>
						<li><a href="<%=contextPath%>/survey/plantedit.jsp">森林植物群落监测 </a></li>
						<li><a href="<%=contextPath%>/survey/importinfoedit.jsp">动植物重要信息 </a></li>
						<li><a href="<%=contextPath%>/survey/protectedit.jsp">保护区巡护记录 </a></li>
					</c:if>
					<li><a	href="<%=contextPath%>/oa/queryfolderlist.action?ptype=1">网络硬盘</a></li>
					<li><a	href="<%=contextPath%>/oa/queryfolderlist.action?ptype=2">巡护图片</a></li>
					<li><a href="<%=contextPath%>/user/queryuinfo.action">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel">
				<div class="container"
					style="width:100%;background-color:#ffffff;margin:0 auto;margin-bottom:10px;">
					<div class="row" style="margin-top:18px;">
						<div class="col-md-12">
							<div class="panel panel-primary" style="width:100%;">
								<div class="panel-heading">
									<h3 class="panel-title">查询条件</h3>
								</div>
								<div class="panel-body container" style="width:100%;">
									<div class="row">
										<div class="col-md-2">
											<span style="float:right">安装日期（起始）</span>
										</div>
										<div class="col-md-4">
											<div class="input-group date form_date"
												data-date-format="yyyy-mm-dd">
												<s:textfield class="form-control input-sm" id="begindate"
													value="%{beginstr}">
												</s:textfield>
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<div class="col-md-2">
											<span style="float:right">安装日期（终止）</span>
										</div>
										<div class="col-md-4">
											<div class="input-group date form_date"
												data-date-format="yyyy-mm-dd">
												<s:textfield class="form-control input-sm" id="enddate"
													value="%{endstr}">
												</s:textfield>
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-offset-6 col-md-6" style="padding-top:10px;">
											<a href="javascript:void(0)" class="btn btn-primary"
												onclick="DoSearch()">查询数据</a> <a id="export"
												href="javascrip:void(0)" class="btn btn-success"
												onclick="DoExport()">导出数据</a> <a href="javascript:void(0)"
												id="lookgis" class="btn btn-warning" onclick="LookGIS()">查看数据</a>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-danger" style="margin:0 auto;">
								<div class="panel-body">
									<div class="container" style="width:100%;height:300px;">
										<div class="row" style="margin-top:30px;">
											<div class="col-md-12">
												<table style="width:100%;font-size:14px;" class="table">
													<thead>
														<tr align="center">
															<th>相机编号</th>
															<th>安装日期</th>
															<th>安装人员</th>
															<th>小地名</th>
															<!-- <th>海拔高度</th>
															<th>经度</th>
															<th>纬度</th>
															<th>生境类型</th> -->
															<th>坡位</th>
															<th>坡向</th>
															<th>详细</th>
														</tr>
													</thead>
													<tbody id="tbweather">
														<c:forEach var="a" items="${cameralist}">
															<tr align="center" height="24px">
																<td>${a.xiangjibianhao}</td>
																<td>${a.datestr}</td>
																<td>${a.anzhuangrenyuan}</td>
																<td>${a.xiaodiming}</td>
																<%-- <td>${a.height}</td>
																<td>${a.jingdu}</td>
																<td>${a.weidu}</td>
																<td>${a.shengjingleixing}</td> --%>
																<td>${a.powei}</td>
																<td>${a.poxiang}</td>
																<td>
																   <c:if test="${usertype==1}">
																
																    <a	href="<%=contextPath%>/survey/querycamera.action?id=${a.id}"
																	target="_blank">查看&nbsp;编辑</a>&nbsp;&nbsp;
																   </c:if>
																	 <c:if test="${usertype==0}">
																    <a	href="<%=contextPath%>/survey/querycamera.action?id=${a.id}"
																	target="_blank">查看</a>&nbsp;&nbsp;
																   </c:if>
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
					<div class="row">
						<div class="col-md-12">
							<a id="firstpage"
								href="<%=contextPath%>/survey/querycamerapage.action?pagesize=10&pagenum=1">第一页</a>
							<a id="lastpage"
								href="<%=contextPath%>/survey/querycamerapage.action?pagesize=10&pagenum=${page.currentPage-1 }">上一页</a>
							<a id="nextpage"
								href="<%=contextPath%>/survey/querycamerapage.action?pagesize=10&pagenum=${page.currentPage+1 }">下一页</a>
							<a id="endpage"
								href="<%=contextPath%>/survey/querycamerapage.action?pagesize=10&pagenum=${page.totalPage }">最后一页</a>
							<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
						</div>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
    <script type="text/javascript">
		$(function() {
			//初始化日期控件
			$('.form_date').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0
			});
		});
		function DoSearch(){
			var begindate=$("#begindate").val();//开始日期
			var enddate=$("#enddate").val();//结束日期
			if(begindate==""&&enddate==""){
				window.location.href ="<%=contextPath%>/survey/querycamerapage.action"; 
			}
			else if(begindate==""){
				window.location.href ="<%=contextPath%>/survey/querycamerapage.action?enddate="+enddate; 
			}
			else if(enddate==""){
				window.location.href ="<%=contextPath%>/survey/querycamerapage.action?begindate="+begindate; 
			}
			else{
				window.location.href ="<%=contextPath%>/survey/querycamerapage.action?begindate="+begindate+"&enddate="+enddate; 
			}
		}
		function LookGIS(){
			//导出数据
			//href='/travel/fileio/download.action?fid=<s:property	value="#oafile.id" />'
			var begindate=$("#begindate").val();//开始日期
			var enddate=$("#enddate").val();//结束日期
			if(begindate==""&&enddate==""){
				document.getElementById("lookgis").href="<%=contextPath%>/survey/showcameralist.action";
			}
			else if(begindate==""){
				document.getElementById("lookgis").href="<%=contextPath%>/survey/showcameralist.action?enddate="+enddate;
			}
			else if(enddate==""){
				document.getElementById("lookgis").href="<%=contextPath%>/survey/showcameralist.action?begindate="+begindate;
			}
			else{
				document.getElementById("lookgis").href="<%=contextPath%>/survey/showcameralist.action?begindate="+begindate+"&enddate="+enddate;
			}
		}
		function DoExport(){
			//导出数据
			//href='/travel/fileio/download.action?fid=<s:property	value="#oafile.id" />'
			var begindate=$("#begindate").val();//开始日期
			var enddate=$("#enddate").val();//结束日期
			if(begindate==""&&enddate==""){
				document.getElementById("export").href="<%=contextPath%>/survey/exportcameralist.action";
			}
			else if(begindate==""){
				document.getElementById("export").href="<%=contextPath%>/survey/exportcameralist.action?enddate="+enddate;
			}
			else if(enddate==""){
				document.getElementById("export").href="<%=contextPath%>/survey/exportcameralist.action?begindate="+begindate;
			}
			else{
				document.getElementById("export").href="<%=contextPath%>/survey/exportcameralist.action?begindate="+begindate+"&enddate="+enddate;
			}
		}
	</script>

</body>
</html>
