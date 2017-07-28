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

<title>用户管理</title>

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
<style type="text/css">
#oainfo tr td:first-child span {
	 float: right;
}

#uploader {
	float: left;
	width: 300px;
	margin-left: 30px;
	padding-left: 10px;
	margin-top: 10px;
	margin-bottom: 20px;
}
td{
border:1px solid;
}
</style>
</head>

<body>
   <%@ include file="/portal/headmodal.jsp"%>

	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin:30px;">OA管理：用户工作箱</label>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">OA管理</div>
					<div class="panel-body">
					
							<table id="oainfo">
										
											<tr>
												<td><span>ID</span></td>
												<td><s:textfield class="form-control" id="oaid" name="oa.id"  readonly="true"></s:textfield></td>
											</tr>
											<tr>
												<td><span>标题</span></td>
												<td><s:textfield class="form-control" id="oatitle" name="oa.title"></s:textfield></td>
											</tr>									
											
											<tr>
											    <td><span>内容</span></td>
												<td><s:textarea class="form-control" style="resize: none;margin-bottom:10px;" rows="3" id="oaremark" name="oa.content"></s:textarea></td>
											</tr>
										
									</table>
							
						<div id="uploader">
							<div style="margin-bottom:5px;">
								<label id="uploadmsg" style="margin-left:20px;"></label>
								<s:textfield style="width:100%;" class="form-control input-sm" id="portalpictureurl" readonly="true" name="portal.pictureurl"></s:textfield>
							</div>
							<div id="filePicker" style="float:left;">选择...</div>
							<a onclick="ResetUploader()" href="javascript:void(0);" style="float:left;margin:7px;">全部删除</a>
							<button id="ctlBtn" type="button" class="btn btn-success" style="float:right;height:32px;">开始上传</button>
							<div id="thelist" class="uploader-list" style="clear:both;"></div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	               <table style="font-size:14px;width:100%;">
								<tr style="display: none">
									<td><input type="hidden" id="userid" name="user.id"> id</td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" id="username" name="user.username"></td>
								
									<td style="float:right;line-height: 30px;">用户名</td>
									<td><input class="form-control" id="loginname" name="user.loginname"></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" id="telephone" name="user.telephone"></td>
								    <td style="float:right;line-height: 30px;">部门</td>
									<td><input class="form-control" id="department" name="user.department"></td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="3"><textarea style="resize: none;margin-bottom:10px;" class="form-control" rows="3" id="remark" name="user.remark"></textarea></td>
								</tr>
							</table>
	
	
	<div class="modal fade" id="usermodal" role="dialog"
		aria-labelledby="用户管理" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<label id="modaltitle"></label>
				</div>
				<div class="modal-body" >
					<div style="width:100%;">
						<s:form method="post"	role="form" theme="simple" id="formUser">
							<table style="font-size:14px;width:100%;">
								<tr style="display: none">
									<td><input type="hidden" id="userid" name="user.id"> id</td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" id="username" name="user.username"></td>
								
									<td style="float:right;line-height: 30px;">用户名</td>
									<td><input class="form-control" id="loginname" name="user.loginname"></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" id="telephone" name="user.telephone"></td>
								    <td style="float:right;line-height: 30px;">部门</td>
									<td><input class="form-control" id="department" name="user.department"></td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="3"><textarea style="resize: none;margin-bottom:10px;" class="form-control" rows="3" id="remark" name="user.remark"></textarea></td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
				<div class="modal-footer form-horizontal">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="SaveUser()">保存</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		var isadd = true;
		var updaterow;//更新的行
		var delUserid;//当前删除的用户ID
		var delrow;//要删除的行
		
		function EditUser(a) {
			isadd = false;
			updaterow = $(a).parent().parent();//$("#table1 tr:first td:first").find("input").val()
			var userid = $(updaterow).find("td").eq(0)[0].innerText;//id
			var username = $(updaterow).find("td").eq(1)[0].innerText;//姓名
			var loginname = $(updaterow).find("td").eq(2)[0].innerText;//用户名
			var telephone = $(updaterow).find("td").eq(3)[0].innerText;//电话
			var department = $(updaterow).find("td").eq(4)[0].innerText;//部门
			var remark = $(updaterow).find("td").eq(5)[0].innerText;//备注
			$("#userid").val(userid);
			$("#username").val(username);
			$("#loginname").val(loginname);
			$("#loginname").attr("readonly",true);
			$("#telephone").val(telephone);
			$("#department").val(department);
			$("#remark").val(remark);
			$("#modaltitle").html("编辑用户");
			$("#usermodal").modal("show");
		}
		function SaveUser() {
			if (isadd == true) {
				$.ajax({
					type : "post",
					url : "/travel/user/add.action",
					data : $("#formUser").serialize(),
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.errorMsg == "0") {
							//新增用户
							var newrow=GetNewUserRow(data.user);
							$('#userlist').append(newrow);
							$("#usermodal").modal("hide");
						}
						else if (data.errorMsg == "1") {
							//新增用户
							alert("用户名已存在。");
						}
						else{
							alert(data.errorMsg);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
			} else {
				$.ajax({
					url : '/travel/user/update.action',
					type : 'POST',
					// 提交数据给Action传入数据
					data : $("#formUser").serialize(),
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errorMsg == "0") {
							//新增用户
							var user=data.user;
							$(updaterow).find("td").eq(1).html(user.username);
							$(updaterow).find("td").eq(2).html(user.loginname);
							$(updaterow).find("td").eq(3).html(user.telephone);
							$(updaterow).find("td").eq(4).html(user.department);
							$(updaterow).find("td").eq(5).html(user.remark);
							$("#usermodal").modal("hide");
							//alert("更新完成。");
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
		}
		var uploader;
		$(function(){  
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
			   //初始化ueditor及内容,实例化编辑器
			   /*init webuploader*/  
			   var $list=$("#thelist");    //上传列表  
			   var $btn =$("#ctlBtn");     //开始上传  
			   if ( !WebUploader.Uploader.support() ) {
			        alert( 'Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
			        throw new Error( 'WebUploader does not support the browser you are using.' );
			    }
			   
			   uploader = WebUploader.create({  
			       // 选完文件后，是否自动上传。  
			       auto: false,  
			       // swf文件路径  
			       swf: '<%=contextPath%>includes/js/webuploader-0.1.5/Uploader.swf',  
			       // 文件接收服务端。  
			       server: '/travel/fileio/upload.action',  
			       // 选择文件的按钮。可选。  
			       // 内部根据当前运行是创建，可能是input元素，也可能是flash.  
			       pick: '#filePicker',  
			       // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
			       resize: false,
			       method:'POST',
			       //fileVal:'multiFile', 
			       formData: {
		                "multi":"1"
		            },  
			       fileNumLimit: 5
			   });  
			   // 当有文件添加进来的时候  
		      uploader.on('fileQueued',
							function(file) { // webuploader事件.当选择文件后，文件被加载到文件队列中，触发该事件。等效于 uploader.onFileueued = function(file){...} ，类似js的事件定义。  
								var $li = $('<div id="' + file.id + '" class="file-item thumbnail">'
										+ '<h4 class="info">'
										+ file.name
										+ '</h4>'
										+ '<p class="state">等待上传...<a href="javascript:void(0);" style="margin-left:20px;"  onclick=deleteFile("'
										+ file.id + '")>删除</a></p>' + '</div>');
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
			uploader.on('uploadSuccess', function(file, response) {
				$('#' + file.id).addClass('upload-state-done');
				if (response.newFileName == "-1") {
					$("#uploadmsg").html("(× 上传失败，请重试)");
					$("#uploadmsg").css("font-color", "#FF3030");
				} else {
					$("#uploadmsg").html("(√ 上传成功)");
					$("#uploadmsg").css("color", "#008B00");
					$("#portalpictureurl").val(response.newFileName);
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
			uploader.on('uploadComplete', function(file) {
				$('#' + file.id).find('.progress').remove();
				ResetUploader();//恢复
			});
			$btn.on('click', function() {
				console.log("上传...");
				uploader.upload();
				console.log("上传成功");
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
	</script>
</body>
</html>
