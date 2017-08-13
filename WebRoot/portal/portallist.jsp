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

<title>内容管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="内容管理">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/uploadifive/uploadifive.css" />
</head>

<body>
	<s:form action="query" namespace="/portal" method="post">
		<table align="center">
			<tr>
				<td style="vertical-align: middle;">查询：
				   <input type="text"	style="width: 300px;height: 30px;font-size: 16px" name="queryText"	value="${searchText}" />
				   <input type="submit" value="查询"	style="width: 100px;height: 30px;font-size: 16px" />
				   <input type="button" value="新增"  style="width: 100px;height: 30px;font-size: 16px"	onclick="window.location.href='/travel/portal/editor.jsp'" />
				</td>
			</tr>
		</table>
		<%-- <s:submit value="submit" /> --%>
	</s:form>

	<table align="center" border="1" cellpadding="0" cellspacing="0"
		bordercolor="#3366cc"  id="userlist">
		<tr align="center" bgcolor="#3399cc" height="26px">
			<td width="80">ID</td>
			<td width="200">标题</td>
			<td width="80">类型</td>
			<td width="120">时间</td>
			<td width="120">操作</td>
		</tr>

		<c:forEach var="portal" items="${portals}">
			<tr align="center" height="24px">
				<td>${portal.id}</td>
				<td>${portal.title}</td>
				<td>
				     <c:choose>
						<c:when test="${portal.type=='0'}">
							保护区介绍
						</c:when>
						<c:when test="${portal.type=='1'}">
							工作动态
						</c:when>
						<c:when test="${portal.type=='2'}">
							政策法规
						</c:when>
						<c:when test="${portal.type=='3'}">
							政务公开
						</c:when>
						<c:when test="${portal.type=='4'}">
							志愿者之家
						</c:when>
						<c:when test="${portal.type=='5'}">
							科普知识
						</c:when>
						<c:when test="${portal.type=='6'}">
							联系我们
						</c:when>
						<c:when test="${portal.type=='7'}">
							图片赏析
						</c:when>
						<c:otherwise>
							其他
						</c:otherwise>
					</c:choose> 
				</td>
				<td>${portal.pubdate }</td>
				<td width="120"><a
					href="javascript:void(0)" onclick="window.location.href='/travel/portal/query.action?id=${portal.id}'">编辑</a>&nbsp;&nbsp; <a
					href="javascript:void(0)" onclick="DeletePoral(${portal.id},this)">删除</a></td>
			</tr>
		</c:forEach>
	</table>

	<div class="modal fade" id="usermodal" role="dialog"
		aria-labelledby="用户管理" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<label id="modaltitle"></label>
				</div>
				<div class="modal-body" style="height:170px;">
					<div style="width:100%;">

						<s:form method="post"
							role="form" theme="simple" id="formUser">

							<table style="font-size:14px;width:100%;">
								<tr style="display: none">
									<td><input type="hidden" id="userid" name="user.id"> id</td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" id="username" name="user.username"></td>
									<td style="float:right;line-height: 30px;">用户名</td>
									<td><input class="form-control" id="loginname" name="user.loginname"></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" id="telephone" name="user.telephone"></td>
								    <td style="float:right;line-height: 30px;">部门</td>
									<td><input class="form-control" id="department" name="user.department"></td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="3"><textarea style="resize: none;margin-bottom:10px;" class="form-control" rows="3" id="remark" name="user.remark"></textarea></td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
				<div class="modal-footer form-horizontal">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="SaveUser()">保存</button>
				</div>
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


	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=contextPath%>includes/js/uploadifive/jquery.uploadifive.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		var isadd = true;
		var updaterow;//更新的行
		var delPortalid;//当前删除的用户ID
		var delrow;//要删除的行
		$(function() {

		});
		function InsertUser() {
			isadd = true;
			$("#modaltitle").html("新增用户");
			$("#usermodal").modal("show");
		}
		function EditUser(a) {
			isadd = false;
			updaterow = $(a).parent().parent();//$("#table1 tr:first td:first").find("input").val()
			var userid = $(updaterow).find("td").eq(0)[0].innerText;//id
			var username = $(updaterow).find("td").eq(1)[0].innerText;//姓名
			var loginname = $(updaterow).find("td").eq(2)[0].innerText;//用户名
			var telephone = $(updaterow).find("td").eq(3)[0].innerText;//电话
			var department = $(updaterow).find("td").eq(4)[0].innerText;//部门
			var remark = $(updaterow).find("td").eq(5)[0].innerText;//备注
			$("#userid").val(userid);
			$("#username").val(username);
			$("#loginname").val(loginname);
			$("#telephone").val(telephone);
			$("#department").val(department);
			$("#remark").val(remark);
			$("#modaltitle").html("编辑用户");
			$("#usermodal").modal("show");
		}
		function DeletePoral(portalid,a)
		{
			delPortalid=portalid;
			delrow = $(a).parent().parent();//删除用户所在行
			$("#deleteModal").modal("show");
		}
		function DeletePortal()
		{
			$.ajax({
				url : '/travel/portal/delete.action?id='+delPortalid,
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
					}
					else{
						alert(data.errorMsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
	</script>
</body>
</html>
