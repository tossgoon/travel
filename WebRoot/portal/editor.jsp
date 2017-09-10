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
<title>网站编辑</title>
<link rel="stylesheet"	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet"	href="<%=contextPath%>includes/css/portal_head_modal.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/uploaderdemo.css" /> --%>

<style type="text/css">
#portolinfo tr td:first-child span {
	 float: right;
}

#uploader {
	float: left;
	width: 300px;
	margin-left: 30px;
	padding-left: 10px;
	height: 270px;
	border-left: 1px solid #A9A9A9;
	margin-top: 10px;
	margin-bottom: 20px;
}

</style>
</head>
<body>
	<%@ include file="headmodal.jsp"%>
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<label style="font-size:20px;font-weight:normal;margin-top:30px;">网站编辑：新增内容</label>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="width:1024px;margin:0 auto;">
					<div class="panel-heading">新增内容</div>
					<div class="panel-body">
						<s:form role="form" theme="simple" id="formPortalInfo">
								<div style="float:left;width:600px;overflow:hidden">
									<table id="portolinfo" style="border-collapse:separate; border-spacing:0px 10px;width:100%;">
										<tbody>
											<tr>
												<td style="width:120px;"><span>ID</span></td>
												<td><s:textfield class="form-control" id="portalid" name="portal.id"  readonly="true"></s:textfield></td>
											</tr>
											<tr>
												<td><span>选择类型</span></td>
											    <td><s:select class="form-control" id="portaltype"
													list="#{'0':'保护区介绍','1':'工作动态','2':'政策法规','3':'政务公开','8':'保护区防护','4':'志愿者之家','5':'科普知识','6':'联系我们','7':'图片赏析'}"
													label="选择类型" name="portal.type" onchange="ChangeSelect()"></s:select></td>
										    </tr>
											<tr>
												<td><span>主标题</span></td>
												<td><s:textfield class="form-control" id="portaltitle" name="portal.title"></s:textfield></td>
											</tr>
											<tr>
												<td><span>副标题</span></td>
												<td><s:textfield class="form-control" id="portalsubtitle" name="portal.subtitle"></s:textfield></td>
											</tr>
											<tr>
												<td><span>子标题</span></td>
												<td><s:textfield class="form-control" id="portalfoottitle" name="portal.foottitle"></s:textfield></td>
											</tr>
											<tr>
												<td><span>状态</span></td>
												<td><s:select class="form-control" id="portalstatus"
													list="#{'0':'未发布','1':'已发布'}"
													label="选择状态" name="portal.status"></s:select></td>
											</tr>
											<tr>
												<td><span>发布日期</span></td>
												<td>
												 <div class="input-group date form_date" data-date-format="yyyy-mm-dd hh:ii:ss" >
												    <s:textfield class="form-control" id="pubdate">
												     <s:param name="value" ><s:date name="portal.pubdate" format="yyyy-MM-dd HH:mm:ss" /></s:param> 
												    </s:textfield>
												       <span class="input-group-addon"> 
												           <span class="glyphicon glyphicon-calendar"></span>
												       </span>
											       </div>
											  </td>
											</tr>
										</tbody>
									</table>
								</div>
								<div  id="uploader">
									<div style="margin-bottom:5px;"><label>
									<input type="checkbox" id="isshowpicture"
										<c:if test="${portal.isshowpicture==true}">
									        checked="true" 
									    </c:if>
										name="portal.isshowpicture">

										首页图片:	</label><label id="uploadmsg" style="margin-left:20px;"></label>
									<s:textfield style="width:100%;" class="form-control input-sm" id="portalpictureurl" readonly="true" name="portal.pictureurl"></s:textfield>
									</div>
									<div id="filePicker" style="float:left;">选择...</div>
									<a onclick="ResetUploader()" href="javascript:void(0);" style="float:left;margin:7px;">删除选择</a>
									<button id="ctlBtn" type="button" class="btn btn-success" style="float:right;height:32px;">开始上传</button>
									<div id="thelist" class="uploader-list" style="clear:both;"></div>
								</div>
						</s:form>
						<script id="editor" type="text/plain"
							style="width:900px;height:600px;margin:0 auto;clear:both;"></script>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
					    <a href="/travel/portal/editor.jsp" class="btn btn-default">新增数据</a>
						<button type="button" class="btn btn-primary"
							onclick="SavePortal()">保存数据</button>
						<button type="button" class="btn btn-warning" onclick="DeletePortal()">删除数据</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footmodal.jsp"%>
    <script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<%-- <script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webUploaderFeng.js"></script>	
	 --%>
	
	<script type="text/javascript">
		//保存数据
		function SavePortal()
		{
			var isshowpic=$("#isshowpicture")[0].checked;
			$.ajax({
				type : "post",
				url : "/travel/portal/save.action",
				data : 
					{
					  "portal.id":$("#portalid").val(),
					  "portal.type":$("#portaltype").val(),
					  "portal.title":$("#portaltitle").val(),
					  "portal.subtitle":$("#portalsubtitle").val(),
					  "portal.foottitle":$("#portalfoottitle").val(),
					  "portal.isshowpicture":isshowpic,
					  "portal.status":$("#portalstatus").val(),
					  "portal.pubdate":$("#pubdate").val(),
					  "portal.pictureurl":$("#portalpictureurl").val(),
					  "portal.content":ue.getContent()
					},
					//$("#formPortalInfo").serialize(),
				cache : false,
				dataType : "json",
				success : function(data) {
					if (data.errorMsg == "0") {
						//新增用户
						$("#portalid").val(data.portal.id);
						alert("保存成功");
					} else {
						alert(data.errorMsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
		//1代表工作区动态
		function ChangeSelect()
		{
			var options=$("#portaltype option:selected");
			var portaltype=options.val();
			if(portaltype=="1"||portaltype=="7"){
				$("#uploader").show();
			}
			else{
				$("#uploader").hide();
			}
		}
		var uploader;
		var ue = UE.getEditor('editor');
		$(function(){  
			   //初始化ueditor及内容,实例化编辑器
		       //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		       ue.ready(function() {//编辑器初始化完成再赋值  
		            ue.setContent('${portal.content}');  //赋值给UEditor  
		        });  
			   /*init webuploader*/  
			   var $list=$("#thelist");    //上传列表  
			   var ratio = window.devicePixelRatio || 1;
			   var $btn =$("#ctlBtn");     //开始上传  
			   var thumbnailWidth = 100* ratio;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算，具体可以看api文档  
			   var thumbnailHeight = 100* ratio;  
			   
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
			       // 只允许选择图片文件。  
			       accept: {  
			           title: 'Images',  
			           extensions: 'gif,jpg,jpeg,bmp,png',  
			           mimeTypes: 'image/*'
			       },  
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
			    	     $("#portalpictureurl").val(response.newFileName); 
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