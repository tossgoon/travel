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

<title>OA系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="OA系统">
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

</style>
</head>

<body>
   <%@ include file="/oaadmin/oahead.jsp"%>
   	<div class="contentstyle">
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：OA管理&gt;&gt;<a href="<%=contextPath%>/oa/queryreceive.action">收文管理</a>&gt;&gt;收文详情
					  </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin:30px;">收文详情</label>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">我的事务</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formOa" action="save"
							namespace="/oa" style="width:100%;margin:0 auto;">
							<s:hidden class="form-control" id="oaid" name="oa.id"
								readonly="true"></s:hidden>
								
							<s:hidden class="form-control" id="oarecid" name="oa.recid"
								readonly="true"></s:hidden>	
								
							<table id="oainfo"
								style="border-collapse:separate; border-spacing:0px 10px;margin:0 auto;">
								<tr>
									<td><span>发送人</span></td>
									<td colspan="3">
										<s:textfield class="form-control" readonly="true"	id="oasender" name="oasender"></s:textfield>
									</td>
								</tr>
								<tr>
									<td><span>标题</span></td>
									<td colspan="3"><s:textfield class="form-control" readonly="true"
											id="oatitle" name="oa.title"></s:textfield></td>
								</tr>
								<tr>
									<td valign="top"><span>内容</span></td>
									<td colspan="3"><s:textarea class="form-control"
											style="resize: none;margin-bottom:10px;width:800px;"
											rows="10" id="oacontent" name="oa.content"></s:textarea></td>
								</tr>
								<tr>
									<td><span>发布日期</span></td>
									<td style="width:260px;">
										<div class="input-group date form_date"
											data-date-format="yyyy-mm-dd hh:ii:ss">
											<s:textfield class="form-control">
												<s:param name="value">
													<s:date name="oa.pubdate" format="yyyy-MM-dd HH:mm:ss" />
												</s:param>
											</s:textfield>
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</td>
								</tr>
								<tr>
								<td><span>状态:</span></td>
								<td><c:if test="${oa.isread!=true}">
											<label id="oareadst" style="margin-left:20px;margin-right:20px;font-size:14px;">未读 </label>
											<a id="asetread"  onclick="setread()" href="javascript:void(0);">标为已读</a>
										</c:if> <c:if test="${oa.isread==true}">
											已读
										</c:if></td>
								</tr>
								
								<tr>
									<td colspan="4"><hr style="border:1px solid;" /></td>
								</tr>

								<tr>
									<td style="font-size:14px;text-align:center;">附件</td>
								</tr>

								<tr>
									<td colspan="4" valign="top">
										<table style="width:100%;margin:0 auto;font-size:14px;"
											class="table">
											<thead>
												<tr>
													<th style="display: none">id</th>
													<th width="200" style="text-align:center;">名称</th>
													<th width="100" style="text-align:center;">操作</th>
												</tr>
											</thead>
											<tbody id="tbattach">
												<s:iterator value="oa.oafiles" var="oafile">
													<tr>
														<td style="display: none"><s:property
																value="#oafile.id" /></td>
														<td width="200" style="text-align:center;"><s:property
																value="#oafile.filename" /></td>
														<%-- <td width="200" style="text-align:center;">
														      <s:property	value="#oafile.filepath" />
														</td> --%>
														<td width="100" style="text-align:center;"><a
															href=' <s:property	value="#oafile.filepath" />'  download="<s:property	value="#oafile.filename" />">下载</a></td>		
														<%-- <td width="100" style="text-align:center;"><a
															href='/travel/fileio/download.action?fid=<s:property	value="#oafile.id" /> '>下载</a></td> --%>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="userModal" role="dialog" aria-labelledby="选择用户" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:610px;width:460px;">
			    <div class="panel-heading">选择用户</div>
				<div class="modal-body">
					<table class="table">
						<thead><tr><th style='text-align:center;'>选择</th><th  style='display:none;'>id</th><th style='text-align:center;'>姓名</th><th style='text-align:center;'>部门</th></tr></thead>
						<tbody id="tbuser">
						</tbody>
					</table>
				</div>
				<div class="modal-footer form-horizontal">
				    <button type="button" class="btn btn-default" style="float:left;" onclick="SelectAll()">全选</button>
				    <button type="button" class="btn btn-default" style="float:left;" onclick="ReSelect()">反选</button>
				    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="SelectUser()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
		function SelectUser(){
			receiverids="";
			receivernames="";
			$("#tbuser").find("input[type='checkbox']").each(function(){
				if($(this).is(":checked")){
					receiverids=receiverids+$(this).parent().parent().find("td").eq(1)[0].innerText+";";
					receivernames=receivernames+$(this).parent().parent().find("td").eq(2)[0].innerText+";";
				}
			});
			if (receiverids.substr(receiverids.length - 1, 1) == ";") {
				receiverids = receiverids.substr(0, receiverids.length - 1);
			}
			if (receivernames.substr(receivernames.length - 1, 1) == ";") {
				receivernames = receivernames.substr(0, receivernames.length - 1);
			}
			$("#receivers").val(receivernames);
		}
		function SaveOa(status) {
			//获取oafiles
			//var oafiles=[];
			if(status==1){
				if(receiverids==""){
					alert("请选择用户");
					return;
				}
			}
			var oafilestr = "";
			$("#tbattach").find("tr").each(function() {
				var filename = $(this).find("td").eq(1)[0].innerText;
				var filepath = $(this).find("td").eq(2)[0].innerText;
				//var row="{'filename':'"+filename+"','filepath':'"+filepath+"'},";
				/* var row={
						filename:filename,
						filepath:filepath
				}; */
				var rowstr = filename + "*" + filepath + "?";
				//oafiles.push(row);
				oafilestr = oafilestr + rowstr;
			});
			if (oafilestr.substr(oafilestr.length - 1, 1) == "?") {
				oafilestr = oafilestr.substr(0, oafilestr.length - 1);
			}
			/* if(oafiles.substr(oafiles.length-1,1)==","){
				oafiles=oafiles.substr(0,oafiles.length-1);
			}
			oafiles=oafiles+"]"; */
			$.ajax({
				type : "post",
				url : "<%=contextPath%>/oa/save.action",
				data : {
					"oa.id" : $("#oaid").val(),
					"oa.title" : $("#oatitle").val(),
					"oa.content" : $("#oacontent").val(),
					"oa.pubdate" : $("#oapubdate").val(),
					"oa.status" : status == 1 ? true : false,
				    "oareceivers":receiverids,
					"oafilestr" : oafilestr
				//,"oa.oafiles":oafiles
				},
				//$("#formOa").serialize(), 
				cache : false,
				dataType : "json",
				success : function(data) {
					if (data.errorMsg == "0") {
						//新增用户
						if (status == 0) {
							$("#oaid").val(data.oa.id);
							alert("保存成功");
						} else {
							$("#oaid").val(data.oa.id);
							$('#btnsave').attr('disabled', "true");
							$('#btnsend').attr('disabled', "true");
							$('#btndel').attr('disabled', "true");
							$("#chksend").attr("checked", "true");
							alert("发布成功");
						}
					} else {
						alert(data.errorMsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
		function DeleteOa() {
			if ($("#oaid").val() != null&&$("#oaid").val() !="") {
				$.ajax({
					url : '<%=contextPath%>/oa/delete.action?id=' + $("#oaid").val(),
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errorMsg == "0") {
							//删除oa
							$("#oaid").val('');
							$("#oatitle").val('');
							$("#oacontent").val('');
							$("#tbattach tr").empty();
							ResetUploader();
							alert("删除完成");
						} else {
							alert(data.errorMsg);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
			}
		}
		var uploader;
		$(function() {
			//初始化日期控件
			receiverids='${oareceivers}';//初始化
			$('.form_date').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 0,
				minView : 0,
				forceParse : 0
			});
			//根据参数判断
		});
		
		function setread(){
			if ($("#oarecid").val() != null&&$("#oarecid").val() !="") {
				$.ajax({
					url : '<%=contextPath%>/oa/setread.action?id=' + $("#oarecid").val(),
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errormsg == "0") {
							//删除oa
							$("#oareadst").text('已读');
							$("#asetread").hide();
							
							alert("完成");
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
