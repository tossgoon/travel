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
<title>褐马鸡野外种群状况监测</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="褐马鸡野外种群状况监测">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	float: right;
}

body {
	background-color: #f2f2f2;
}

.col-md-2 span {
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
    
    <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;褐马鸡野外种群状况监测
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li><a href="<%=contextPath%>/portal/querypage.action?pagesize=10&pagenum=1&type=0" target="_blank">网站门户</a></li>
					<li><a href="<%=contextPath%>/user/querypage.action">用户管理</a></li>
					<li><a href="<%=contextPath%>/oa/querynotify.action?pagesize=10&pagenum=1">通知公告</a></li>
					<li><a href="<%=contextPath%>/dept/querylist.action">部门管理</a></li>
					<li  class="activeli"><a href="javascript:void(0)" >褐马鸡种群状况 </a></li>
					<li><a href="<%=contextPath%>/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/animalsuredit.jsp">野生动物监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
					<li><a href="<%=contextPath%>/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="<%=contextPath%>/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
					<li><a href="<%=contextPath%>/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li><a href="<%=contextPath%>/user/queryuinfo.action">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <div style="width:100%;margin-top:80px;">
			   <h3>褐马鸡野外种群状况监测</h3>
			   <hr>
			    <form  id="formAnimal" 	style="margin:0 auto;">
										<div class="container" style="width:80%;">
											<div class="row">
											<div class="col-md-2">
												<span>ID</span>
											</div>
											<div class="col-md-4">
											    <s:textfield class="form-control input-sm" id="id"
														readonly="true" name="chick.id"></s:textfield>
												<%-- <s:textfield class="form-control input-sm" id="id" name="chick.id" readonly="true"></s:textfield> --%>
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
												<div class="input-group date form_date"	data-date-format="yyyy-mm-dd">
															<s:textfield class="form-control input-sm"  name="chick.tianbiaoshijian" value="%{chick.datestr}"  id="tianbiaoshijian">
															</s:textfield>
															
														<%-- 	<s:textfield class="form-control" id="tianbiaoshijian" >
												     		<s:param name="value" ><s:date name="chick.tianbiaoshijian" format="yyyy-MM-dd" /></s:param> 
												    	</s:textfield> --%>
															
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
												</div>
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
											<div class="col-md-2"><span>实体数量(数字)</span></div>
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
											<div class="col-md-2"><span>实体年龄(数字)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="chick.shitinianling"></s:textfield>
											</div>
										</div>
										
										<div class="row">
										<div class="col-md-2">
												<span>生境类型</span>
											</div>
											<div class="col-md-4">
												<s:select class="form-control input-sm" id="shengjingleixing" theme="simple"
														list="{'寒温性针叶林','温性针叶林','温性针阔叶混交林','暖性针叶林','落叶阔叶林','常绿、落叶阔叶混交林','常绿阔叶林','硬叶常绿阔叶林','竹林','常绿针叶灌丛','常绿革叶灌丛','落叶阔叶灌丛','常绿阔叶灌丛','灌草丛','草甸','山地人工林','农田','其他'}"
														label="选择类型" name="chick.shengjingleixing"></s:select>
											</div>
											<div class="col-md-2"><span>尸体数量(数字)</span></div>
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
												<s:select class="form-control input-sm" id="powei" theme="simple"
														list="{'脊部','上部','中部','下部','沟谷'}"
														label="选择类型" name="chick.powei"></s:select>
											</div>
											<div class="col-md-2"><span>坡度</span></div>
											<div class="col-md-4">
												<s:select class="form-control input-sm" id="poxiang" theme="simple"
														list="{'0-5','6-20','21-30','31-40','>40'}"
														label="选择类型" name="chick.podu"></s:select>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>坡向</span>
											</div>
											<div class="col-md-4">
												<s:select class="form-control input-sm" id="poxiang" theme="simple"
														list="{'北' ,'东北','东','东南','南','西南','西','西北','无坡向'}"
														label="选择类型" name="chick.poxiang"></s:select>
												
											</div>
											<div class="col-md-2"><span>海拔高度(数字)</span></div>
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
												<s:textarea rows="3"  class="form-control input-sm" name="chick.beizhu"></s:textarea>
											</div>
										</div>
										<div class="row">
										<div class="col-md-12" style="padding-top:15px;">
												<label>其中经度、纬度为必填项，格式为十进制。</label>
											</div>
										</div>
										</div>
									</form>
			   </div>
					<div style="margin-top:10px;">
						<a href="<%=contextPath%>/survey/chickedit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveAnimal()">保存数据</button>
						<button type="button"  id="btndel" onclick="DeleteAnimal()" class="btn btn-warning">删除数据</button>
						
					</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		var receiverids="";
		var receivernames="";
		var contextPath="<%=contextPath%>";
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
				url : contextPath+"/survey/savechick.action",
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
					url : contextPath+'/survey/deletechick.action?id=' + $("#id").val(),
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
