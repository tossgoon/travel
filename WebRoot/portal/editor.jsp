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
<title>Insert title here</title>
<link rel="stylesheet"	href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"	href="<%=contextPath%>includes/css/portal_head_modal.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/webuploader-0.1.5/uploaderdemo.css" />


<style type="text/css">
#portolinfo span {
	float: right;
}

#uploader {
	float: left;
	width: 300px;
	margin-left: 30px;
	padding-left: 10px;
	height: 220px;
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
								<div style="float:left;width:600px;">
									<table id="portolinfo" style="border-collapse:separate; border-spacing:0px 10px;width:100%;">
										<tbody>
											<tr>
												<td><span>ID</span></td>
												<td><input class="form-control" id="portalid" name="portal.id" readonly="readonly"></td>
											</tr>
											<tr>
												<td><span>选择类型</span></td>
												<td><s:select class="form-control" id="portaltype" list="{'工作动态','政策法规','政务公开','科普知识','志愿者之家'}" label="选择类型"
														name="portal.type" onchange="ChangeSelect()"></s:select></td>
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
											
										</tbody>
									</table>
								</div>
								<%-- <div  id="uploader1">
									<div style="margin-bottom:5px;"><label><input type="checkbox">首页图片:	</label>
									<s:textfield style="width:100%;" class="form-control input-sm" id="portalpictureurl" readonly="true" name="portal.pictureurl"></s:textfield>
									</div>
									<div id="filePicker" style="float:left;">选择图片</div>
									<button id="ctlBtn" class="btn btn-success" style="float:right;height:32px;">开始上传</button>
									<div id="thelist" class="uploader-list" style="clear:both;"></div>
									
								</div> --%>


							<div id="uploader" class="wu-example">
		<div class="queueList">
			<div id="dndArea" class="placeholder">
				<div id="filePicker"></div>
				<p>或将照片拖到这里，单次最多可选300张</p>
			</div>
		</div>
		<div class="statusBar" style="display:none;">
			<div class="progress">
				<span class="text">0%</span> <span class="percentage"></span>
			</div>
			<div class="info"></div>
			<div class="btns">
				<div id="filePicker2"></div>
				<div class="uploadBtn">开始上传</div>
			</div>
		</div>
	</div>


						</s:form>
						<script id="editor" type="text/plain"
							style="width:900px;height:600px;margin:0 auto;clear:both;"></script>
					</div>
				</div>
				<div style="margin:0 auto;margin-top:20px;width:1024px;">
					<div style="float:right;">
						<button type="button" class="btn btn-primary"
							onclick="SavePortal()">保存数据</button>
						<button type="button" style="margin-left:10px;margin-right:10px;"
							class="btn btn-success" onclick="PublishPortal()">发布数据</button>
						<button type="button" class="btn btn-warning" onclick="DeletePortal()">删除数据</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	


	<%@ include file="footmodal.jsp"%>
    <script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="<%=contextPath%>includes/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor');
		//保存数据
		function SavePortal()
		{
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
		function ChangeSelect()
		{
			var options=$("#portaltype option:selected");
			var portaltype=options.val();
			if(portaltype=="工作动态"){
				$("#trpicurl").show();
			}
			else{
				$("#trpicurl").hide();
			}
		}
		<%-- $(function(){  
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
			   
			   var uploader = WebUploader.create({  
			       // 选完文件后，是否自动上传。  
			       auto: false,  
			       // swf文件路径  
			       swf: '<%=contextPath%>includes/js/webuploader-0.1.5/Uploader.swf',  
			       // 文件接收服务端。  
			       server: '/travel/portal/test/',  
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
			       fileNumLimit: 300
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
			       $list.append( $li );  
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
			   uploader.on( 'uploadSuccess', function( file ) {  
			       $( '#'+file.id ).addClass('upload-state-done');  
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
			   });  
			   $btn.on( 'click', function() {  
			        console.log("上传...");  
			        uploader.upload();  
			        console.log("上传成功");  
			      });  
			  });  --%>
		
		jQuery(function() {
		    var $ = jQuery,    // just in case. Make sure it's not an other libaray.

		        $wrap = $('#uploader'),

		        // 图片容器
		        $queue = $('<ul class="filelist"></ul>')
		            .appendTo( $wrap.find('.queueList') ),

		        // 状态栏，包括进度和控制按钮
		        $statusBar = $wrap.find('.statusBar'),

		        // 文件总体选择信息。
		        $info = $statusBar.find('.info'),

		        // 上传按钮
		        $upload = $wrap.find('.uploadBtn'),

		        // 没选择文件之前的内容。
		        $placeHolder = $wrap.find('.placeholder'),

		        // 总体进度条
		        $progress = $statusBar.find('.progress').hide(),

		        // 添加的文件数量
		        fileCount = 0,

		        // 添加的文件总大小
		        fileSize = 0,

		        // 优化retina, 在retina下这个值是2
		        ratio = window.devicePixelRatio || 1,

		        // 缩略图大小
		        thumbnailWidth = 110 * ratio,
		        thumbnailHeight = 110 * ratio,

		        // 可能有pedding, ready, uploading, confirm, done.
		        state = 'pedding',

		        // 所有文件的进度信息，key为file id
		        percentages = {},

		        supportTransition = (function(){
		            var s = document.createElement('p').style,
		                r = 'transition' in s ||
		                      'WebkitTransition' in s ||
		                      'MozTransition' in s ||
		                      'msTransition' in s ||
		                      'OTransition' in s;
		            s = null;
		            return r;
		        })(),

		        // WebUploader实例
		        uploader;

		    if ( !WebUploader.Uploader.support() ) {
		        alert( 'Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
		        throw new Error( 'WebUploader does not support the browser you are using.' );
		    }

		    // 实例化
		    uploader = WebUploader.create({
		        pick: {
		            id: '#filePicker',
		            label: '点击选择图片'
		        },
		        dnd: '#uploader .queueList',
		        paste: document.body,

		        accept: {
		            title: 'Images',
		            extensions: 'gif,jpg,jpeg,bmp,png',
		            mimeTypes: 'image/*'
		        },

		        // swf文件路径
		        swf: '<%=contextPath%>includes/js/webuploader-0.1.5/Uploader.swf',  

		        disableGlobalDnd: true,

		        chunked: true,
		        // server: 'http://webuploader.duapp.com/server/fileupload.php',
		        server: 'http://2betop.net/fileupload.php',
		        fileNumLimit: 1,
		        fileSizeLimit: 5 * 1024 * 1024,    // 200 M
		        fileSingleSizeLimit: 1 * 1024 * 1024    // 50 M
		    });

		    // 添加“添加文件”的按钮，
		    uploader.addButton({
		        id: '#filePicker2',
		        label: '继续添加'
		    });

		    // 当有文件添加进来时执行，负责view的创建
		    function addFile( file ) {
		        var $li = $( '<li id="' + file.id + '">' +
		                '<p class="title">' + file.name + '</p>' +
		                '<p class="imgWrap"></p>'+
		                '<p class="progress"><span></span></p>' +
		                '</li>' ),

		            $btns = $('<div class="file-panel">' +
		                '<span class="cancel">删除</span>' +
		                '<span class="rotateRight">向右旋转</span>' +
		                '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
		            $prgress = $li.find('p.progress span'),
		            $wrap = $li.find( 'p.imgWrap' ),
		            $info = $('<p class="error"></p>'),

		            showError = function( code ) {
		                switch( code ) {
		                    case 'exceed_size':
		                        text = '文件大小超出';
		                        break;

		                    case 'interrupt':
		                        text = '上传暂停';
		                        break;

		                    default:
		                        text = '上传失败，请重试';
		                        break;
		                }

		                $info.text( text ).appendTo( $li );
		            };

		        if ( file.getStatus() === 'invalid' ) {
		            showError( file.statusText );
		        } else {
		            // @todo lazyload
		            $wrap.text( '预览中' );
		            uploader.makeThumb( file, function( error, src ) {
		                if ( error ) {
		                    $wrap.text( '不能预览' );
		                    return;
		                }

		                var img = $('<img src="'+src+'">');
		                $wrap.empty().append( img );
		            }, thumbnailWidth, thumbnailHeight );

		            percentages[ file.id ] = [ file.size, 0 ];
		            file.rotation = 0;
		        }

		        file.on('statuschange', function( cur, prev ) {
		            if ( prev === 'progress' ) {
		                $prgress.hide().width(0);
		            } else if ( prev === 'queued' ) {
		                $li.off( 'mouseenter mouseleave' );
		                $btns.remove();
		            }

		            // 成功
		            if ( cur === 'error' || cur === 'invalid' ) {
		                console.log( file.statusText );
		                showError( file.statusText );
		                percentages[ file.id ][ 1 ] = 1;
		            } else if ( cur === 'interrupt' ) {
		                showError( 'interrupt' );
		            } else if ( cur === 'queued' ) {
		                percentages[ file.id ][ 1 ] = 0;
		            } else if ( cur === 'progress' ) {
		                $info.remove();
		                $prgress.css('display', 'block');
		            } else if ( cur === 'complete' ) {
		                $li.append( '<span class="success"></span>' );
		            }

		            $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
		        });

		        $li.on( 'mouseenter', function() {
		            $btns.stop().animate({height: 30});
		        });

		        $li.on( 'mouseleave', function() {
		            $btns.stop().animate({height: 0});
		        });

		        $btns.on( 'click', 'span', function() {
		            var index = $(this).index(),
		                deg;

		            switch ( index ) {
		                case 0:
		                    uploader.removeFile( file );
		                    return;

		                case 1:
		                    file.rotation += 90;
		                    break;

		                case 2:
		                    file.rotation -= 90;
		                    break;
		            }

		            if ( supportTransition ) {
		                deg = 'rotate(' + file.rotation + 'deg)';
		                $wrap.css({
		                    '-webkit-transform': deg,
		                    '-mos-transform': deg,
		                    '-o-transform': deg,
		                    'transform': deg
		                });
		            } else {
		                $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
		                // use jquery animate to rotation
		                // $({
		                //     rotation: rotation
		                // }).animate({
		                //     rotation: file.rotation
		                // }, {
		                //     easing: 'linear',
		                //     step: function( now ) {
		                //         now = now * Math.PI / 180;

		                //         var cos = Math.cos( now ),
		                //             sin = Math.sin( now );

		                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
		                //     }
		                // });
		            }


		        });

		        $li.appendTo( $queue );
		    }

		    // 负责view的销毁
		    function removeFile( file ) {
		        var $li = $('#'+file.id);

		        delete percentages[ file.id ];
		        updateTotalProgress();
		        $li.off().find('.file-panel').off().end().remove();
		    }

		    function updateTotalProgress() {
		        var loaded = 0,
		            total = 0,
		            spans = $progress.children(),
		            percent;

		        $.each( percentages, function( k, v ) {
		            total += v[ 0 ];
		            loaded += v[ 0 ] * v[ 1 ];
		        } );

		        percent = total ? loaded / total : 0;

		        spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
		        spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
		        updateStatus();
		    }

		    function updateStatus() {
		        var text = '', stats;

		        if ( state === 'ready' ) {
		            text = '选中' + fileCount + '张图片，共' +
		                    WebUploader.formatSize( fileSize ) + '。';
		        } else if ( state === 'confirm' ) {
		            stats = uploader.getStats();
		            if ( stats.uploadFailNum ) {
		                text = '已成功上传' + stats.successNum+ '张照片至XX相册，'+
		                    stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
		            }

		        } else {
		            stats = uploader.getStats();
		            text = '共' + fileCount + '张（' +
		                    WebUploader.formatSize( fileSize )  +
		                    '），已上传' + stats.successNum + '张';

		            if ( stats.uploadFailNum ) {
		                text += '，失败' + stats.uploadFailNum + '张';
		            }
		        }

		        $info.html( text );
		    }

		    function setState( val ) {
		        var file, stats;

		        if ( val === state ) {
		            return;
		        }

		        $upload.removeClass( 'state-' + state );
		        $upload.addClass( 'state-' + val );
		        state = val;

		        switch ( state ) {
		            case 'pedding':
		                $placeHolder.removeClass( 'element-invisible' );
		                $queue.parent().removeClass('filled');
		                $queue.hide();
		                $statusBar.addClass( 'element-invisible' );
		                uploader.refresh();
		                break;

		            case 'ready':
		                $placeHolder.addClass( 'element-invisible' );
		                $( '#filePicker2' ).removeClass( 'element-invisible');
		                $queue.parent().addClass('filled');
		                $queue.show();
		                $statusBar.removeClass('element-invisible');
		                uploader.refresh();
		                break;

		            case 'uploading':
		                $( '#filePicker2' ).addClass( 'element-invisible' );
		                $progress.show();
		                $upload.text( '暂停上传' );
		                break;

		            case 'paused':
		                $progress.show();
		                $upload.text( '继续上传' );
		                break;

		            case 'confirm':
		                $progress.hide();
		                $upload.text( '开始上传' ).addClass( 'disabled' );

		                stats = uploader.getStats();
		                if ( stats.successNum && !stats.uploadFailNum ) {
		                    setState( 'finish' );
		                    return;
		                }
		                break;
		            case 'finish':
		                stats = uploader.getStats();
		                if ( stats.successNum ) {
		                    alert( '上传成功' );
		                } else {
		                    // 没有成功的图片，重设
		                    state = 'done';
		                    location.reload();
		                }
		                break;
		        }

		        updateStatus();
		    }

		    uploader.onUploadProgress = function( file, percentage ) {
		        var $li = $('#'+file.id),
		            $percent = $li.find('.progress span');

		        $percent.css( 'width', percentage * 100 + '%' );
		        percentages[ file.id ][ 1 ] = percentage;
		        updateTotalProgress();
		    };

		    uploader.onFileQueued = function( file ) {
		        fileCount++;
		        fileSize += file.size;

		        if ( fileCount === 1 ) {
		            $placeHolder.addClass( 'element-invisible' );
		            $statusBar.show();
		        }

		        addFile( file );
		        setState( 'ready' );
		        updateTotalProgress();
		    };

		    uploader.onFileDequeued = function( file ) {
		        fileCount--;
		        fileSize -= file.size;

		        if ( !fileCount ) {
		            setState( 'pedding' );
		        }

		        removeFile( file );
		        updateTotalProgress();

		    };

		    uploader.on( 'all', function( type ) {
		        var stats;
		        switch( type ) {
		            case 'uploadFinished':
		                setState( 'confirm' );
		                break;

		            case 'startUpload':
		                setState( 'uploading' );
		                break;

		            case 'stopUpload':
		                setState( 'paused' );
		                break;

		        }
		    });

		    uploader.onError = function( code ) {
		        alert( 'Eroor: ' + code );
		    };

		    $upload.on('click', function() {
		        if ( $(this).hasClass( 'disabled' ) ) {
		            return false;
		        }

		        if ( state === 'ready' ) {
		            uploader.upload();
		        } else if ( state === 'paused' ) {
		            uploader.upload();
		        } else if ( state === 'uploading' ) {
		            uploader.stop();
		        }
		    });

		    $info.on( 'click', '.retry', function() {
		        uploader.retry();
		    } );

		    $info.on( 'click', '.ignore', function() {
		        alert( 'todo' );
		    } );

		    $upload.addClass( 'state-' + state );
		    updateTotalProgress();
		});
		
	</script>
</body>
</html>