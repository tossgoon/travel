<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上传文件详情</title>
<link rel="stylesheet"	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet"	href="<%=contextPath%>includes/css/portal_head_modal.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/uploaderdemo.css" /> --%>

<style type="text/css">
#portolinfo tr td:first-child span {
	 float: right;
}
.rightspan{
    float:right;
}
#uploader {
	width: 100%;
	height: 270px;
}

</style>
</head>
<body>
  <%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;网络硬盘
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
	</div>
	<div class="contentstyle">
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin-top:30px;">网络硬盘：文件详情</label>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">文件详情</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formdiskfile">
								<table id="portolinfo" style="border-collapse:separate; border-spacing:0px 10px;width:100%;">
										<tbody>
											<tr>
												<td style="width:120px;"><span>ID</span></td>
												<td><s:textfield class="form-control" id="diskfileid"  style="width:330px;" name="diskfile.id"  readonly="true"></s:textfield></td>
										        <td><span class="rightspan">上传日期</span></td>
												<td>
												 <div class="input-group date form_date" style="width:330px;" data-date-format="yyyy-mm-dd hh:ii:ss" >
												     	<s:textfield class="form-control" id="uploaddate" >
												     		<s:param name="value" ><s:date name="diskfile.uploaddate" format="yyyy-MM-dd HH:mm:ss" /></s:param> 
												    	</s:textfield>
												       <span class="input-group-addon"> 
												           <span class="glyphicon glyphicon-calendar"></span>
												       </span>
											       </div>
											  </td>
										    </tr>
										    <tr>
											    <td><span class="rightspan">存储目录(*)</span></td>
											    <td><s:select class="form-control" id="foldertype"   style="width:330px;"
													list="folderlist" listKey="id" listValue="name"
													label="选择目录 " name="diskfile.folderid" ></s:select></td>
													<td><span class="rightspan">名称</span></td>
												<td><s:textfield class="form-control"   style="width:330px;" id="diskfilename" name="diskfile.filename"></s:textfield></td>
										    </tr>
											
											<tr>
												<td><span>备注</span></td>
												<td colspan="3"><s:textarea style="width:800px;" id="diskfileremark" class="form-control" name="diskfile.remark"></s:textarea></td>
											</tr>
											<tr>
												<td><span>选择文件</span></td>
												<td colspan="3">										    
												    <div id="filePicker" style="float:left;">点击选择...</div>
													<a onclick="ResetUploader()" href="javascript:void(0);" style="float:left;margin:7px;">删除选择</a>
												</td>
											</tr>
											<tr>
												<td><span>已上传</span></td>
												<td colspan="3">
												    <s:hidden   class="form-control" id="diskfilepath" readonly="true" name="diskfile.filepath"></s:hidden>
												    <s:textfield style="width:55%;float:left;"  class="form-control" id="diskfilerealname" readonly="true" name="diskfile.filerealname"></s:textfield>		   
													<button id="ctlBtn" type="button" class="btn btn-success" style="height:32px;">开始上传</button>
													<a class="btn btn-warning" href=' <s:property	value="diskfile.filepath" />'  download="<s:property	value="diskfile.filerealname" />">下载文件</a>
												</td>
											</tr>
											<tr>
											   <td><label id="uploadmsg" style="margin-left:20px;"></label></td>
											</tr>
										</tbody>
									</table>
									<div  id="uploader">
									    <div id="thelist" class="uploader-list" style="clear:both;"></div>
								   </div>
								   <div style="color:#1874CD;">上传注意事项：1.选择目录。2.选择上传文件后，点击“上传按钮”3.保存数据。上传后重新上传时点击“删除选择”</div>
						</s:form>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
					    <a href="javascript:void(0)" onclick="InsertDiskfile()" class="btn btn-default">新增数据</a>
						<button type="button" class="btn btn-primary"
							onclick="SaveDiskfile()">保存数据</button>
						<button type="button" class="btn btn-warning" onclick="DeleteDiskfile()">删除数据</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/portal/footmodal.jsp"%>
    <script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<%-- <script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webUploaderFeng.js"></script>	
	 --%>
	<script type="text/javascript">
	    //新增数据
	    function InsertDiskfile(){
	    	$("#diskfileid").val('');
			//$("#uploaddate").val('');
			//$("#foldertype").val('');
			$("#diskfilename").val('');
			$("#diskfileremark").val('');
			$("#diskfilepath").val('');
			$("#diskfilerealname").val('');
	    }
		//保存数据
		function SaveDiskfile()
		{
			$.ajax({
				type : "post",
				url : "/travel/oa/savediskfile.action",
				data : {
					"diskfile.id" : $("#diskfileid").val(),
					"diskfile.uploaddate" : $("#uploaddate").val(),
					"diskfile.folderid" : $("#foldertype").val(),
					"diskfile.filename" : $("#diskfilename").val(),
					"diskfile.remark" : $("#diskfileremark").val(),
					"diskfile.filepath" : $("#diskfilepath").val(),
					"diskfile.filerealname" : $("#diskfilerealname").val()
				//,"oa.oafiles":oafiles
				},
				//data : $("#formdiskfile").serialize(),
					//$("#formPortalInfo").serialize(),diskfile
				cache : false,
				dataType : "json",
				success : function(data) {
					if (data.errormsg == "0") {
						//新增用户
						$("#diskfileid").val(data.diskfile.id);
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
		
		function DeleteDiskfile() {
			if ($("#diskfileid").val() != null && $("#diskfileid").val() != "") {
				$.ajax({
					url : '/travel/oa/deletediskfile.action?id=' + $("#diskfileid").val(),
					type : 'POST',
					// 提交数据给Action传入数据
					//data : {userid:delUserid},
					// 返回的数据类型
					dataType : 'json',
					// 成功是调用的方法
					success : function(data) {
						if (data.errormsg == "0") {
							//删除oa
							$("#diskfileid").val('');
							$("#diskfilename").val('');
							$("#diskfileremark").val('');
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
		$(function(){  
			   //初始化ueditor及内容,实例化编辑器
			   /*init webuploader*/  
			   var $list=$("#thelist");    //上传列表  
			   var ratio = window.devicePixelRatio || 1;
			   var $btn =$("#ctlBtn");     //开始上传  
			   var thumbnailWidth = 200* ratio;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算，具体可以看api文档  
			   var thumbnailHeight = 200* ratio;  
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
			       /* // 只允许选择图片文件。  
			       accept: {  
			           title: 'Images',  
			           extensions: 'gif,jpg,jpeg,bmp,png',  
			           mimeTypes: 'image/*'
			       }, */  
			       method:'POST',  
			       fileNumLimit: 1
			   });  
			   // 当有文件添加进来的时候  
			   uploader.on( 'fileQueued', function( file ) {  // webuploader事件.当选择文件后，文件被加载到文件队列中，触发该事件。等效于 uploader.onFileueued = function(file){...} ，类似js的事件定义。  
			       var $li = $(  
			               '<div id="' + file.id + '" class="file-item thumbnail">' +  
			                   '<img>' +  
			                   '<div class="info">' + file.name + '</div>' +  
			               '</div>'  
			               ),  
			           $img = $li.find('img');  
			       // $list为容器jQuery实例  
			       $list.append( $li);  
			       // 创建缩略图  
			       // 如果为非图片文件，可以不用调用此方法。  
			       // thumbnailWidth x thumbnailHeight 为 100 x 100  
			       uploader.makeThumb( file, function( error, src ) {   //webuploader方法  
			           if ( error ) {  
			               $img.replaceWith('<span>不能预览</span>');  
			               return;  
			           }  
			           $img.attr( 'src', src );  
			       }, thumbnailWidth, thumbnailHeight );  
			   });  
			   // 文件上传过程中创建进度条实时显示。  
			   uploader.on( 'uploadProgress', function( file, percentage ) {  
			       var $li = $( '#'+file.id ),  
			           $percent = $li.find('.progress span');  
			       // 避免重复创建  
			       if ( !$percent.length ) {  
			           $percent = $('<p class="progress"><span></span></p>')  
			                   .appendTo( $li )  
			                   .find('span');  
			       }  
			       $percent.css( 'width', percentage * 100 + '%' );  
			   });  
			   // 文件上传成功，给item添加成功class, 用样式标记上传成功。  
			   uploader.on( 'uploadSuccess', function( file,response ) {  
			       $( '#'+file.id ).addClass('upload-state-done'); 
			       if(response.newFileName=="-1")
			    	   {
			    	     $("#uploadmsg").html("(× 上传失败，请重试)");
			    	     $("#uploadmsg").css("font-color","#FF3030");
			    	   }
			       else
			    	   {
			    	     $("#uploadmsg").html("(√ 上传成功)");
			    	     $("#uploadmsg").css("color","#008B00");
			    	     $("#diskfilepath").val(response.newFileName);
			    	     $("#diskfilerealname").val(file.name);
			    	     //$('#uploader-demo').append('<input  type="text" name="fileUrl" value="'+data.name+'"/>');
			    	     //$( '#'+file.id ).addClass('upload-state-done');
			    	   }
			   });  
			   // 文件上传失败，显示上传出错。  
			   uploader.on( 'uploadError', function( file ) {  
			       var $li = $( '#'+file.id ),  
			           $error = $li.find('div.error');  
			       // 避免重复创建  
			       if ( !$error.length ) {  
			           $error = $('<div class="error"></div>').appendTo( $li );  
			       }  
			       $error.text('上传失败');  
			   });  
			   // 完成上传完了，成功或者失败，先删除进度条。  
			   uploader.on( 'uploadComplete', function( file ) {  
			       $( '#'+file.id ).find('.progress').remove();  
			       ResetUploader();//恢复
			   });  
			   $btn.on( 'click', function() {  
			        console.log("上传...");  
			        uploader.upload();  
			        console.log("上传成功");  
			      });
			   //根据参数判断
			   $('.form_date').datetimepicker("setValue");
			   
			  }); 

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
			/* function GetQueryString(name)
			{
			     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  unescape(r[2]); return null;
			} */
			//$('.form_date').datetimepicker("setValue");
	</script>
</body>
</html>