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

<title>内容管理</title>

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
<link rel="stylesheet"
	href="<%=contextPath%>includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>includes/css/portaltab.css">
</head>
<body>
	<%@ include file="headmodal.jsp"%>
	<div
		style="width:100%;margin:0 auto;text-align:center;margin-top:20px;">
		<div class="panel panel-default" style="width:1024px;margin:0 auto;">
			<div class="panel-heading" style="text-align:left;">
				<span>后台管理：<a href="/travel/user/querypage.action">用户管理&nbsp;&nbsp;</a>
					/&nbsp;&nbsp; 网站管理
				</span>
			</div>
			<div class="panel-body" style="height:500px;margin:0 auto;text-align:center;">
				<div style="margin-top:20px;width:1024px;">
					<span style="font-size:18px;">网站管理</span>
				</div>
				<div style="width:1024px;margin:0 auto;margin-top:20px;text-align:left;">
					<div class="menu1box">
						<ul id="menu1">
							<li <c:if test="${ptype=='0'}"> class= "hover" </c:if> ><a	href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=0">保护区介绍</a></li>
							<li <c:if test="${ptype=='1'}"> class= "hover" </c:if> ><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=1">工作动态</a></li>
							<li <c:if test="${ptype=='2'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=2">政策法规</a></li>
							<li <c:if test="${ptype=='3'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=3">政务公开</a></li>
							<li <c:if test="${ptype=='8'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=8">保护区防护</a></li>
							<li <c:if test="${ptype=='4'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=4">志愿者之家</a></li>
							<li <c:if test="${ptype=='5'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=5">科普知识</a></li>
							<li <c:if test="${ptype=='6'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=6">联系我们</a></li>
							<li <c:if test="${ptype=='7'}"> class= "hover" </c:if>><a href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=7">图片赏析</a></li>
						</ul>
					</div>

					<div style="width:1024px;padding-top:15px;margin:0 auto;text-align:center;">
						<table style="width:90%;" class="table table-hover">
							<tr  align="center" style="font-weight:bold;" height="26px">
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
									<td align="center" width="15%"> <a href="javascript:void(0)"	onclick="window.location.href='/travel/portal/query.action?id=${portal.id}'">编辑</a>&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="DeletePoralDlg(${portal.id},this)">删除</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a id="firstpage" href="/travel/portal/querypage.action?pagesize=10&pagenum=1&type=${ptype}">第一页</a>
				<a id="lastpage" href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.currentPage-1 }&type=${ptype}">上一页</a>
				<a id="nextpage" href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.currentPage+1 }&type=${ptype}">下一页</a>
				<a id="endpage"	href="/travel/portal/querypage.action?pagesize=10&pagenum=${page.totalPage }&type=${ptype}">最后一页</a>
				<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
				<a class="btn btn-success" style="margin-left:50px;" href="/travel/portal/editor.jsp">新增数据</a>
			</div>
		</div>
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

	<%@ include file="footmodal.jsp"%>
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
				tli[i].className = i == n ? "hover" : "";
				//mli[i].style.display = i == n ? "block" : "none";
			}
		}
	</script>
</body>
</html>
