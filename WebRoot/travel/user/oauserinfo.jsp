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

<title>OA系统-个人信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="OA系统">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
</head>
<style type="text/css">
body{
	background-color: #f2f2f2;
}
td{
text-align:center;
}
th{
text-align:center;
}
 tr td:first-child span {
	 float: right;
}
.inputstyle{
width:360px;float:left;
}
</style>
<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统>>个人信息
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li><a href="<%=contextPath%>/oa/querynotifysend.action?pagesize=7&pagenum=1">公告通知</a></li>
					<li><a href="<%=contextPath%>/oa/querysend.action">发文管理</a></li>
					<li><a href="<%=contextPath%>/oa/queryreceive.action">收文管理</a></li>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=1">网络硬盘</a></li>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=2">巡护图片</a></li>
<%-- 					<li><a href="<%=contextPath%>/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
					<li><a href="<%=contextPath%>/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/animalsuredit.jsp" target="_blank">野生动物监测状况 </a></li>
					<li><a href="<%=contextPath%>/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
					<li><a href="<%=contextPath%>/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="<%=contextPath%>/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li> --%>
					<li><a href="<%=contextPath%>/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li class="activeli"><a href="javascript:void(0)">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <h3>个人信息</h3>
			   <hr>
			   <s:form role="form" theme="simple" id="formPortalInfo" action="updateinfo"  namespace="/user" >
				<table style="width:80%;text-align:center;border-collapse:separate; border-spacing:0px 10px;" >
					<tbody>
						<tr>
							<td style="width:120px;"><span>姓名</span></td>
							<td><s:textfield class="form-control inputstyle"  id="username"
									name="user.username" readonly="true"></s:textfield>
									<s:hidden id="userid" name="user.id"></s:hidden>
									</td>
						</tr>
						<tr>
							<td style="width:120px;"><span>登陆名</span></td>
							<td><s:textfield class="form-control inputstyle" id="loginname"
									name="user.loginname" readonly="true"></s:textfield></td>
						</tr>
						<tr>
							<td><span>部门</span></td>
							<td><s:textfield class="form-control inputstyle" id="department" readonly="true"
									name="user.department"></s:textfield></td>
						</tr>
						<tr>
							<td><span>生日</span></td>
							<td>
							<div class="input-group date form_date"	data-date-format="yyyy-mm-dd" style="width:360px;">
															<s:textfield class="form-control"  name="user.birthday"  id="birthday">
															</s:textfield>
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
									</td>
						</tr>
						<tr>
							<td><span>电话</span></td>
							<td><s:textfield class="form-control inputstyle" id="telphone"
									name="user.telephone"></s:textfield></td>
						</tr>
						<tr>
							<td><span>备注</span></td>
							<td><s:textfield class="form-control inputstyle" id="remark"
									name="user.remark"></s:textfield></td>
						</tr>
						<tr>
						<td></td>
						<td> 
						
						<div> <input type="submit" value="保存信息" class="btn btn-primary">    <a class="btn btn-success" style="margin-left:20px;" onclick="ShowpassModal()" href="javascript:void(0)">修改密码</a></div>
						
						  </td>
						
						</tr>
					</tbody>
				</table>
				</s:form>
				
			</div>
			<div style="clear:both;"></div>
			
		</div>
		
	</div>
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
<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
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
			url : '<%=contextPath%>/user/updatepass.action',
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
	</script>
</body>
</html>
