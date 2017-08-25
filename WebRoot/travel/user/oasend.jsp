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

<title>我的发送</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="我的发送">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	 float: right;
}
body{
background-color: rgb(226, 252, 231);
}
</style>
</head>

<body>
   <%@ include file="/portal/headmodal.jsp"%>
	<div class="container" style="width:1024px;margin:0 auto;background-color:#ffffff;margin-top:20px;">
		
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:100%;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：OA管理>>我的工作箱>>我的发送/&nbsp;&nbsp;<a href="/travel/oa/queryreceive.action">我的事务</a>
					  </span>
					   <span style="float:right;"><a href="javascript:void(0)" onclick="ShowpassModal()">修改密码</a></span>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin:30px;">用户工作箱：我的发送</label>
			</div>
		</div>
		<div class="row" >
		
		<div class="col-md-12" style="text-align:center;">
		
			<div class="panel panel-default">
				<div class="panel-body">
					
						<s:form action="querysend" namespace="/oa" class="form-inline"
							method="post" theme="simple">
							<span style="float:left;margin-left:30px;margin-top:5px;">标题：</span>
							<div class="input-group"
								style="width:360px;float:left;margin-bottom:20px;">
								<input class="form-control" type="text" name="queryText"
									value="${searchText}" /> <span class="input-group-btn">
									<input type="submit" class="btn btn-default" value="查询" />
								</span>
							</div>
							<!-- /input-group -->
							<div style="margin-left:5px;float:left;margin-left:20px;">
								<a href="/travel/travel/user/useroa.jsp" type="button"
									class="btn btn-primary">新增</a>
							</div>
						</s:form>

						<table align="center" class="table" cellpadding="0" cellspacing="0"
							 id="userlist"
							style="margin-top:20px;clear:both;width:100%;">
							<tr align="center"  height="26px">
								<td width="50">ID</td>
								<td width="260">标题</td>
								<td width="100">发布日期</td>
								<td width="100">状态</td>
								<td width="100">操作</td>
							</tr>

							<c:forEach var="oa" items="${oasendlist}">
								<tr align="center" height="24px" style="font-size:14px;">
									<td>${oa.id}</td>
									<td>${oa.title}</td>
									<td>${oa.pubdatestr}</td>
									<td><c:if test="${oa.status!=true}">
											未发布
										</c:if> <c:if test="${oa.status==true}">
											已发布
										</c:if></td>
									<td><c:if test="${oa.status!=true}">
											<a href="/travel/oa/modify.action?id=${oa.id}"
												style="margin-right:10px;">更改</a>
											<a href="javascript:void(0)"
												onclick="DeleteOa(${oa.id},this)">删除</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<div class="modal fade" id="userinfo" role="dialog" aria-labelledby="修改密码" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="width:460px;">
			    <div class="panel-heading">修改密码</div>
				<div class="modal-body">
					<table style="font-size:14px;width:100%;">
						<tr>
							<td>输入旧密码：</td>
							<td><input class="form-control" id="oldpassword" type="password"></td>
						</tr>
						<tr>
							<td>输入新密码：</td>
							<td><input class="form-control" id="password1" type="password"></td>
						</tr>
						<tr>
							<td>输入新密码2：</td>
							<td><input class="form-control" id="password2" type="password"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer form-horizontal">
				    <button type="button" class="btn btn-success" onclick="SavePassword()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
	//弹出修改密码对话框
	function ShowpassModal(){
		//弹出修改密码对话框
		$("#userinfo").modal("show");
	}
	function SavePassword(){
		var oldpassword=$("#oldpassword").val();//旧密码
		var password1=$("#password1").val();//新密码1
		var password2=$("#password2").val();//新密码2
		
		if(password1==null||password1==undefined||password1==""){
			alert("新密码为空");
			return;
		}
		if(password1!=password2){
			alert("两次密码不一致");
			return;
		}
		$.ajax({
			url : '/travel/user/updatepass.action',
			type : 'POST',
			// 提交数据给Action传入数据
			data : {oldpass:oldpassword,
				    newpass:password1},
			// 返回的数据类型
			dataType : 'json',
			// 成功是调用的方法
			success : function(data) {
				if (data.errorMsg == "0") {
					//删除用户
					alert("更改完成。");
					$("#userinfo").modal("hide");
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
