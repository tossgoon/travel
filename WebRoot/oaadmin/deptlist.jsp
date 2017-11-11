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

<title>部门管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="用户管理">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/uploadifive/uploadifive.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
<style type="text/css">
body{
	background-color: #F2F2F2;
}
</style>
</head>

<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
    <div class="toptool">
			<span>当前位置：OA后台管理  &gt;&gt;部门管理
			</span> 
			<a style="float:right;margin-right:60px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
	<div class="contentstyle">
	<div class="maincontent" >
		<div class="leftpanel">
			<ul>
				<li><a href="<%=contextPath%>/portal/querypage.action?pagesize=10&pagenum=1&type=0" target="_blank">网站门户</a></li>
				<li><a href="<%=contextPath%>/user/querypage.action">用户管理</a></li>
				<%-- <li><a href="<%=contextPath%>/oa/querynotify.action?pagesize=10&pagenum=1">通知公告</a></li> --%>
				<li   class="activeli"><a href="javascript:void(0)">部门管理</a></li>
				<li><a href="<%=contextPath%>/user/queryuinfo.action">个人账户管理</a></li>
			</ul>
		</div>
		<div class="rightpanel">
			<div style="margin:20px;">
							<span style="font-size:18px;">部门管理</span>
							<a href="<%=contextPath%>/dept/deptedit.jsp" class="btn btn-primary" style="margin-right:20px; float:right;width:90px;">新增部门</a>
						</div>
			<div>
			<div style="min-height:400px;">
			<table align="center" class="table table-hover" id=tbdeptlist
							style="width:100%;" style="margin-top:20px;">
							<tr align="center" height="26px">
								<td width="100">ID</td>
								<td width="160">部门名称</td>
								<td width="160">操作</td>
							</tr>

							<c:forEach var="dept" items="${deptlist}">
								<tr align="center" height="24px">
									<td>${dept.id}</td>
									<td>${dept.deptname}</td>
									<td width="120">
										<a href="<%=contextPath%>/dept/query.action?id=${dept.id}">编辑/查看</a>&nbsp;&nbsp; 
									</td>
								</tr>
							</c:forEach>
						</table>
						</div>
						</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>

	<div class="modal fade" id="deleteModal" role="dialog"
		aria-labelledby="删除用户" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:210px;width:460px;">
				<div class="modal-header">
					<label>是否删除该部门</label>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-warning"
						style="margin-left:100px;" onclick="DeleteDept()">删除部门</button>
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
	<script type="text/javascript">
		
	</script>
</body>
</html>
