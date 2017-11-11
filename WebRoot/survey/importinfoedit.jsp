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
<title>动植物相关重要信息</title>
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

.col-md-2 span {
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
			<span>当前位置：OA系统&gt;&gt;动植物相关重要信息
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
		</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" style="border-right:1px solid #111111;">
				<ul>
				    <c:if test="${usertype==0}">
					<li><a href="<%=contextPath%>/survey/chickedit.jsp">褐马鸡种群状况 </a></li>
					<li><a href="<%=contextPath%>/survey/cameraedit.jsp"> 红外相机监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/animalsuredit.jsp">野生动物监测状况</a></li>
					<li><a href="<%=contextPath%>/survey/plantedit.jsp">森林植物群落监测 </a></li>
					</c:if>
					<li class="activeli"><a href="javascript:void(0)" >动植物重要信息 </a></li>
					<c:if test="${usertype==0}">
					<li><a href="<%=contextPath%>/survey/protectedit.jsp">保护区巡护记录 </a></li>
					<%-- <li><a href="<%=contextPath%>/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li> --%>
					</c:if>
					<c:if test="${usertype==1}">
				  		<li><a href="<%=contextPath%>/survey/querychickpage.action">褐马鸡监测查询 </a></li>
						<li><a href="<%=contextPath%>/survey/querycamerapage.action"> 红外相机监测查询</a></li>
						<li><a href="<%=contextPath%>/survey/queryanimalpage.action">野生动物监测查询</a></li>
						<li><a href="<%=contextPath%>/survey/queryplantpage.action" >森林植物群落查询 </a></li>
						<li><a href="<%=contextPath%>/survey/queryimportpage.action">动植物信息查询 </a></li>
						<li><a href="<%=contextPath%>/survey/queryprotectpage.action" >保护区巡护查询 </a></li>
					</c:if>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=1" >网络硬盘</a></li>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=2" >巡护图片</a></li>
					<li><a href="<%=contextPath%>/user/queryuinfo.action" >个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;">
			   <div style="width:100%;margin-top:80px;">
			   <h3>动植物相关重要信息</h3>
			   <hr>
			    <form  id="formAnimal"	style="margin:0 auto;">
										<div class="container" style="width:80%;">
											<div class="row">
											<div class="col-md-2">
												<span>ID</span>
											</div>
											<div class="col-md-4">
											    <s:textfield class="form-control input-sm" id="id" name="importinfo.id" readonly="true" ></s:textfield>
											</div>
											<div class="col-md-2"><span>填报单位</span></div>
											<div class="col-md-4">
											    <s:textfield class="form-control input-sm" name="importinfo.tianbaodanwei" ></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>填写时间</span>
											</div>
											<div class="col-md-4">
											    <div class="input-group date form_date"	data-date-format="yyyy-mm-dd"  id="dttianxieshijian">
														<s:textfield class="form-control input-sm" name="importinfo.tianxieshijian" value="%{importinfo.datestr}"  id="tianxieshijian" ></s:textfield>
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
												</div>
											</div>
											<div class="col-md-2"><span>名称</span></div>
											<div class="col-md-4">
												<s:textfield  class="form-control input-sm" name="importinfo.mingcheng"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>痕迹类型</span>
											</div>
											<div class="col-md-4">
											    <s:textfield  class="form-control input-sm" name="importinfo.henjileixing"></s:textfield>
											</div>
											<div class="col-md-2"><span>发现地点</span></div>
											<div class="col-md-4">
											    <s:textfield  class="form-control input-sm" name="importinfo.faxiandidian"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>经度(*)</span>
											</div>
											<div class="col-md-4">
											    <s:textfield  id="jingdu"  class="form-control input-sm" name="importinfo.jingdu" ></s:textfield>
											</div>
											<div class="col-md-2"><span>纬度(*)</span></div>
											<div class="col-md-4">
											    <s:textfield  id="weidu"  class="form-control input-sm" name="importinfo.weidu"></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>发现时间</span>
											</div>
											<div class="col-md-4">
											     <div class="input-group date form_date"	data-date-format="yyyy-mm-dd" id="dtfaxianshijian">
														<s:textfield class="form-control input-sm" name="importinfo.faxianshijian" value="%{importinfo.faxiandatestr}" id="faxianshijian" ></s:textfield>
														<span class="input-group-addon"> <span	class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
											</div>
											<div class="col-md-2"><span>发现人员</span></div>
											<div class="col-md-4">
											    <s:textfield  class="form-control input-sm" name="importinfo.faxianrenyuan"  id="faxianrenyuan" ></s:textfield>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<span>描述</span>
											</div>
											<div class="col-md-10">
											    <s:textfield  class="form-control input-sm" name="importinfo.miaoshu" ></s:textfield>
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
					<div style="margin-top:10px;margin-bottom:10px;">
							<a href="<%=contextPath%>/survey/importinfoedit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveAnimal()">保存数据</button>
						<c:if test="${usertype==1}">
						<button type="button"  id="btndel" onclick="DeleteAnimal()" class="btn btn-warning">删除数据</button>
						</c:if>
						<a href="<%=contextPath%>/survey/queryimportpage.action" target="_blank"
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
		function SaveAnimal() {
			/* if ($("#id").val() != null && $("#id").val() != ""&&"${usertype}"=="0"){
				   alert("无编辑权限，请联系数据管理员。");
				   return;
				} */
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
				url : "<%=contextPath%>/survey/saveimportinfo.action",
				data :  $("#formAnimal").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
				if (data.errormsg == "0") {
						//新增部门
						$("#id").val(data.importinfo.id);
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
			if (confirm("是否删除?")) {
			if ($("#id").val() != null && $("#id").val() != "") {
				$.ajax({
					url : '<%=contextPath%>/survey/deleteimportinfo.action?id=' + $("#id").val(),
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
			}}
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
				$("#dttianxieshijian").datetimepicker("setValue");
				$("#dtfaxianshijian").datetimepicker("setValue");
			}
			if ($("#id").val() != null && $("#id").val() != ""&&"${usertype}"=="0"){
				$("#btnsave").hide();
			}
		});
	</script>
</body>
</html>
