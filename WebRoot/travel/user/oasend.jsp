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

<title>我的发送</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="我的发送">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/portal_head_modal.css">
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<style type="text/css">
#oainfo tr td:first-child span {
	 float: right;
}
body{
background-color: rgb(226, 252, 231);
}
</style>
</head>

<body>
   <%@ include file="/portal/headmodal.jsp"%>
	<div class="container" style="width:1024px;margin:0 auto;background-color:#ffffff;margin-top:20px;">
		
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:100%;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：OA管理>>我的工作箱>>我的发送/&nbsp;&nbsp;<a href="/travel/oa/queryreceive.action">我的事务</a>
					  </span>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin:30px;">用户工作箱：我的发送</label>
			</div>
		</div>
		<div class="row" >
		
		<div class="col-md-12" style="text-align:center;">
		
			<div class="panel panel-default">
				<div class="panel-body">
					
						<s:form action="querysend" namespace="/oa" class="form-inline"
							method="post" theme="simple">
							<span style="float:left;margin-left:30px;margin-top:5px;">标题：</span>
							<div class="input-group"
								style="width:360px;float:left;margin-bottom:20px;">
								<input class="form-control" type="text" name="queryText"
									value="${searchText}" /> <span class="input-group-btn">
									<input type="submit" class="btn btn-default" value="查询" />
								</span>
							</div>
							<!-- /input-group -->
							<div style="margin-left:5px;float:left;margin-left:20px;">
								<a href="/travel/travel/user/useroa.jsp" type="button"
									class="btn btn-primary">新增</a>
							</div>
						</s:form>

						<table align="center" class="table" cellpadding="0" cellspacing="0"
							 id="userlist"
							style="margin-top:20px;clear:both;width:100%;">
							<tr align="center"  height="26px">
								<td width="50">ID</td>
								<td width="260">标题</td>
								<td width="100">发布日期</td>
								<td width="100">状态</td>
								<td width="100">操作</td>
							</tr>

							<c:forEach var="oa" items="${oasendlist}">
								<tr align="center" height="24px" style="font-size:14px;">
									<td>${oa.id}</td>
									<td>${oa.title}</td>
									<td>${oa.pubdatestr}</td>
									<td><c:if test="${oa.status!=true}">
											未发布
										</c:if> <c:if test="${oa.status==true}">
											已发布
										</c:if></td>
									<td><c:if test="${oa.status!=true}">
											<a href="/travel/oa/modify.action?id=${oa.id}"
												style="margin-right:10px;">更改</a>
											<a href="javascript:void(0)"
												onclick="DeleteOa(${oa.id},this)">删除</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
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
				url : "/travel/oa/save.action",
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
		
		function DeleteOa(id, a) {
			if (confirm('是否删除?')) {
				$.ajax({
					url : '/travel/oa/delete.action?id=' + id,
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errorMsg == "0") {
							//删除oa
							var delrow = $(a).parent().parent();//删除用户所在行
							$(delrow).remove();
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
			InitAllUsers();
			//初始化ueditor及内容,实例化编辑器
			/*init webuploader*/
			var $list = $("#thelist"); //上传列表  
			var $btn = $("#ctlBtn"); //开始上传  
			if (!WebUploader.Uploader.support()) {
				alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
				throw new Error(
						'WebUploader does not support the browser you are using.');
			}
			uploader = WebUploader
					.create({
						// 选完文件后，是否自动上传。  
						auto : false,
						// swf文件路径  
						swf : '<%=contextPath%>includes/js/webuploader-0.1.5/Uploader.swf',  
			       // 文件接收服务端。  
			       server: '/travel/fileio/upload.action',  
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
			$.ajax({
				url : '/travel/user/query.action?param=1',
				type : 'GET',
				// 提交数据给Action传入数据
				//data : {userid:delUserid},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					$.each(data.users, function(index,user){
					    var row="<tr style='text-align:center;'> <td><input type='checkbox' /></td><td style='display:none;'>"+user.id+"</td> <td>"+user.username+"</td><td>"+user.department+"</td></tr>";
					    $("#tbuser").append(row);
					});
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
	</script>
</body>
</html>
