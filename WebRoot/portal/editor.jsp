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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=contextPath%>includes/css/portal_head_modal.css">
<style type="text/css">
#portolinfo span {
	float: right;
}
</style>
</head>
<body>
	<%@ include file="headmodal.jsp"%>
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin-top:30px;">网站编辑：新增内容</label>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">新增内容</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formPortalInfo">
							<table id="portolinfo"
								style="width:700px;margin:0 auto;border-collapse:separate; border-spacing:0px 10px;">
								<tbody>
									<tr>
										<td><span>ID</span></td>
										<td><input class="form-control" name="portal.id"></td>
									</tr>
									<tr>
										<td><span>选择类型</span></td>
										<td><s:select class="form-control" style="width:200px;"
												list="{'工作动态','政策法规','政务公开','科普知识','志愿者之家'}" label="选择类型"
												name="portal.type"></s:select></td>
									</tr>

									<tr>
										<td><span>主标题</span></td>
										<td><s:textfield class="form-control" name="portal.title"></s:textfield></td>
									</tr>
									<tr>
										<td><span>副标题</span></td>
										<td><s:textfield class="form-control"
												name="portal.subtitle"></s:textfield></td>
									</tr>
									<tr>
										<td><span>子标题</span></td>
										<td><s:textfield class="form-control"
												name="portal.foottitle"></s:textfield></td>
									</tr>
								</tbody>
							</table>
						</s:form>
						<script id="editor" type="text/plain"
							style="width:900px;height:600px;margin:0 auto;"></script>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<button type="button" class="btn btn-primary"
							onclick="SavePortal()">保存数据</button>
						<button type="button" style="margin-left:10px;margin-right:10px;"
							class="btn btn-success" onclick="PublishPortal()">发布数据</button>
						<button type="button" class="btn btn-warning" onclick="DeletePortal()">删除数据</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<%@ include file="footmodal.jsp"%>

	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/ueditor.config.js">
		
	</script>
	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/ueditor.all.min.js">
		
	</script>
	<script type="text/javascript" charset="utf-8"
		src="<%=contextPath%>includes/js/ueditor/lang/zh-cn/zh-cn.js">
		
	</script>

	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor');
		
		//保存数据
		function SavePortal()
		{
			$.ajax({
				type : "post",
				url : "/travel/portal/save.action",
				data : $("#formPortalInfo").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
					if (data.errorMsg == "0") {
						//新增用户
						alert("保存成功");
					} else {
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