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

<title>通知公告详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="通知公告编辑">
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

body {
	background-color: #f2f2f2;
}

.pageoverlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;
	background-color: #383838;
	filter: alpha(opacity = 60);
	-moz-opacity: 0.6;
	opacity: 0.6;
}
</style>
</head>

<body>
   <%@ include file="/oaadmin/oahead.jsp"%>
   <!-- <div class="pageoverlay"></div> -->
    <div class="contentstyle">
    <div class="toptool">
			<span>当前位置：OA系统>>通知公告
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
	<div class="container" style="width:1056px;background-color:#ffffff;margin:0 auto;margin-bottom:10px;">
		<div class="row">
			<div class="col-md-12" style="text-align:left;margin-top:20px;">
				<div style="width:1024px;margin:0 auto;border-bottom:2px solid #A1A1A1;padding-bottom:12px;padding-left:20px;">
					<span>当前位置：通知公告&gt;&gt; 查看详情  3678 </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin-top:30px;"> ${oa.title}</label>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label> ${oa.pubdatestr}</label>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
			   ${oa.content}
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			   <s:iterator value="oa.oafiles" var="oafile">
						<tr>
							<td style="display: none"><s:property	value="#oafile.id" /></td>
							<td width="200" style="text-align:center;"><s:property	value="#oafile.filename" /></td>
							<td width="100" style="text-align:center;"><a href=' <s:property	value="#oafile.filepath" />'  download="<s:property	value="#oafile.filename" />">下载</a></td>
						</tr>
				</s:iterator>
			</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		$(function() {
			//初始化日期控件
			//receiverids='${oareceivers}';//初始化
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
			//初始化所有人
			//InitAllUsers();
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
						swf : '	<%=contextPath%>includes/js/webuploader-0.1.5/Uploader.swf',  
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
			var recs=receiverids.split(";");
			
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
	</script>
</body>
</html>
