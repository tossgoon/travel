<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<title>网站门户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="内容管理">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" /> --%>

<link rel="stylesheet" href="<%=contextPath%>includes/css/portaltab.css">
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
<style type="text/css">
body{
	background-color: #F2F2F2;
}
.leftpanel {
	width:220px;
	margin: 0 auto;
	float: left;
	height:500px;
	background-color:#ffffff;
}
.rightpanel {
    width:960px;
	margin: 0 auto;
	float: right;
	height:500px;
	border-left:1px solid #111111;
	padding-left:20px;
	background-color:#ffffff;
}
.maincontent {
	width:1180px;
	margin: 0 auto;
	text-align:center;
	background-color:#ffffff;
}
.headlogo {
	 background-color: #018752; 
	 height: 70px;
	 width:100%;
	 text-align:center;
}
.leftpanel ul{
	width:180px;
	margin:0 auto;
	background:#fff;
	position:relative;
	z-index:0;
	padding:60px 20px 70px;}
.leftpanel ul li{
	height:50px;
	line-height:50px;
	text-align:center;
	border-bottom:1px solid #F8F8F8;
	}	
.leftpanel ul li a{
	color:#666;
	padding-top:10px;
	font-size:16px;
	}
.leftpanel ul li a:hover{
	text-decoration:none;
	color:#FF5F3E;
}	
.activeli{
	background-color:#F9F9F9;
}
.activeli a{
	color:#FF5F3E;
	font-weight:bold;
}
</style>

</head>
<body>
	<%@ include file="oahead.jsp"%>
	<div class="toptool">
			<span>当前位置：OA后台管理>>网站门户
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
		</div>
	<div class="contentstyle">
		<div class="maincontent">
			<!-- <div class="leftpanel">
				<ul>
					<li class="activeli"><a style="color:#FF5F3E;" href="javascript:void(0)">网站门户</a></li>
					<li><a href="/travel/user/querypage.action">用户管理</a></li>
					<li><a href="/travel/oa/querynotify.action?pagesize=10&pagenum=1">通知公告</a></li>
					<li><a href="/travel/oaadmin/filelist.jsp">网络硬盘</a></li>
					<li><a href="/travel/dept/querylist.action">部门管理</a></li>
					<li><a href="/travel/oaadmin/orgadmin.jsp">组织架构</a></li>
				</ul>
			</div> -->
			<div  style="padding-top:20px;">
					<span style="font-size:18px;">网站门户管理</span>
					<div style="margin:0 auto;margin-top:20px;text-align:left;height:400px;">
							<div class="menu1box">
								<ul id="menu1">
									<li <c:if test="${ptype=='0'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=0">简介</a></li>
									<li <c:if test="${ptype=='1'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=1">工作动态</a></li>
									<li <c:if test="${ptype=='2'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=2">政策法规</a></li>
									<li <c:if test="${ptype=='3'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=3">政务公开</a></li>
									<li <c:if test="${ptype=='13'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=13">动植物防护</a></li>
									<li <c:if test="${ptype=='8'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=8">保护区防火</a></li>
									<li <c:if test="${ptype=='9'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=9">保护区防虫</a></li>
									<%-- <li <c:if test="${ptype=='4'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=4">志愿者之家</a></li> --%>
									<li <c:if test="${ptype=='5'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=5">科普-动物</a></li>
									<li <c:if test="${ptype=='10'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=10">科普-植物</a></li>
									<li <c:if test="${ptype=='6'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=6">联系我们</a></li>
									<li <c:if test="${ptype=='7'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=7">图片-动物</a></li>
									<li <c:if test="${ptype=='11'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=11">图片-植物</a></li>
									<li <c:if test="${ptype=='12'}"> class= "mhover" </c:if>><a
										href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=12">图片-景观</a></li>
									
								</ul>
							</div>

							<div style="padding-top:15px;margin:0 auto;text-align:center;">
								<table style="width:90%;" class="table table-hover">
									<tr align="center" style="font-weight:bold;" height="26px">
										<td align="center" width="10%">ID</td>
										<td align="center" width="60%">标题</td>
										<td align="center" width="15%">时间</td>
										<td align="center" width="15%">操作</td>
									</tr>

									<c:forEach var="portal" items="${portals}">
										<tr align="center" height="27px">
											<td align="center" width="10%">${portal.id}</td>
											<td align="center" width="60%">${portal.title}</td>
											<td align="center" width="15%">${portal.pubdatestr }</td>
											<td align="center" width="15%"><a
												href="javascript:void(0)"
												onclick="window.location.href='/travel/portal/query.action?id=${portal.id}'">编辑</a>&nbsp;&nbsp;
												<a href="javascript:void(0)"
												onclick="DeletePoralDlg(${portal.id},this)">删除</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					 <div style="padding-bottom:5px;">
						<a id="firstpage"	href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=${ptype}">第一页</a>
						<a id="lastpage"	href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.currentPage-1 }&type=${ptype}">上一页</a>
						<a id="nextpage"	href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.currentPage+1 }&type=${ptype}">下一页</a>
						<a id="endpage"		href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.totalPage }&type=${ptype}">最后一页</a>
						<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
						<a class="btn btn-success" style="margin-left:50px;" target="_blanck" href="/travel/portal/editor.jsp?ptype=${ptype}">新增数据</a>
					</div>
					
					</div>
					
		</div>
		<div  style="clear:both;height:20px;"></div>
	</div>

	<div class="modal fade" id="deleteModal" role="dialog"
		aria-labelledby="删除内容" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:210px;width:460px;">
				<div class="modal-header">
					<label>是否删除该记录</label>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-warning"
						style="margin-left:100px;" onclick="DeletePortal()">删除记录</button>
					<button type="button" class="btn btn-default"
						style="margin-left:100px;" data-dismiss="modal">取消</button>
				</div>
				<div class="modal-footer form-horizontal">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/portal/footmodal.jsp"%>
	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script
		src="<%=contextPath%>includes/js/uploadifive/jquery.uploadifive.min.js"></script>
	<script
		src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		var isadd = true;
		var updaterow;//更新的行
		var delPortalid;//当前删除的用户ID
		var delrow;//要删除的行
		function DeletePoralDlg(portalid, a) {
			delPortalid = portalid;
			delrow = $(a).parent().parent();//删除用户所在行
			$("#deleteModal").modal("show");
		}
		function DeletePortal() {
			$.ajax({
				url : '/travel/portal/delete.action?id=' + delPortalid,
				type : 'POST',
				// 提交数据给Action传入数据
				//data : {userid:delUserid},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.errorMsg == "0") {
						//删除用户
						$(delrow).remove();
						$("#deleteModal").modal("hide");
						//alert("更新完成。");
					} else {
						alert(data.errorMsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}

		function setTab(m, n) {
			var tli = document.getElementById("menu" + m).getElementsByTagName(
					"li");
			
			/* var mli = document.getElementById("main" + m).getElementsByTagName(
					"ul"); */
			for (var i = 0; i < tli.length; i++) {
				tli[i].className = i == n ? "mhover" : "";
				//mli[i].style.display = i == n ? "block" : "none";
			}
		}
	</script>
</body>
</html>
