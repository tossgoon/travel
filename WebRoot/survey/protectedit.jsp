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
<title>保护区巡护记录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="部门编辑">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	float: right;
}

body {
	background-color: #f2f2f2;
}

#formAnimal span {
	float: right;
}

.row {
	margin-top: 4px;
	margin-bottom: 4px;
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
					<span>当前位置：OA管理&gt;&gt; 保护区巡护记录   </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<!-- <div class="panel-heading">OA管理：动物状况监测信息编辑 </div> -->
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formAnimal"  style="width:100%;margin:0 auto;">
								<div class="container" style="width:800px;">
										<div class="row">
											<div class="col-md-2">
												<span>ID</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" id="id" name="protect.id" readonly="true"></s:textfield>
											</div>
											<div class="col-md-2"><span>保护站名称</span></div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="protect.baohuzhanmingcheng"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>记录人</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="protect.jiluren"></s:textfield>
											</div>
											<div class="col-md-2"><span>巡护日期</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.xunhuriqi"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>时间</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.shijian"></s:textfield>
											</div>
											<div class="col-md-2"><span>天气</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.tianqi"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>大地名</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.dadiming"></s:textfield>
											</div>
											<div class="col-md-2"><span>巡护人员</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.xunhurenyuan"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>东至</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.dongzhi"></s:textfield>
											</div>
											<div class="col-md-2"><span>西至</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.xizhi"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>南至</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.nanzhi"></s:textfield>
											</div>
											<div class="col-md-2"><span>北至</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.beizhi"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>动物名称</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.dongwumingcheng"></s:textfield>
											</div>
											<div class="col-md-2"><span>数量</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.shuliang"></s:textfield>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-2">
												<span>经度(*)</span>
											</div>
											<div class="col-md-4">
												<s:textfield id="jingdu" class="form-control input-sm"  name="protect.jingdu"></s:textfield>
											</div>
											<div class="col-md-2"><span>纬度(*)</span></div>
											<div class="col-md-4">
												<s:textfield id="weidu" class="form-control input-sm" name="protect.weidu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>海拔(*)</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.haiba"></s:textfield>
											</div>
											<div class="col-md-2"><span>生境类型</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="protect.shengjingleixing"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>人为活动类型</span>
											</div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.renweihuodongleixing">
											</div>
											<div class="col-md-2"><span>干扰描述</span></div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.ganraomiaoshu">
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>干扰经度</span>
											</div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.ganraomiaoshu">
											</div>
											<div class="col-md-2"><span>干扰纬度</span></div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.ganraoweidu">
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>干扰海拔</span>
											</div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.ganraohaiba">
											</div>
											<div class="col-md-2"><span>干扰生境类型</span></div>
											<div class="col-md-4">
												<input  class="form-control input-sm" name="protect.ganraoshengjingleixing">
											</div>
										</div>
										<div class="row">
										     <div class="col-md-12" style="padding-top:15px;">
												<label>带*为数字。其中经度、纬度为必填项。</label>
											</div>
										</div>
									</div>
						</s:form>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<a href="/travel/survey/protectedit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveAnimal()">保存数据</button>
						<button type="button"  id="btndel" onclick="DeleteAnimal()" class="btn btn-warning">删除数据</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		function SaveAnimal() {
			if($("#jingdu").val()==null||$("#jingdu").val()==""){
				alert("经度不能为空");
				return;
			}
			if($("#weidu").val()==null||$("#weidu").val()==""){
				alert("纬度不能为空");
				return;
			}
			//获取oafiles
			$.ajax({
				type : "post",
				url : "/travel/survey/saveprotect.action",
				data :  $("#formAnimal").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#id").val(data.protect.id);
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
		function DeleteAnimal() {
			if ($("#id").val() != null && $("#id").val() != "") {
				$.ajax({
					url : '/travel/survey/deleteprotect.action?id=' + $("#id").val(),
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errormsg == "0") {
							//删除oa
							$("input").val('');
							alert("删除完成");
						} else {
							alert(data.errormsg);
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
