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

<title>详细信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="详细信息">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/uploadifive/uploadifive.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">

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

	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div
					style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：首页&gt;&gt;
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
							科普知识
						</c:when>
						<c:when test="${ptype=='6'}">
							联系我们
						</c:when>
						<c:when test="${ptype=='7'}">
							图片赏析
						</c:when>
						<c:when test="${ptype=='8'}">
							保护区防护
						</c:when>
						 <c:otherwise>
                                                         其他
    					</c:otherwise>
					</c:choose>

					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<div class="panel-body">
						<c:forEach var="portal" items="${portals}">
							<p class="title1">
								<a href="/travel/visitor/show.action?id=${portal.id}">${portal.title}</a>
							</p>
							<p class="title2">
								${portal.pubdatestr}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								${portal.subtitle}</p>
							<hr
								style='height:1px;border:none;border-top:1px dashed #C2C2C2;margin:0 auto;' />
						</c:forEach>
					</div>

					<div class="panel-footer">
						<a id="firstpage" href="/travel/visitor/querypage.action?pagesize=10&pagenum=1&type=${ptype}">第一页</a> 
						<a id="lastpage"  href="/travel/visitor/querypage.action?pagesize=10&pagenum=${page.currentPage-1 }&type=${ptype}" >上一页</a> 
						<a id="nextpage" href="/travel/visitor/querypage.action?pagesize=10&pagenum=${page.currentPage+1 }&type=${ptype}" >下一页</a>
						<a id="endpage" href="/travel/visitor/querypage.action?pagesize=10&pagenum=${page.totalPage }&type=${ptype}" >最后一页</a>
						<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
					</div>
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
		var delUserid;//当前删除的用户ID
		var delrow;//要删除的行
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
				url : '/travel/user/delete.action?id='+delUserid,
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
					url : "/travel/user/add.action",
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
					url : '/travel/user/update.action',
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

		function QueryByIpidPage(isfirst) {
			var begindate = $("#begindate").val();//开始日期
			var enddate = $("#enddate").val();//终止日期
			$.ajax({
				url : 'ping/userdetail',
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					begindate : begindate,
					enddate : enddate,
					ipid : cipid,
					beginindex : rowspage * (currentpage - 1),
					rows : rowspage,
					isfirst : isfirst
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.isok == 1) {
						var rows = GetRowsFromDetail(data.info);
						$("#detaillist").html(rows);
						if (isfirst == 1) {
							rowscount = data.count;
							pagecount=Math.ceil(rowscount/rowspage);
						}
						$("#pagecount").text(currentpage + "/" + pagecount);
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
