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
<title>森林植物群落监测</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="部门编辑">
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

#formAnimal .col-md-2 span {
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
			<span>当前位置：OA系统&gt;&gt;森林植物群落监测
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
					<li><a href="<%=contextPath%>/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
					<li><a href="<%=contextPath%>/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/animalsuredit.jsp">野生动物监测状况</a></li>
					<li  class="activeli"><a href="javascript:void(0)" >森林植物群落监测 </a></li>
					<li><a href="<%=contextPath%>/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="<%=contextPath%>/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
					<li><a href="<%=contextPath%>/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=1" target="_blank">网络硬盘</a></li>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=2" target="_blank">巡护图片</a></li>
					<li><a href="<%=contextPath%>/user/queryuinfo.action" target="_blank">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <div style="width:100%;margin-top:80px;">
			   <h3>森林植物群落监测</h3>
			   <hr>
			    <form id="formAnimal"
										style="margin:0 auto;">
										<div class="container" style="width:80%;">
											<div class="row">
											<div class="col-md-2">
												<span>ID</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" id="id" name="plantsurvey.id" readonly="true"></s:textfield>
											</div>
											<div class="col-md-2"><span>样方号</span></div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="plantsurvey.yangfanghao"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>经度(*)</span>
											</div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" id="jingdu" name="plantsurvey.jingdu"></s:textfield>
											</div>
											<div class="col-md-2"><span>纬度(*)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" id="weidu" name="plantsurvey.weidu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>填表时间</span>
											</div>
											<div class="col-md-4">
											     <div class="input-group date form_date"	data-date-format="yyyy-mm-dd">
															<s:textfield class="form-control input-sm"  name="plantsurvey.tianbiaoshijian" value="%{plantsurvey.datestr}">
															</s:textfield>
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
											</div>
											<div class="col-md-2"><span>监测人</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.jianceren"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>坡位</span>
											</div>
											<div class="col-md-4">
											    <s:select class="form-control input-sm" id="powei" theme="simple"
														list="{'脊部','上部','中部','下部','沟谷'}"
														label="选择类型" name="plantsurvey.powei"></s:select>
											</div>
											<div class="col-md-2"><span>坡度</span></div>
											<div class="col-md-4">
											    <s:select class="form-control input-sm" id="poxiang" theme="simple"
														list="{'0-5','6-20','21-30','31-40','>40'}"
														label="选择类型" name="plantsurvey.podu"></s:select>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>坡向</span>
											</div>
											<div class="col-md-4">
											    <s:select class="form-control input-sm" id="poxiang" theme="simple"
														list="{'北' ,'东北','东','东南','南','西南','西','西北','无坡向'}"
														label="选择类型" name="plantsurvey.poxiang"></s:select>
											</div>
											<div class="col-md-2"><span>海拔高度(数字)</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.height"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>郁闭度</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.yubidu"></s:textfield>
											</div>
											<div class="col-md-2"><span>群系名称</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.qunximingcheng"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>树种名</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.shuzhongming"></s:textfield>
											</div>
											<div class="col-md-2"><span>标本编号</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.biaobenbianhao"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>高度</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.gaodu"></s:textfield>
											</div>
											<div class="col-md-2"><span>胸径</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.xiongjing"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>东西冠幅</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.dongxiguanfu"></s:textfield>
											</div>
											<div class="col-md-2"><span>南北冠幅</span></div>
											<div class="col-md-4">
												<s:textfield class="form-control input-sm" name="plantsurvey.nanbeiguanfu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>均值</span>
											</div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="plantsurvey.junzhi"></s:textfield>
											</div>
										</div>
										<div class="row">
										
											<div class="col-md-2"><span>备注</span></div>
											<div class="col-md-10">
												<s:textarea  class="form-control input-sm" name="plantsurvey.beizhu"></s:textarea>
											</div>
										</div>
										
										
										<div class="row">
										<div class="col-md-12" style="padding-top:15px;">
												<label>带*为数字。其中经度、纬度为必填项。</label>
											</div>
										</div>
										</div>
									</form>
			   </div>
					<div style="margin-top:10px;">
						<a href="<%=contextPath%>/survey/plantedit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveAnimal()">保存数据</button>
						<button type="button"  id="btndel" onclick="DeleteAnimal()" class="btn btn-warning">删除数据</button>
					<a href="<%=contextPath%>/survey/queryplantpage.action" target="_blank"
								class="btn btn-success">数据查询</a>
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
	    var contextPath="<%=contextPath%>";
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
				url : contextPath+"/survey/saveplant.action",
				data :  $("#formAnimal").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#id").val(data.plantsurvey.id);
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
					url : contextPath+'/survey/deleteplant.action?id=' + $("#id").val(),
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
