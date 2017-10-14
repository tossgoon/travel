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

<title>部门编辑</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="部门编辑">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	 float: right;
}
body{
background-color:#f2f2f2;
}
</style>
</head>

<body>
    <%@ include file="/oaadmin/oahead.jsp"%>
    <div class="contentstyle">
	<div class="container" style="width:1056px;background-color:#ffffff;margin:0 auto;margin-bottom:10px;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：OA后台管理&gt;&gt; 部门编辑    </span>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<div class="panel-heading">OA管理：部门编辑</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formOa" action="save" namespace="/dept" style="width:100%;margin:0 auto;">
							<table id="oainfo"	style="border-collapse:separate; border-spacing:0px 10px;margin:0 auto;">
								<tr>
									<td><span>ID</span></td>
									<td colspan="3"><s:textfield class="form-control"
											id="deptid" name="dept.id"   readonly="true"></s:textfield></td>
								</tr>
								<tr>
									<td><span>名称</span></td>
									<td colspan="3"><s:textfield class="form-control"
											id="deptname" name="dept.deptname"></s:textfield></td>
								</tr>		
								<tr>
									<td valign="top"><span>备注</span></td>
									<td colspan="3"><s:textarea class="form-control"
											style="resize: none;margin-bottom:10px;width:800px;"
											rows="10" id="deptremark" name="dept.remark"></s:textarea></td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<a href="/travel/dept/deptedit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveDept()">保存数据</button>
						<button type="button" id="btndel" class="btn btn-warning"	onclick="DeleteDept()">删除数据</button>
					</div>
				</div>
				<div style="clear:both;height:20px;"></div>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
	    var  contextPath="<%=contextPath%>";
		function SaveDept() {
			//获取oafiles
			$.ajax({
				type : "post",
				url : contextPath+"/dept/save.action",
				data : {
					"dept.id" : $("#deptid").val(),
					"dept.deptname" : $("#deptname").val(),
					//"dept.funtion" : $("#deptfuntion").val(),
					"dept.remark" : $("#deptremark").val()
				},
				//$("#formOa").serialize(), 
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#deptid").val(data.dept.id);
						alert("保存成功");
					} else {
						alert(data.errormsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
		function DeleteDept() {
			if ($("#deptid").val() != null && $("#deptid").val() != "") {
				$.ajax({
					url : contextPath+'/dept/delete.action?id=' + $("#deptid").val(),
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errormsg == "0") {
							//删除oa
							$("#deptid").val('');
							$("#deptname").val('');
							$("#deptremark").val('');
							alert("删除完成");
						} else {
							alert(data.errorMsg);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
			}
		}
		
	</script>
</body>
</html>
