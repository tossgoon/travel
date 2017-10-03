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
<title>动物状况监测编辑</title>
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

#formAnimal .col-md-2 span {
	float: right;
}

.row {
	margin-top: 12px;
	margin-bottom: 12px;
}
</style>
</head>

<body>
    <%@ include file="/oaadmin/oahead.jsp"%>
    <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;野生动物监测数据编辑
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li><a href="/travel/oa/querynotifysend.action?pagesize=7&pagenum=1">公告通知</a></li>
					<li><a href="/travel/oa/querysend.action">发文管理</a></li>
					<li><a href="/travel/oa/queryreceive.action">收文管理</a></li> 
					
					<li><a href="/travel/oa/queryfolderlist.action?ptype=1">网络硬盘</a></li>
					<li><a href="/travel/oa/queryfolderlist.action?ptype=2">巡护图片</a></li>
					
					<li><a href="/travel/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
					<li><a href="/travel/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li class="activeli"><a href="javascript:void(0)">野生动物监测状况</a></li>
					<li><a href="/travel/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
					<li><a href="/travel/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="/travel/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
					<li><a href="/travel/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li><a href="/travel/travel/user/oauserinfo.jsp">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <div style="width:100%;margin-top:80px;">
			   <h3>野生动物监测状况</h3>
			   <hr>
			    <form  id="formAnimal" style="margin:0 auto;">
										<div class="container" style="width:80%;">
											<div class="row">
												<div class="col-md-2">
													<span>ID</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm" id="id"
														readonly="true" name="animal.id"></s:textfield>
												</div>
												<div class="col-md-2">
													<span>样线号</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.yangxianhao"></s:textfield>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>填表时间</span>
												</div>
												<div class="col-md-4">
													<div class="input-group date form_date"	data-date-format="yyyy-mm-dd">
															<s:textfield class="form-control input-sm"  name="animal.tianbiaoshijian"  id="tianbiaoshijian">
															</s:textfield>
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
												</div>
												<div class="col-md-2">
													<span>天气</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.tianqi"></s:textfield>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>监测人</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.jianceren"></s:textfield>
												</div>
												<div class="col-md-2">
													<span>动物名称</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.dongwumingcheng"></s:textfield>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>实体数量(数字)</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.shitishuliang"></s:textfield>
												</div>
												<div class="col-md-2">
													<span>尸体数量(数字)</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.bodyshuliang"></s:textfield>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>粪便</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.fenbian"></s:textfield>
												</div>
												<div class="col-md-2">
													<span>生境类型</span>
												</div>
												<div class="col-md-4">
													<s:select class="form-control input-sm" id="portaltype" theme="simple" 
														list="{'寒温性针叶林','温性针叶林','温性针阔叶混交林','暖性针叶林','落叶阔叶林','常绿、落叶阔叶混交林','常绿阔叶林','硬叶常绿阔叶林','竹林','常绿针叶灌丛','常绿革叶灌丛','落叶阔叶灌丛','常绿阔叶灌丛','灌草丛','草甸','山地人工林','农田','其他'}"
														label="选择类型" name="animal.shengjingleixing"></s:select>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>经度(*)</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm" id="jingdu"
														name="animal.jingdu"></s:textfield>
												</div>
												<div class="col-md-2">
													<span>纬度(*)</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm" id="weidu"
														name="animal.weidu"></s:textfield>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<span>海拔高度(数字)</span>
												</div>
												<div class="col-md-4">
													<s:textfield class="form-control input-sm"
														name="animal.height"></s:textfield>
												</div>
												
											</div>
											<div class="row">
										    <div class="col-md-2"><span>备注</span></div>
											<div class="col-md-10">
												<s:textarea rows="3" class="form-control input-sm" name="animal.beizhu"></s:textarea>
											</div>
										</div>
											
											<div class="row">
												<div class="col-md-12" style="padding-top:15px;">
													<label>带*为必填项。</label>
												</div>
											</div>
										</div>
									</form>
			   </div>
					<div style="margin-top:10px;">
							
							<a href="/travel/survey/animalsuredit.jsp"
								class="btn btn-default">新增数据</a>
							<button type="button" id="btnsave" class="btn btn-primary"
								onclick="SaveAnimal()">保存数据</button>
							<button type="button" id="btndel" onclick="DeleteAnimal()"
								class="btn btn-warning">删除数据</button>
						
					</div>
			</div>
			<div style="clear:both;"></div>
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
				url : "/travel/survey/saveanimal.action",
				data :  $("#formAnimal").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#animalid").val(data.animal.id);
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
			if ($("#animalid").val() != null && $("#animalid").val() != "") {
				$.ajax({
					url : '/travel/survey/deleteanimal.action?id=' + $("#animalid").val(),
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
			if($("#id").val()==null||$("#id").val()==""){
				$('.form_date').datetimepicker("setValue");
			}
		});
	</script>
</body>
</html>
