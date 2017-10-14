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
<title>最新气象信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="最新气象信息">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.css" />
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" /> --%>
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
    <%@ include file="/portal/headmodal.jsp"%>
    <div class="contentstyle">
	<div class="container" style="width:1056px;background-color:#ffffff;margin:0 auto;margin-bottom:10px;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：天气信息&gt;&gt; 气象信息    </span>
					<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;margin-top:20px;">
					<!-- <div class="panel-heading">OA管理：动物状况监测信息编辑 </div> -->
					<div class="panel-body">
						<div  style="width:100%;margin:0 auto;">
								<div class="container" style="width:800px;">
										<div class="row">
											<div class="col-md-12">
											   <span id="weathertime" style="font-size:14px;"></span>
											   <a style="float:right;margin-right:20px;" target="_blank" href="<%=contextPath%>/visitor/queryweatherlist.action">查看历史数据</a>
											
											   <a id="firea" target="_blank">查看防火指数</a>
											
											</div>
										</div>
										<div class="row" style="margin-top:30px;">
											<div class="col-md-12">
												<table style="width:100%;" class="table">
												   <thead>
												      <tr>
												           <th>通道名称</th>
												           <th>数据结果</th>
												           <th>数据单位</th>
												           <th>通道编号</th>
												          <!--  <th>通道对应编码</th> -->
												      </tr>
												   </thead>
												   <tbody id="tbweather"></tbody>
												</table>
											</div>
										</div>
									
									</div>
						</div>
					</div>
				</div>
				<!-- <div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<a href="/travel/survey/animalsuredit.jsp" class="btn btn-default">新增数据</a>
						<button type="button" id="btnsave" class="btn btn-primary"	onclick="SaveAnimal()">保存数据</button>
						<button type="button"  id="btndel" onclick="DeleteAnimal()" class="btn btn-warning">删除数据</button>
					</div>
				</div> -->
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
	
	    var contextPath="<%=contextPath%>";
		$(function() {
			//获取天气数据
			$.ajax({
				type : "get",
				url : contextPath+"/visitor/queryweather.action",
				//data : $("#formAnimal").serialize(),
				cache : false, 
				dataType : "json",
				/* async:false,
				crossDomain: true,  
				jsonp: "callbackparam",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(默认为:callback)
				jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名 */
				success : function(data) {
					if(data.errormsg=="0"){
						var weather = eval('(' + data.weatherdata + ')');
						//$("#weatherdate").val(data.datestr);
						$("#weathertime").html("获取时间：&nbsp;&nbsp;&nbsp;&nbsp;"+ data.datestr);
						var content="";//天气内容   <td>"+obj.eNum+"</td>
						for(var i=0;i<weather.entity.length;i++)
							{
							    var obj=weather.entity[i];
							    var tr="<tr><td>"+obj.eName+"</td><td>"+obj.eValue+"</td><td>"+obj.eUnit+"</td><td>"+obj.eKey+"</td></tr>";
							    content+=tr;
							  
							}
						$("#tbweather").html(content);
					}
					else{
						alert(data.errormsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
			//获取天气数据
			/* $.ajax({
				type : "get",
				url : "http://xsdz.veinasa.cn/intfa/queryData/16053404.json",
				
				cache : false, 
				dataType : "jsonp",
				 jsonp: "callback", 
				jsonpCallback:"success_callback",
				crossDomain: true, 
				async:false,
				success : function(data) {
					alert(data.statusCode);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			}); */
			//设置查询
			var myDate = new Date();
            var datestr=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
			document.getElementById("firea").href=contextPath+"/visitor/queryfireinfo.action?datestr="+datestr+"&flag=1";
		});
		//计算防火等级
		

	</script>
</body>
</html>
