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

<title>通知公告管理</title>

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
th{
 text-align:center;
}

</style>
</head>

<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
    <div class="toptool">
			<span>当前位置：OA后台管理>>通知公告
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
	<div  class="contentstyle">

	<div class="maincontent" >
		<div class="leftpanel">
			<ul>
				<li><a href="<%=contextPath%>/portal/querypage.action?pagesize=10&pagenum=1&type=0" target="_blank">网站门户</a></li>
				<li><a href="<%=contextPath%>/user/querypage.action">用户管理</a></li>
				<li  class="activeli"><a href="javascript:void(0)">通知公告</a></li>
				<li><a href="<%=contextPath%>/dept/querylist.action">部门管理</a></li>
				<li><a href="<%=contextPath%>/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
				<li><a href="<%=contextPath%>/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
				<li><a href="<%=contextPath%>/survey/animalsuredit.jsp">野生动物监测状况</a></li>
				<li><a href="<%=contextPath%>/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
				<li><a href="<%=contextPath%>/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
				<li><a href="<%=contextPath%>/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
				<li><a href="<%=contextPath%>/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
			</ul>
		</div>
		<div class="rightpanel" style="height:500px;">
			            <div style="margin:10px;">
							<span style="font-size:18px;">通知公告管理</span>
							<a href="<%=contextPath%>/oaadmin/notifyedit.jsp" type="button" class="btn btn-primary" style="margin-right:20px; float:right;width:90px;" >新增数据</a>
						</div>
						<div style="height:400px;">
						  <table align="center" class="table table-hover" id="notifylist"
							style="width:100%;text-align:center;" style="margin-top:20px;">
							<thead>
							<tr height="26px">
								<th width="100" style="display:none;">ID</th>
								<th style="text-align:center;" width="260">标题</th>
								<th width="160">发布日期</th>
								<th width="80">状态</th>
								<th width="90">操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="notify" items="${notifyList}">
								<tr align="center" height="24px">
									<td  style="display:none;">${notify.id}</td>
									<td>${notify.title}</td>
									<td>${notify.pubdatestr}</td>
									<td><c:if test="${notify.status!=true}">
											未发布
										</c:if> <c:if test="${notify.status==true}">
											已发布
										</c:if>
									</td>
									<td>
									    <%-- <c:if test="${notify.status!=true}"> --%>
											<a href="<%=contextPath%>/oa/modifynotify.action?id=${notify.id}"
												style="margin-right:10px;">更改</a>
											<a href="javascript:void(0)"
												onclick="DeleteOa(${notify.id},this)">删除</a>
										<%-- </c:if> --%>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						</div>
						<div style="margin-top:10px;">
							<a id="firstpage"	href="<%=contextPath%>/notify/querypage.action?pagesize=10&pagenum=1">第一页</a>
							<a id="lastpage"	href="<%=contextPath%>/notify/querypage.action?pagesize=10&pagenum=${page.currentPage-1 }">上一页</a>
							<a id="nextpage"	href="<%=contextPath%>/notify/querypage.action?pagesize=10&pagenum=${page.currentPage+1 }">下一页</a>
							<a id="endpage"		href="<%=contextPath%>/notify/querypage.action?pagesize=10&pagenum=${page.totalPage }">最后一页</a>
							<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
						</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div class="modal fade" id="usermodal" role="dialog"
		aria-labelledby="部门管理" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<label id="modaltitle"></label>
				</div>
				<div class="modal-body" style="height:170px;">
					<div style="width:100%;">
						<s:form method="post" role="form" theme="simple" id="formUser">
							<table style="font-size:14px;width:100%;">
								<tr style="display: none">
									<td><input type="hidden" id="userid" name="user.id">
										id</td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" id="username"
										name="user.username"></td>

									<td style="float:right;line-height: 30px;">用户名</td>
									<td><input class="form-control" id="loginname"
										name="user.loginname"></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" id="telephone"
										name="user.telephone"></td>
									<td style="float:right;line-height: 30px;">部门</td>
									<td><input class="form-control" id="department"
										name="user.department"></td>
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

	<div class="modal fade" id="deleteModal" role="dialog"
		aria-labelledby="删除用户" data-backdrop="static">
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
			var remark = $(updaterow).find("td").eq(5)[0].innerText;//备注
			$("#userid").val(userid);
			$("#username").val(username);
			$("#loginname").val(loginname);
			$("#loginname").attr("readonly",true);
			$("#telephone").val(telephone);
			$("#department").val(department);
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
							$(updaterow).find("td").eq(5).html(user.remark);
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
			var newRow = "<tr align='center'><td>" + user.id + "</td>"
					+ "<td>" + user.username + "</td>" + "<td>"
					+ user.loginname + "</td>" + "<td>" + user.telephone
					+ "</td>" + "<td>" + user.department
					+ "</td>" + "<td>" + user.remark + "</td>"
					+ "<td><a href='javascript:void(0)' onclick='EditUser(this)'>编辑</a>&nbsp;&nbsp;&nbsp;"
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
