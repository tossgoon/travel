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
<title>褐马鸡野外种群状况监测</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="褐马鸡野外种群状况监测">
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
					<span>当前位置：OA管理&gt;&gt; 褐马鸡野外种群状况监测    </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<!-- <div class="panel-heading">OA管理：动物状况监测信息编辑 </div> -->
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formAnimal" action="saveanimal" namespace="/survey" style="width:100%;margin:0 auto;">
								<div class="container" style="width:800px;">
										<div class="row">
											<div class="col-md-2">
												<span>ID</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" id="id" name="chick.id" readonly="true"></s:textfield>
											</div>
											<div class="col-md-2"><span>保护区</span></div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="chick.baohuqu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>保护站</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="chick.baohuzhan"></s:textfield>
											</div>
											<div class="col-md-2"><span>小地名</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.xiaodiming"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>天气</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.tianqi"></s:textfield>
											</div>
											<div class="col-md-2"><span>填表时间</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.tianbiaoshijian"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>监测人</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.jianceren"></s:textfield>
											</div>
											<div class="col-md-2"><span>样线号</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.yangxianhao"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>记录号</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.jiluhao"></s:textfield>
											</div>
											<div class="col-md-2"><span>实体数量(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.shitishuliang"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>实体行为</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.shitixingwei"></s:textfield>
											</div>
											<div class="col-md-2"><span>实体年龄(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.shitinianling"></s:textfield>
											</div>
										</div>
										
										<div class="row">
										<div class="col-md-2">
												<span>生境类型</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.shengjingleixing"></s:textfield>
											</div>
											
											<div class="col-md-2"><span>尸体数量(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.bodyshuliang"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>尸体简述</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.bodyjianshu"></s:textfield>
											</div>
											<div class="col-md-2"><span>粪便数量</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.fenbianshuliang"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>坡位</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.powei"></s:textfield>
											</div>
											<div class="col-md-2"><span>坡度</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.podu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>坡向</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.poxiang"></s:textfield>
											</div>
											<div class="col-md-2"><span>海拔高度(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.haibagaodu"></s:textfield>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-2">
												<span>经度(*)</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" id="jingdu" name="chick.jingdu"></s:textfield>
											</div>
											<div class="col-md-2"><span>纬度(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" id="weidu" name="chick.weidu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2"><span>备注</span></div>
											<div class="col-md-10">
												<s:textfield  class="form-control input-sm" name="chick.beizhu"></s:textfield>
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
						<a href="/travel/survey/chickedit.jsp" class="btn btn-default">新增数据</a>
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
		var receiverids="";
		var receivernames="";
		function SelectAll() {
			$("#tbuser").find("input[type='checkbox']").prop("checked",true);
		}
		function ReSelect() {
			$("#tbuser").find("input[type='checkbox']").each(function(){
				if($(this).is(":checked")){
					$(this).prop("checked",false);
				}
				else{
					$(this).prop("checked",true);
				}
			});
		}
		
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
				url : "/travel/survey/savechick.action",
				data :  $("#formAnimal").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#id").val(data.chick.id);
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
					url : '/travel/survey/deletechick.action?id=' + $("#id").val(),
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
