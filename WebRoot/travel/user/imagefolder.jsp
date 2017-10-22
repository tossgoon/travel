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

<title>OA系统-保护区巡护照片</title>

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
<link rel="stylesheet" href="<%=contextPath%>/includes/css/oastyle.css" />
<%-- <link rel="stylesheet" href="<%=contextPath%>includes/js/JQuery_zTree_v3.2/css/zTreeStyle/zTreeStyle.css" /> --%>
<link rel="stylesheet" href="<%=contextPath%>/includes/js/jquery-treeview/jquery.treeview.css" />
</head>
<style type="text/css">
body{
	background-color: #f2f2f2;
}
td{
text-align:center;
}
th{
text-align:center;
}
</style>
<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;保护区巡护照片
			</span> 
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
	</div>
	<div class="contentstyle">
		<div class="maincontent">
			<div class="leftpanel" >
				<ul>
					<li><a href="<%=contextPath%>/oa/queryfolderlist.action?ptype=1" target="_blank">网络硬盘</a></li>
					<li class="activeli"><a href="javascript:void(0)">巡护图片</a></li>
					<li><a href="<%=contextPath%>/user/queryuinfo.action" target="_blank">个人账户管理</a></li>
				</ul>
			</div>
			<div class="rightpanel" style="padding-top:30px;">
				<div style="width:260px;float:left;text-align:left;">
					<div style="margin-bottom:20px;">
						<a href="javascript:void(0);" onclick="InsertFolder()" class="btn btn-default btn-sm">新增目录</a>
						<a href="javascript:void(0);" onclick="EditFolder()" class="btn btn-warning btn-sm">修改目录</a>
						<!-- <button type="button" class="btn btn-warning btn-sm" onclick="DeletePortal()">删除目录</button> -->
					</div>
					<div style="margin-bottom:20px;" id="currentfoldertext"> 当前目录 :${currentfolder.name} </div>
					<ul id="browser" class="filetree">
						<li>
							<span class="folder">巡护照片</span>
							<ul id="browserul">
							   <c:forEach var="folder" items="${foldertypelist}">
										<li class="closed" onclick="folderclick(this)">
											<span class="folder" id="folder${folder.id}">${folder.name}</span>
											<label style="display:none;">${folder.id}</label>
											<ul>
											</ul>
										</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
				<div style="float:left;width:560px;">
				
				<div style="height:500px;">
				   <div style="padding-bottom:30px;"><a id="newfile" onclick="NewFile()" target="_blank" class="btn btn-success btn-sm" style="float:right;">新增文件</a></div>
				   <div style="width:90%;">
				   <table align="center" class="table table-hover" id="filelist"
							style="width:100%;text-align:center;margin-top:20px;font-size:14px;">
							<thead>
							<tr height="26px">
								<th width="100" style="display:none;">ID</th>
								<th style="text-align:center;" width="320">名称</th>
								<th width="160">日期</th>
								<th width="120">操作</th>
							</tr>
							</thead>
							<tbody id="tbdiskfile" >
							</tbody>
						</table></div>
						</div>
						<div>
						<a id="firstpage" onclick="showpage(1)" href="javascript:void(0)" >第一页</a> 
						<a id="lastpage"  onclick="showpage(2)" href="javascript:void(0)" >上一页</a> 
						<a id="nextpage"  onclick="showpage(3)" href="javascript:void(0)" >下一页</a>
						<a id="endpage"   onclick="showpage(4)" href="javascript:void(0)" >最后一页</a>
						<label id="pagecount"> ${page.currentPage }/${page.totalPage }</label>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div class="modal fade" id="folderinfo" role="dialog" aria-labelledby="文件夹编辑" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="width:460px;">
			    <div class="modal-header" id="foldertitle">文件夹编辑</div>
				<div class="modal-body">
					<table style="font-size:14px;width:100%;">
						<tr>
							<td>文件夹名称：</td>
							<td><input class="form-control" id="foldername">   </td>
						</tr>
					</table>
				</div>
				<div class="modal-footer form-horizontal">
				    <button type="button" class="btn btn-success" onclick="SaveFolder()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
    <%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/JQuery_zTree_v3.2/js/jquery.ztree.core-3.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery-treeview/jquery.treeview.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>	
	<script type="text/javascript">
	var folderid='';
	var foldername='';
	var currentpagenum=1;//当前页码
	var totalpagenum=10;//总页码
	$(document).ready(function(){
		//folderid= ${folderid};
		$("#browser").treeview({
			unique:true
			/* ,toggle: function() {
				console.log("%s was toggled.", $(this).find(">span").text());
			} */
		});
		//$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		/* $("#add").click(function() {
			var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
				"<li><span class='file'>Item1</span></li>" +
				"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
			$("#browser").treeview({
				add: branches
			});
		}); */
		
	});
	function NewFile(){
		if(folderid!=null&&folderid!=undefined&&folderid!=""){
			document.getElementById("newfile").href="<%=contextPath%>/oa/querydiskfile.action?ptype=2&folderid="+folderid;
		}
		else{
			document.getElementById("newfile").href="<%=contextPath%>/oa/querydiskfile.action?ptype=2";
		}
	}
	function folderclick(li){
		folderid=$(li).find("label").text();
		foldername=$(li).find(">span").text();
		$("#browserul li").css({ "font-weight": "normal" });
		$(li).css({ "font-weight": "bold" });
		$("#currentfoldertext").html("当前目录:"+foldername);
		//查询该文件夹下的文件列表
		$.ajax({
			url : '<%=contextPath%>/oa/querydiskfilelist.action',
			type : 'GET',
			// 提交数据给Action传入数据
			data : {
				"ptype":2,
				"folderid" : folderid
			},
			// 返回的数据类型
			dataType : 'json',
			// 成功是调用的方法
			success : function(data) {
					if (data.errormsg == "0") {
						  $("#tbdiskfile").html('');
						  var tbhtml="";
					      for(var i=0;i<data.diskfilelist.length;i++){
					    	  var row=GetDiskfileRow(data.diskfilelist[i]);
					    	  tbhtml+=row;
					      }
					      $("#tbdiskfile").html(tbhtml);
					      totalpagenum=data.page.totalPage;
					      currentpagenum=1;
					      $("#pagecount").html("1/"+totalpagenum);
						} else {
							alert(data.errormsg);
						}
					},
					error : function(XMLHttpRequest, textStatus,
							errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
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
			url : '<%=contextPath%>/oa/querydiskfilelist.action',
			type : 'GET',
			// 提交数据给Action传入数据
			data : {
				"ptype":2,
				"folderid" : folderid,
				"pagesize":3,
				"pagenum":currentpagenum
			},
			// 返回的数据类型
			dataType : 'json',
			// 成功是调用的方法
			success : function(data) {
					if (data.errormsg == "0") {
						  $("#tbdiskfile").html('');
						  var tbhtml="";
					      for(var i=0;i<data.diskfilelist.length;i++){
					    	  var row=GetDiskfileRow(data.diskfilelist[i]);
					    	  tbhtml+=row;
					      }
					      $("#tbdiskfile").html(tbhtml);
					      $("#pagecount").html(currentpagenum+"/"+totalpagenum);
						} else {
							alert(data.errormsg);
						}
					},
					error : function(XMLHttpRequest, textStatus,
							errorThrown) {
						alert(XMLHttpRequest.status);
					}
				});
	}

	function GetDiskfileRow(diskfile){
		var row = "<tr>"
			+ "<td  style='text-align:center;'>" + diskfile.filerealname + "</td>" 
			+ "<td  style='text-align:center;'>" + diskfile.uploaddateStr + "</td>" 
			+ "<td  style='text-align:center;'>"
			+ "<a href='"+diskfile.filepath+"' download='"+diskfile.filerealname+"' >下载</a>&nbsp;&nbsp;&nbsp;&nbsp;" 
			+ "<a href='<%=contextPath%>/oa/querydiskfile.action?ptype=2&id="+diskfile.id+"'>查看</a>"+
					"</td></tr>";
	    return row;
	}
	function InsertFolder() {
		isadd = true;
		$("#foldertitle").html("新增文件夹");
		$("#foldername").val('');
		$("#folderinfo").modal("show");
	}
	function EditFolder(a) {
		isadd = false;
		$("#foldertitle").html("编辑文件夹");
		$("#foldername").val(foldername);
		$("#folderinfo").modal("show");
	}
	function SaveFolder(){
		foldername=$("#foldername").val();
		var cfolderid="";
		if(isadd){
			cfolderid="";
		}
		else{
			cfolderid=folderid;
		}
		$.ajax({
				url : '<%=contextPath%>/oa/savefolder.action',
				type : 'POST',
				// 提交数据给Action传入数据
				data : {
					"ptype":2,
					"foldertype.id" : cfolderid,
					"foldertype.name" : foldername
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.errormsg == "0") {
						if (isadd) {
									//新增节点
									alert("新增完成。");
									var branches = $(
											"<li class='closed' onclick='folderclick(this)'><span class='folder' id='folder"+data.foldertype.id+"'>"
													+ foldername
													+ "</span><label style='display:none'>"
													+ data.foldertype.id
													+ "</label><ul></ul></li>")
											.appendTo("#browserul");
									$("#browser").treeview({
										unique:true,
										add : branches
									});
								}
								else{
									alert("保存完成。");
							        $("#folder"+folderid).html(foldername);
								}
							$("#folderinfo").modal("hide");
							} else {
								alert(data.errormsg);
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert(XMLHttpRequest.status);
						}
					});
		}
	</script>
</body>
</html>
