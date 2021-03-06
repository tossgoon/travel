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

<title>用户管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="用户管理">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
<link rel="stylesheet" href="<%=contextPath%>/includes/js/jquery-treeview/jquery.treeview.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	 float: right;
}
body{
background-color:#f2f2f2;
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
					<span>当前位置：OA管理&gt;&gt;<a href="<%=contextPath%>/oa/querysend.action">发文管理</a>&gt;&gt; 发文编辑    </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin:30px;">用户工作箱：发文编辑</label>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">OA管理：发文编辑</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formOa" action="save"
							namespace="/oa" style="width:100%;margin:0 auto;">
							<s:hidden class="form-control" id="oaid" name="oa.id"
								readonly="true"></s:hidden>
							<table id="oainfo"
								style="border-collapse:separate; border-spacing:0px 10px;margin:0 auto;">
								<tr>
									<td><span>接收人</span></td>
									<td colspan="3">
										<div class="input-group" style="width:800px;">
											<input type="text" class="form-control"
												value="${oareceivernames}" id="receivers"
												readonly="readonly"> <span class="input-group-btn">
												<button class="btn btn-default" type="button"
													data-toggle="modal" data-target="#userModal">选择...</button>
											</span>
										</div> <!-- /input-group -->
									</td>
								</tr>
								<tr>
									<td><span>标题</span></td>
									<td colspan="3"><s:textfield class="form-control"
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
											<s:textfield class="form-control" id="oapubdate">
												<s:param name="value">
													<s:date name="oa.pubdate" format="yyyy-MM-dd HH:mm:ss" />
												</s:param>
											</s:textfield>
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</td>
									<td></td>
									<td><label style="font-size:12px;margin-left:20px;"><s:checkbox
												name="oa.status" id="chksend" onclick="return false" />是否已发布</label>
									</td>
								</tr>
								<tr>
									<td colspan="4"><hr style="border:1px solid;" /></td>
								</tr>

								<tr>
									<td colspan="2" style="font-size:14px;text-align:center;">附件上传</td>
									<td colspan="2" style="font-size:14px;text-align:center;">已上传</td>
								</tr>

								<tr>
									<td colspan="2" valign="top"><div id="uploader"
											style="width:300px;">
											<div id="filePicker" style="float:left;font-size:14px;">选择...</div>
											<a onclick="ResetUploader()" href="javascript:void(0);"
												style="float:left;margin:7px;font-size:14px;">重置</a>
											<button id="ctlBtn" type="button" class="btn btn-success"
												style="float:right;height:32px;font-size:14px;">开始上传</button>
											<div id="thelist" class="uploader-list" style="clear:both;"></div>
										</div></td>
									<td colspan="2" valign="top">
										<table style="width:100%;margin:0 auto;font-size:14px;"
											class="table">
											<thead>
												<tr>
													<th style="display: none">id</th>
													<th width="200" style="text-align:center;">名称</th>
													<th style="display: none">路径</th>
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
														<td style="display: none"><s:property
																value="#oafile.filepath" /></td>
														<td width="100" style="text-align:center;"><a
															href='javascript:void(0)' onclick='DeleteAtt(this)'>删除</a></td>
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
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<a href="<%=contextPath%>/travel/user/useroa.jsp" class="btn btn-default">新增数据</a>
						<c:if test="${oa.status!=true}">
							<button type="button" id="btnsave" class="btn btn-primary"
								onclick="SaveOa(0)">保存数据</button>
							<button type="button" id="btnsend"
								style="margin-left:10px;margin-right:10px;"
								class="btn btn-success" onclick="SaveOa(1)">发布数据</button>
							<button type="button" id="btndel" class="btn btn-warning"
								onclick="DeleteOa()">删除数据</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
	<div class="modal fade" id="userModal" role="dialog" aria-labelledby="选择用户" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="width:760px;">
			    <div class="panel-heading" style="text-align:center;">选择用户</div>
				<div class="modal-body">
					<!-- <table class="table">
						<thead><tr><th style='text-align:center;'>选择</th><th  style='display:none;'>id</th><th style='text-align:center;'>姓名</th><th style='text-align:center;'>部门</th></tr></thead>
						<tbody id="tbuser">
						</tbody>
					</table> -->

					<div style="padding-top:0px;">
					<div style="width:230px;float:left;text-align:left;">
					<div style="margin-bottom:20px;" id="currentfoldertext"> 当前部门:</div>
					<ul id="browser" class="filetree">
						<li>
							<span class="folder">所有部门</span>
							<ul id="browserul">
							   <c:forEach var="dept" items="${deptlist}">
										<li class="closed" onclick="folderclick(this)">
											<span class="folder" id="folder${dept.id}">${dept.deptname}</span>
											<label style="display:none;">${dept.id}</label>
											<ul>
											</ul>
										</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
				<div style="float:left;width:460px;margin-top:20px;">
				   <div style="width:90%;height:360px;">
				   		<table align="center" class="table table-hover" id="deptuser"
							style="width:100%;text-align:center;margin-top:20px;font-size:14px;">
								<thead>
									<tr height="26px">
							    		<th style='text-align:center;'> <input type="checkbox" onclick="chktoolselect()"  id="chktool"/></th>
										<th width="100" style="display:none;">ID</th>
										<th width="200">部门</th>
										<th style="text-align:center;" width="120">姓名</th>
									</tr>
								</thead>
								<tbody id="tbdeptuser" >
								</tbody>
							</table>
						</div>
						<span id="userselected">已选中人员：</span>
						<div  style="text-align:center;">
							<a id="firstpage" onclick="showpage(1)" href="javascript:void(0)" >第一页</a> 
							<a id="lastpage"  onclick="showpage(2)" href="javascript:void(0)" >上一页</a> 
							<a id="nextpage"  onclick="showpage(3)" href="javascript:void(0)" >下一页</a>
							<a id="endpage"   onclick="showpage(4)" href="javascript:void(0)" >最后一页</a>
							<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
					</div>
				</div>
			</div>
				</div>
				<div class="modal-footer form-horizontal">
				    <!-- <a type="button" class="btn btn-default" style="float:left;" onclick="SelectAll()">全选</a>
				    <a type="button" class="btn btn-default" style="float:left;" onclick="ReSelect()">反选</a> -->
				    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="UserOKClick()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery-treeview/jquery.treeview.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		var receiverids="";
		var receivernames="";
		var selectuserid=[],selectusername=[];//已选中的用户
		function chktoolselect(){
			chktool
			if($("#chktool").is(":checked")){
				SelectAll();
			}
			else{
				ReSelect();
			}
		}
		function SelectAll() {
			$("#tbdeptuser").find("input[type='checkbox']").prop("checked",true);
		}
		function ReSelect() {
			$("#tbdeptuser").find("input[type='checkbox']").each(function(){
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
			//初始化所有人
			//InitAllUsers();
			//初始化ueditor及内容,实例化编辑器
			/*init webuploader*/
			var $list = $("#thelist"); //上传列表  
			var $btn = $("#ctlBtn"); //开始上传  
			if (!WebUploader.Uploader.support()) {
				alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
				throw new Error('WebUploader does not support the browser you are using.');
			}
			uploader = WebUploader.create({
						// 选完文件后，是否自动上传。  
						auto : false,
						// swf文件路径  
						swf : '<%=contextPath%>/includes/js/webuploader-0.1.5/Uploader.swf',  
			       // 文件接收服务端。  
			       server: '<%=contextPath%>/fileio/upload.action',  
			       // 选择文件的按钮。可选。  
			       // 内部根据当前运行是创建，可能是input元素，也可能是flash.  
			       pick:{
			    	   id:'#filePicker',
			    	   multiple:true
			       },  
			       // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
			       resize: false,
			       //threads:5,
			       method:'POST',
			       //fileVal:'multiFile', 
			       /* formData: {
		                "multi":"1"
		            }, */  
			       fileNumLimit: 5,
			       //duplicate :true,
			       //sendAsBinary:true,
			       //prepareNextFile:true,
			       fileSizeLimit:200*1024*1024,
			       fileSingleSizeLimit:100*1024*1024,
                   chunked: false,  // 分片上传大文件
                   //chunkRetry: 10, // 如果某个分片由于网络问题出错，允许自动重传多少次？
                   threads: 1// 最大上传并发数
			   });  
			   // 当有文件添加进来的时候  
		      uploader.on('fileQueued',
							function(file) { // webuploader事件.当选择文件后，文件被加载到文件队列中，触发该事件。等效于 uploader.onFileueued = function(file){...} ，类似js的事件定义。  
								var $li = $('<div id="' + file.id + '" class="file-item thumbnail">'
										+ '<h4 class="info">'
										+ file.name
										+ '</h4>'
										+ '<span style="font-size:12px;float:left;" class="state" >等待上传...</span><a href="javascript:void(0);" style="float:right;"  onclick=deleteFile("'
										+ file.id + '")>删除</a>' + '<div style="clear:left;"></div></div>');
								// $list为容器jQuery实例  
								$list.append($li);
							});
			// 文件上传过程中创建进度条实时显示。  
			uploader.on('uploadProgress', function(file, percentage) {
				var $li = $('#' + file.id), $percent = $li
						.find('.progress span');
				// 避免重复创建  
				if (!$percent.length) {
					$percent = $('<p class="progress"><span></span></p>')
							.appendTo($li).find('span');
				}
				$percent.css('width', percentage * 100 + '%');
			});
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。  
			uploader.on('uploadSuccess', function(file, response,json) {
				//$('#' + file.id).addClass('upload-state-done');
				if (response.newFileName == "-1") {
					$('#' + file.id).find('.state').css("font-color", "#FF3030");
					$('#' + file.id).find('.state').html("× 上传失败，请重试");
				} else {
					$('#' + file.id).find('.state').css("font-color", "#008B00");
					$('#' + file.id).find('.state').html("√ 上传成功");
					var nrow=GetNewUserRow(file.name,response.newFileName);
					$("#tbattach").append(nrow);
				}
			});

			// 文件上传失败，显示上传出错。  
			uploader.on('uploadError', function(file) {
				var $li = $('#' + file.id), $error = $li.find('div.error');
				// 避免重复创建  
				if (!$error.length) {
					$error = $('<div class="error"></div>').appendTo($li);
				}
				$error.text('上传失败');
			});
			// 完成上传完了，成功或者失败，先删除进度条。  
			/* uploader.on('uploadAccept', function(file,data) {
				//alert(data.success);
				
			}); */ 
			// 完成上传完了，成功或者失败，先删除进度条。  
			uploader.on('uploadComplete', function(file) {
				$('#' + file.id).find('.progress').remove();
			});
			$btn.on('click', function() {
				uploader.upload();
				$("#ctlBtn").addClass('disabled');
			});
			//根据参数判断
			$('.form_date').datetimepicker("setValue");
			//初始化
			$("#browser").treeview({
				unique:true
				/* ,toggle: function() {
					console.log("%s was toggled.", $(this).find(">span").text());
				} */
			});
		});
		function deleteFile(fileid) {
			uploader.removeFile(fileid, true);
			//uploader.removeFile(uploader.getFiles()[i], true);
			//delete uploader.getFiles()[i];
			// 将图片从缩略图容器移除
			var $li = $('#' + fileid);
			$li.off().remove();
		}
		/*关闭上传框窗口后恢复上传框初始状态*/
		function ResetUploader() {        
			// 移除所有缩略图并将上传文件移出上传序列
			$("#ctlBtn").removeClass('disabled');
		    for (var i = 0; i < uploader.getFiles().length; i++) {
		    	// 将图片从上传序列移除
		    	uploader.removeFile(uploader.getFiles()[i],true);
		    	//uploader.removeFile(uploader.getFiles()[i], true);
		    	//delete uploader.getFiles()[i];
		    	// 将图片从缩略图容器移除
		    	var $li = $('#' + uploader.getFiles()[i].id);
		    	$li.off().remove();
		    }
		    //setState('pedding');
		    // 重置文件总个数和总大小
		    //fileCount = 0;
	        //fileSize = 0;
		    // 重置uploader，目前只重置了文件队列
		    uploader.reset();
		    // 更新状态等，重新计算文件总个数和总大小
		    //updateStatus();
		}
		function GetNewUserRow(oldfilename,newfilename) {
			var newRow = "<tr><td  style='display: none'></td>"
					+ "<td  style='text-align:center;'>" + oldfilename + "</td>" + "<td  style='display: none'>"
					+ newfilename + "</td>" 
					+ "<td  style='text-align:center;'>"
					+ "<a href='javascript:void(0)' onclick=DeleteAtt(this)>删除</a>" + "</td></tr>";
			return newRow;
		}
		function DeleteAtt(a){
			var delrow = $(a).parent().parent();//删除用户所在行
			$(delrow).remove();
		}
		function InitAllUsers(){
			var recs=receiverids.split(";");
			$.ajax({
				url : '<%=contextPath%>/user/query.action?param=1',
				type : 'GET',
				// 提交数据给Action传入数据
				//data : {userid:delUserid},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					$.each(data.users, function(index,user){
						var isin=false;
						for(var i=0;i<recs.length;i++){
						   if(recs[i]==user.id){
							   isin=true;
							   break;
						   }	
						}
						var row="";
						if(isin){
							 var row="<tr style='text-align:center;'> <td><input type='checkbox' checked='true' /></td><td style='display:none;'>"+user.id+"</td> <td>"+user.username+"</td><td>"+user.department+"</td></tr>";
						}
						else{
							 var row="<tr style='text-align:center;'> <td><input type='checkbox'  /></td><td style='display:none;'>"+user.id+"</td> <td>"+user.username+"</td><td>"+user.department+"</td></tr>";
						}
					    $("#tbuser").append(row);
					});
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
		function folderclick(li){
			folderid=$(li).find("label").text();
			foldername=$(li).find(">span").text();
			$("#browserul li").css({ "font-weight": "normal" });
			$(li).css({ "font-weight": "bold" });
			$("#currentfoldertext").html("当前部门:"+foldername);
			//查询该文件夹下的文件列表
			$.ajax({
				url : '<%=contextPath%>/user/querydeptuser.action',
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					"deptname" : foldername
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
							 // $("#deptuser").html('');
							  var tbhtml="";
						      for(var i=0;i<data.users.length;i++){
						    	  var row=GetUserRow(data.users[i]);
						    	  tbhtml+=row;
						      }
						      $("#tbdeptuser").html(tbhtml);
						      totalpagenum=data.page.totalPage;
						      currentpagenum=1;
						      $("#pagecount").html("1/"+totalpagenum);
							
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert(XMLHttpRequest.status);
						}
					});
		}
		function GetUserRow(user) {
			var newRow = "<tr style='text-align:center;'> <td><input type='checkbox' onclick=chkuserselect(this,"+user.id+",'"+user.username+"') /></td><td style='display:none;'>"+user.id+"</td> <td>"+user.department+"</td><td>"+user.username+"</td></tr>";
			return newRow;
		}
		function showpage(index){
			//查询该文件夹下的文件列表
			if(index==1){
				currentpagenum=1;
			}
			else if(index==2){
				if(currentpagenum==1){
					return;
				}
				currentpagenum=currentpagenum-1;
			}
			else if(index==3){
				if(currentpagenum==totalpagenum){
					return;
				}
				currentpagenum=currentpagenum+1;
			}
			else if(index==4){
				if(currentpagenum==totalpagenum){
					return;
				}
				currentpagenum=totalpagenum;
			}
			$.ajax({
				url : '<%=contextPath%>/user/querydeptuser.action',
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					"deptname" : foldername
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
							  $("#deptuser").html('');
							  var tbhtml="";
						      for(var i=0;i<data.users.length;i++){
						    	  var row=GetUserRow(data.users[i]);
						    	  tbhtml+=row;
						      }
						      $("#tbdeptuser").html(tbhtml);
						      totalpagenum=data.page.totalPage;
						      currentpagenum=1;
						      $("#pagecount").html("1/"+totalpagenum);
							
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert(XMLHttpRequest.status);
						}
					});
		}
		
		function chkuserselect(chk,userid,username){
			if($(chk).is(":checked")){
				var isexsit=false;
				for(var i=0;i<selectuserid.length;i++){
					if(selectuserid[i]==userid){
						isexsit=true;
						break;
					}
				}
				if(!isexsit){
					selectuserid.push(userid);//插入选中用户id
					selectusername.push(username);//插入选中用户名称
				}
				//$(this).prop("checked",false);
			}
			else{
				//$(this).prop("checked",true);
				for(var i=0;i<selectuserid.length;i++){
					if(selectuserid[i]==userid){
						selectuserid.splice(i,1);
						selectusername.splice(i,1);
					}
				}
			}
			//
			$("#userselected").html(selectusername.join(","));
		}
		function UserOKClick(){
			receiverids=selectuserid.join(";");
			$("#receivers").val(selectusername.join(";"));
		}
	</script>
</body>
</html>
