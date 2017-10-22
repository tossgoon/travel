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
<title>用户管理</title>
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
			<span>当前位置：OA后台管理&gt;&gt;>用户管理
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
	<div  class="contentstyle">
	<div class="maincontent" >
		<div class="leftpanel" style="border-right:1px solid;">
			<ul>
				<li><a	href="<%=contextPath%>/portal/querypage.action?pagesize=10&pagenum=1&type=0">网站门户</a></li>
				<li class="activeli"><a href="javascript:void(0)">用户管理</a></li>
				<li><a href="<%=contextPath%>/oa/querynotify.action?pagesize=10&pagenum=1">通知公告</a></li>
				<li><a href="<%=contextPath%>/dept/querylist.action">部门管理</a></li>
				<li><a href="<%=contextPath%>/user/queryuinfo.action" target="_blank">个人账户管理</a></li>
			</ul>
		</div>
		<div class="rightpanel" style="border:none;">
			<div style="padding-top:10px;">
							<span style="font-size:18px;">用户管理</span>
							<input value="新增用户" onclick="InsertUser()" type="button"
								class="btn btn-primary"	style="margin-right:20px; float:right;width:90px;" />
						</div>
				<div style="height:400px;">
					<table align="center" class="table table-hover" id="userlist"
						style="width:100%;margin-top:20px;font-size:14px;">
						<tr align="center" height="26px">
							<td width="100" style="display:none">ID</td>
							<td width="160">姓名</td>
							<td width="160">登陆名</td>
							<td width="160">电话</td>
							<td width="160">部门</td>
							<td width="160">用户权限</td>
							<td  style="display:none">备注</td>
							<td width="200">操作</td>
						</tr>

						<c:forEach var="user" items="${users}">
							<tr align="center" height="24px">
								<td style="display:none;">${user.id}</td>
								<td>${user.username}</td>
								<td>${user.loginname}</td>
								<td>${user.telephone}</td>
								<td>${user.department}</td>
								<td>
								     <c:if test="${user.usertype=='0'}">普通</c:if>
								     <c:if test="${user.usertype=='1'}">数据管理</c:if>
								     <c:if test="${user.usertype=='9'}">管理员</c:if>
								</td>
								<td  style="display:none">${user.remark }</td>
								<td width="120">
								   <c:if test="${user.usertype!='9'}"><a href="javascript:void(0)" onclick="ResetUserModal(${user.id})">重置密码</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="EditUser(this)">编辑</a>&nbsp;&nbsp; <a 	href="javascript:void(0)"	onclick="DeleteUserModal(${user.id},this)">删除</a></c:if>
								   </td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div style="margin-top:10px;">
							<a id="firstpage"	href="<%=contextPath%>/user/querypage.action?pagesize=10&pagenum=1">第一页</a>
							<a id="lastpage"	href="<%=contextPath%>/user/querypage.action?pagesize=10&pagenum=${page.currentPage-1 }">上一页</a>
							<a id="nextpage"	href="<%=contextPath%>l/user/querypage.action?pagesize=10&pagenum=${page.currentPage+1 }">下一页</a>
							<a id="endpage"		href="<%=contextPath%>/user/querypage.action?pagesize=10&pagenum=${page.totalPage }">最后一页</a>
							<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
				</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>
	<div class="modal fade" id="usermodal" role="dialog"
		aria-labelledby="用户管理" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<label id="modaltitle"></label>
				</div>
				<div class="modal-body" style="height:210px;">
					<div style="width:100%;">
						<s:form method="post" role="form" theme="simple" id="formUser">

							<table style="font-size:14px;width:100%;">
								<tr style="display: none">
									<td><input type="hidden" id="userid" name="user.id">id</td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" id="username"	name="user.username"></td>

									<td style="float:right;line-height: 30px;">用户名</td>
									<td><input class="form-control" id="loginname"	name="user.loginname"></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" id="telephone"	name="user.telephone"></td>
									<td style="float:right;line-height: 30px;">部门</td>
									<td>
										<!-- <input class="form-control" id="department"	name="user.department"> -->
										<s:select class="form-control" id="department" list="deptlist" name="user.department" listKey="deptname" listValue="deptname"	label="选择部门" ></s:select>
									</td>
								</tr>
								<tr>
									<td>用户权限</td>
									<td>
									<s:select class="form-control" id="usertype"
													list="#{'0':'普通','1':'数据管理'}"
													label="选择类型" name="user.usertype"></s:select>
									</td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="3"><textarea
											style="resize: none;margin-bottom:10px;" class="form-control"
											rows="3" id="remark" name="user.remark"></textarea></td>
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
	<div class="modal fade" id="deleteModal" role="dialog"		aria-labelledby="删除用户" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:210px;width:460px;">
				<div class="modal-header">
					<label>是否删除该用户</label>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-warning"
						style="margin-left:100px;" onclick="DeleteUser()">删除用户</button>
					<button type="button" class="btn btn-default"
						style="margin-left:100px;" data-dismiss="modal">取消</button>
				</div>
				<div class="modal-footer form-horizontal">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="passwordModal" role="dialog"		aria-labelledby="重置密码" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:230px;width:460px;">
				<div class="modal-header">
					<label>是否重置该用户为以下密码：</label>
				</div>
				<div class="modal-body">
				    重置密码：<input class="form-control" id="usernewpass" value="111111">
				</div>
				<div class="modal-footer form-horizontal">
				    <button type="button" class="btn btn-success"
						style="margin-left:100px;" onclick="ResetUserPass()">重置密码</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/portal/footmodal.jsp"%>
	<script src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script	src="<%=contextPath%>/includes/js/uploadifive/jquery.uploadifive.min.js"></script>
	<script	src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		var isadd = true;
		var updaterow;//更新的行
		var delUserid;//当前删除的用户ID
		var delrow;//要删除的行
		var resetuserid;//要重置密码的用户ID
		var contextPath="<%=contextPath%>";
		$(function() {

		});
		function InsertUser() {
			isadd = true;
			$("#modaltitle").html("新增用户");
			$("#userid").val('');
			$("#username").val('');
			$("#loginname").val('');
			$("#telephone").val('');
			$("#department").val('');
			$("#usertype").val('0');
			$("#remark").val('');
			$("#loginname").attr("readonly",false);
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
			var usertype = $(updaterow).find("td").eq(5)[0].innerText;//用户类型
			var remark = $(updaterow).find("td").eq(6)[0].innerText;//备注
			$("#userid").val(userid);
			$("#username").val(username);
			$("#loginname").val(loginname);
			$("#loginname").attr("readonly",true);
			$("#telephone").val(telephone);
			$("#department").val(department);
			if(usertype=="普通"){
				$("#usertype").val('0');
			}
			else{
				$("#usertype").val('1');
			}
			$("#remark").val(remark);
			$("#modaltitle").html("编辑用户");
			$("#usermodal").modal("show");
		}
		function DeleteUserModal(userid,a)
		{
			delUserid=userid;
			delrow = $(a).parent().parent();//删除用户所在行
			$("#deleteModal").modal("show");
		}
		function DeleteUser()
		{
			$.ajax({
				url : contextPath+'/user/delete.action?id='+delUserid,
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
		//重置用户密码
		function ResetUserModal(userid)
		{
			resetuserid=userid;
			$("#passwordModal").modal("show");
		}
		function ResetUserPass()
		{
			$.ajax({
				url : contextPath+'/user/resetpass.action?userid='+resetuserid,
				type : 'POST',
				// 提交数据给Action传入数据
				data : {newpass:$("#usernewpass").val()},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.errorMsg == "0") {
						//删除用户
						$("#passwordModal").modal("hide");
						alert("更新完成。");
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

		function SaveUser() {
			if (isadd == true) {
				$.ajax({
					type : "post",
					url : contextPath+"/user/add.action",
					data : $("#formUser").serialize(),
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.errorMsg == "0") {
							//新增用户
							var newrow=GetNewUserRow(data.user);
							$('#userlist').append(newrow);
							$("#usermodal").modal("hide");
						}
						else if (data.errorMsg == "1") {
							//新增用户
							alert("用户名已存在。");
						}
						else{
							alert(data.errorMsg);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
			} else {
				$.ajax({
					url : contextPath+'/user/update.action',
					type : 'POST',
					// 提交数据给Action传入数据
					data : $("#formUser").serialize(),
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errorMsg == "0") {
							//新增用户
							var user=data.user;
							$(updaterow).find("td").eq(1).html(user.username);
							$(updaterow).find("td").eq(2).html(user.loginname);
							$(updaterow).find("td").eq(3).html(user.telephone);
							$(updaterow).find("td").eq(4).html(user.department);
							if(user.usertype=="0"){
								$(updaterow).find("td").eq(5).html("普通");
							}
							else{
								$(updaterow).find("td").eq(5).html("数据管理");
							}
							$(updaterow).find("td").eq(6).html(user.remark);
							$("#usermodal").modal("hide");
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
		}
		function GetNewUserRow(user) {
			var usertype="";
			if(user.usertype=="0"){
				usertype="<td>普通</td>";
			}
			else{
				usertype="<td>数据管理</td>";
			}
			var newRow = "<tr style='text-align:center;'><td style='display:none;'>" + user.id + "</td>"
					+ "<td>" + user.username + "</td>" + "<td>"
					+ user.loginname + "</td>" + "<td>" + user.telephone
					+ "</td>" + "<td>" + user.department
					+ "</td>" +usertype+ "<td  style='display:none;'>" + user.remark + "</td>"
					+ "<td>  <a href='javascript:void(0)' onclick='ResetUserModal("+user.id+")'>重置密码</a>&nbsp;&nbsp;&nbsp;   <a href='javascript:void(0)' onclick='EditUser(this)'>编辑</a>&nbsp;&nbsp;&nbsp;"
					+ "<a href='javascript:void(0)' onclick=DeleteUserModal("+user.id+",this)>删除</a>" + "</td></tr>";
			return newRow;
		}
		function QueryUser(pageindex) {
			//1.代表第一页
			//2.代表上一页
			//3.代表下一页
			//4.代表最后一页
			if (pageindex == 1) {
				currentpage = 1;
			} else if (pageindex == 2) {
				if (currentpage == 1) {
					return;
				}
				currentpage = currentpage - 1;
			} else if (pageindex == 3) {
				if (currentpage == pagecount) {
					return;
				}
				currentpage = currentpage + 1;

			} else if (pageindex == 4) {
				if (currentpage == pagecount) {
					return;
				}
				currentpage = pagecount;
			}
			QueryUserByPage(0);
		}

	</script>
</body>
</html>
