<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>森林防火等级</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="黄龙山,褐马鸡,森林防火等级">
<meta http-equiv="description" content="森林防火等级">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" /> --%>
<style type="text/css">
body {
	background-color: #f2f2f2;
}
td >span{
 float:right;
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
					<span>当前位置：天气信息&gt;&gt; 森林防火等级    </span>
					<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			      <s:form role="form" theme="simple" id="formPortalInfo">
					<table style="width:100%;border-collapse:separate; border-spacing:0px 10px;">
										<tbody>
											<tr>
												<td><span>计算日期</span></td>
												<td style="width:200px;">
												 <div class="input-group date form_date" data-date-format="yyyy-mm-dd" id="datediv">
												    <input class="form-control input-sm" value="${fire.daystr}" id="computedate" readonly="readonly">
												       <span class="input-group-addon"> 
												           <span class="glyphicon glyphicon-calendar"></span>
												       </span>
											       </div>
											  </td>
											  <td><a href="javascript:void(0)" onclick="GetData()" class="btn btn-default">刷新</a></td>
											</tr>
											<tr>
											<td colspan="6"><hr style="margin:0px;margin-bottom:10px;"></td>
											</tr>
											<tr>
												<td><span>最高空气温度（°C）</span></td>
												<td>
												<c:if test="${fire.temprature==-9999}">
						  							<input class="form-control input-sm" id="temprature" value="--" readonly="readonly">
												</c:if>
												<c:if test="${fire.temprature!=-9999}">
												    <input class="form-control input-sm" id="temprature" value="${fire.temprature}" readonly="readonly">
												</c:if>
												</td>
												<td colspan="2"></td>
												<td><span>指数A</span></td>
												<td>
													<c:if test="${fire.parama==-9999}">
						  								<input class="form-control input-sm" id="parama" value="--" readonly="readonly">
													</c:if>
													<c:if test="${fire.parama!=-9999}">
												    	<input class="form-control input-sm" id="parama" value="${fire.parama}" readonly="readonly">
													</c:if>
												</td>
										    </tr>
											<tr>
												<td><span>最小相对湿度（%）</span></td>
												<td>
												     <c:if test="${fire.humidity==-9999}">
						  								<input class="form-control input-sm" id="humidity" value="--" readonly="readonly">
													</c:if>
													<c:if test="${fire.humidity!=-9999}">
												    	<input class="form-control input-sm" id="humidity" value="${fire.humidity}" readonly="readonly">
													</c:if>
												 </td>
												<td colspan="2"></td><td><span>指数B</span></td>
												<td>
												   <c:if test="${fire.paramb==-9999}">
						  								<input class="form-control input-sm" id="paramb" value="--" readonly="readonly">
													</c:if>
													<c:if test="${fire.paramb!=-9999}">
												    	<input class="form-control input-sm" id="paramb" value="${fire.paramb}" readonly="readonly">
													</c:if>
												</td>
											</tr>
											<tr>
												<td><span>降雨量或降雪量（毫米）</span></td>
												<td><input class="form-control input-sm" id="water" value="${fire.water}" readonly="readonly"></td>
												<td><span>雨雪后日数</span></td>
												<td><input class="form-control input-sm" id="waterday" value="${fire.waterday}" readonly="readonly"></td>
												<td><span>指数C</span></td>
												<td><input class="form-control input-sm" id="paramc" value="${fire.paramc}" readonly="readonly"></td>
											</tr>
											<tr>
												<td><span>最大风速（米/秒）</span></td>
												<td>
												    <c:if test="${fire.wind==-9999}">
						  								<input class="form-control input-sm" id="wind" value="--" readonly="readonly">
													</c:if>
													<c:if test="${fire.wind!=-9999}">
												    	<input class="form-control input-sm" id="wind" value="${fire.wind}" readonly="readonly">
													</c:if>
												</td>
												<td colspan="2"></td><td><span>指数D</span></td>
												<td>
												     <c:if test="${fire.paramd==-9999}">
						  								<input class="form-control input-sm" id="paramd" value="--" readonly="readonly">
													</c:if>
													<c:if test="${fire.paramd!=-9999}">
												    	<input class="form-control input-sm" id="paramd" value="${fire.paramd}" readonly="readonly">
													</c:if>
												</td>
											</tr>
											<tr>
												<td><span style="color:#FF3030;">生物及非生物物候季节特征(*)</span></td>
												<td colspan="3">
												
												<s:select class="form-control" id="fireother" name="fire.other"
													list="#{'20':'全部绿草覆盖（草木生长期）/90%以上积雪覆盖(积雪期)'
													       ,'15':'75%绿草覆盖（草木生长期）/60%以上积雪覆盖(积雪期)'
													       ,'10':'50%绿草覆盖（草木生长期）/30%以上积雪覆盖(积雪期)'
													       ,'5':'20%绿草覆盖（草木生长期）/10%以上积雪覆盖(积雪期)'
													       ,'0':'没有绿草（草木生长期）/没有积雪(积雪期)'}"
													label="选择" onchange="ChangeSelect()"></s:select>
												</td>
												<td><span>指数E</span></td>
												<td><s:textfield class="form-control input-sm" id="parame" name="fire.parame" readonly="true" value="20"></s:textfield></td>
											</tr>
											<tr>
											<td colspan="5"></td>
											<td><a href="javascript:void(0)" onclick="compute()" class="btn btn-primary" style="width:90px;">计算</a></td>
											</tr>
											<tr>
											<td colspan="6"><hr style="margin-top:10px;margin-bottom:10px;"></td>
											</tr>
											
											<tr>
											    <td colspan="4"></td>
												<td><span>森林火险天气指数HTZ</span></td>
												<td><s:textfield class="form-control  input-sm" id="htz" readonly="true"></s:textfield></td>
											</tr>
											<tr>
												<td  colspan="2"></td>
												<td><span>森林火险天气等级</span></td>
												<td colspan="3"><s:textfield class="form-control  input-sm" id="firelevel"   readonly="true"></s:textfield></td>
											</tr>
										</tbody>
									</table>
									</s:form>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
	function ChangeSelect(){
		var options=$("#fireother option:selected");
		var firetype=options.val();
		$("#parame").val(firetype);
	}
	function GetData(){
		$.ajax({
			type : "get",
			url : "/travel/visitor/queryfireinfo.action",
			data :{datestr: $("#computedate").val()},
			//data :{datestr: datestr},
			cache : false, 
			dataType : "json",
			success : function(data) {
				var fire=data.fire;
				if(fire.temprature=="-9999"){
					$("#temprature").val("--");
				}
				else{
					$("#temprature").val(fire.temprature);
				}
				if(fire.humidity=="-9999"){
					$("#humidity").val("--");
				}
				else{
					$("#humidity").val(fire.humidity);
				}
				if(fire.water=="-9999"){
					$("#water").val("--");
				}
				else{
					$("#water").val(fire.water);
				}
				if(fire.waterday=="-9999"){
					$("#waterday").val("--");
				}
				else{
					$("#waterday").val(fire.waterday);
				}
				if(fire.wind=="-9999"){
					$("#wind").val("--");
				}
				else{
					$("#wind").val(fire.wind);
				}
				if(fire.parama=="-9999"){
					$("#parama").val("--");
				}
				else{
					$("#parama").val(fire.parama);
				}
				if(fire.paramb=="-9999"){
					$("#paramb").val("--");
				}
				else{
					$("#paramb").val(fire.paramb);
				}
				if(fire.paramc=="-9999"){
					$("#paramc").val("--");
				}
				else{
					$("#paramc").val(fire.paramc);
				}
				if(fire.paramd=="-9999"){
					$("#paramd").val("--");
				}
				else{
					$("#paramd").val(fire.paramd);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
			}
		});
	}
	function compute(){
		var a,b,c,d,e,htz;
		a=parseFloat($("#parama").val());
		b=parseFloat($("#paramb").val());
		c=parseFloat($("#paramc").val());
		d=parseFloat($("#paramd").val());
		e=parseFloat($("#parame").val());
		if(isNaN(a)||isNaN(b)||isNaN(c)||isNaN(d)||isNaN(d)){
			$("#firelevel").val("数据不全");
			return;
		}
		htz=a+b+c+d-e;
		$("#htz").val(htz);
		var level="";
		if (htz <= 25) {
				level = "一等/没有危险/不能燃烧/不能蔓延";
			} else if (htz <= 50) {
				level = "二等/低度危险/难以燃烧/难以蔓延";
			} else if (htz <= 72) {
				level = "三等/中度危险/较易燃烧/较易蔓延";
			} else if (htz <= 90) {
				level = "四等/高度危险/容易燃烧/容易蔓延";
			} else {
				level = "五等/极度危险/极易燃烧/极易蔓延";
			}
		   $("#firelevel").val(level);

		}
		$(function() {
			//初始化日期控件
			//$('.form_date').datetimepicker();
			$('#datediv').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0
			}).on('changeDate', function(ev) {
				//GetData($("#computedate").val());
				GetData();
			});
			if($("#computedate").val()==null||$("#computedate").val()==""){
				//$('.form_date').datetimepicker("setValue");
			}
			compute();
		});
	</script>
</body>
</html>
