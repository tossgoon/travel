<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>OA收文管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="用户管理">
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
body{
background-color: rgb(226, 252, 231);
}
td,th{
text-align:center;
}
</style>
</head>

<body>
   <%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统&np;>收文管理
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
	
		<div class="contentstyle">
		<div class="maincontent" >
			<div class="leftpanel" style="border-right:1px solid;">
				<ul>
					<li><a href="/travel/oa/querynotifysend.action?pagesize=7&pagenum=1">公告通知</a></li>
					<li><a href="/travel/oa/querysend.action">发文管理</a></li>
					<li  class="activeli"><a href="javascript:void(0)">收文管理</a></li>
					<li><a href="/travel/oa/queryfolderlist.action?ptype=1">网络硬盘</a></li>
					<li><a href="/travel/oa/queryfolderlist.action?ptype=2">巡护图片</a></li>
					<li><a href="/travel/survey/chickedit.jsp" target="_blank">褐马鸡种群状况 </a></li>
					<li><a href="/travel/survey/cameraedit.jsp" target="_blank"> 红外相机监测状况</a></li>
					<li><a href="/travel/survey/animalsuredit.jsp" target="_blank">野生动物监测状况 </a></li>
					<li><a href="/travel/survey/plantedit.jsp" target="_blank">森林植物群落监测 </a></li>
					<li><a href="/travel/survey/importinfoedit.jsp" target="_blank">动植物重要信息 </a></li>
					<li><a href="/travel/survey/protectedit.jsp" target="_blank">保护区巡护记录 </a></li>
					<li><a href="/travel/survey/surveymap.jsp" target="_blank">监测数据分布图 </a></li>
					<li><a href="/travel/travel/user/oauserinfo.jsp">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="border:none;height:700px;">
			        <h3  style="margin:30px;">收文管理</h3>
			        <s:form action="queryreceive" namespace="/oa" class="form-inline"
							method="post" theme="simple">
							<span style="float:left;margin-left:30px;margin-top:5px;">输入标题查询：</span>
							<input class="form-control" type="text" name="queryText" style="float:left;width:300px;"	value="${searchText}" /> 
							<input type="submit" class="btn btn-default" style="float:left;height:33px;width:90px;" value="查询" />
					</s:form>
					<div style="clear:both;"></div>
			        <hr>
					
						
					<table align="center"  cellpadding="0" cellspacing="0"
							 id="userlist" class="table"
							style="margin-top:20px;clear:both;width:100%;">
							<thead>
								<tr align="center">
									<th width="50">ID</th>
									<th width="260">标题</th>
									<th width="100">发送人</th>
									<th width="100">发布日期</th>
									<th width="100">状态</th>
									<th width="100">查看</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="oa" items="${oareceivelist}">
							
						  			<c:if test="${fn:contains(oa.title,searchText)}">
							
										<tr align="center" height="24px" style="font-size:14px;">
											<td>${oa.id}</td>

											<c:if test="${oa.isread!=true}">
												<td style='font-weight:bold;'>${oa.title}</td>
											</c:if>
											<c:if test="${oa.isread==true}">
												<td>${oa.title}</td>
											</c:if>
												<td>${oa.senduser}</td>

												<td>${oa.pubdatestr}</td>
											<td><c:if test="${oa.isread!=true}">
													未读
												</c:if> <c:if test="${oa.isread==true}">
													已读
											</c:if></td>
											<td><a href="/travel/oa/query.action?oarecid=${oa.recid}"
													style="margin-right:10px;">查看</a></td>
											</tr>
								
											</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div style="margin-top:10px;">
							<a id="firstpage" href="/travel/oa/queryreceive.action?pagesize=10&pagenum=1">第一页</a>
							<a id="lastpage"  href="/travel/oa/queryreceive.action?pagesize=10&pagenum=${page.currentPage-1 }">上一页</a>
							<a id="nextpage"  href="/travel/oa/queryreceive.action?pagesize=10&pagenum=${page.currentPage+1 }">下一页</a>
							<a id="endpage"	  href="/travel/oa/queryreceive.action?pagesize=10&pagenum=${page.totalPage }">最后一页</a>
							<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
					</div>
					<div style="clear:both;"></div>
		   </div>
	    </div>
		<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		//弹出修改密码对话框
		function ShowpassModal(){
			//弹出修改密码对话框
			$("#userinfo").modal("show");
		}
		function SavePassword(){
			var oldpassword=$("#oldpassword").val();//旧密码
			var password1=$("#password1").val();//新密码1
			var password2=$("#password2").val();//新密码2
			
			if(password1==null||password1==undefined||password1==""){
				alert("新密码为空");
				return;
			}
			if(password1!=password2){
				alert("两次密码不一致");
				return;
			}
			$.ajax({
				url : '/travel/user/updatepass.action',
				type : 'POST',
				// 提交数据给Action传入数据
				data : {oldpass:oldpassword,
					    newpass:password1},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.errorMsg == "0") {
						//删除用户
						alert("更改完成。");
						$("#userinfo").modal("hide");
					}
					else{
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
