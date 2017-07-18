<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
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
<title>勘察工程信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="勘察工程信息">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/uploadifive/uploadifive.css" />
<style type="text/css">
.navtext {
	width: 100%;
	height: 50px;
	background: 0px 0px rgb(130, 191, 239);
	border-bottom: 1px solid;
	text-align: center;
	padding-top: 10px;
}

.navtext h3 {
	margin: 0px;
	color: rgb(255, 255, 255);
	font-family: "Microsoft Yahei";
}

body {
	min-width: 600px;
}

#tbkcinfo {
	border-collapse: separate;
	border-spacing: 0px 5px;
	text-align: right;
	font-size: 14px;
	font-family: "Microsoft Yahei", "微软雅黑", "Pinghei";
}

#tbkcinfo td {
	min-width: 100px;
}

.modal.fade.in {
	top: 25%;
}

#siteModal label {
	font-weight: normal;
}



#myPageTop {
	position: absolute;
	top: 5px;
	right: 10px;
	background: #fff none repeat scroll 0 0;
	border: 1px solid #ccc;
	margin: 10px auto;
	padding: 6px;
	font-family: "Microsoft Yahei", "微软雅黑", "Pinghei";
	font-size: 14px;
	z-index: 9999;
}

#myPageTop label {
	margin: 0 20px 0 0;
	color: #666666;
	font-weight: normal;
}

.amap-sug-result {
	z-index: 9999;
}
</style>
</head>
<body onload="initialize()">
	<div class="navtext">
		<h3>机勘院技术资料信息系统</h3>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-xs-12">
						<s:form action="update?param=1" namespace="/kc" method="post" role="form" theme="simple" id="formGcinfo">
							<table id="tbkcinfo">
								<tbody>
									<tr>
										<td>工程名称</td>
										<td colspan="3"><s:textfield class="form-control" name="kcgc.name"></s:textfield> <s:hidden id="gcid" class="form-control"
												name="kcgc.id"></s:hidden></td>
										<td>档案号</td>
										<td><s:textfield class="form-control" name="kcgc.danganhao"></s:textfield></td>
									</tr>
									<tr>
										<td>工程地点</td>
										<td colspan="5"><s:textarea class="form-control" rows="2" style="word-wrap: normal; resize: none;" name="kcgc.jutiweizhi "></s:textarea>
										</td>
									</tr>
									<tr>
										<td>勘察单位</td>
										<td colspan="5"><s:textfield class="form-control" name="kcgc.danwei"></s:textfield></td>
									</tr>
									<tr>
										<td>建设单位</td>
										<td colspan="5"><s:textfield class="form-control" name="kcgc.jianshedanwei"></s:textfield></td>
									</tr>
									<tr>
										<td>设计单位</td>
										<td colspan="5"><s:textfield class="form-control" name="kcgc.shejidanwei"></s:textfield></td>
									</tr>
									<tr>
										<td>项目负责</td>
										<td><s:textfield class="form-control" name="kcgc.xiangmufuze"></s:textfield></td>
										<td>区域</td>
										<td><s:textfield class="form-control" name="kcgc.quyu"></s:textfield></td>
										<td>建筑层数</td>
										<td><s:textfield class="form-control" name="kcgc.jianzhucengshu"></s:textfield></td>
									</tr>
									<tr>
										<td>建筑用途</td>
										<td><s:textfield class="form-control" name="kcgc.jianzhuyongtu"></s:textfield></td>
										<td>结构类型</td>
										<td><s:textfield class="form-control" name="kcgc.jiegouleixing"></s:textfield></td>
										<td>基础形式</td>
										<td><s:textfield class="form-control" name="kcgc.jichuxingshi"></s:textfield></td>
									</tr>
									<tr>
										<td>审核人</td>
										<td><s:textfield class="form-control" name="kcgc.shenheren"></s:textfield></td>
										<td>复审人</td>
										<td><s:textfield class="form-control" name="kcgc.fushenren "></s:textfield></td>
										<td>审定人</td>
										<td><s:textfield class="form-control" name="kcgc.shendingren "></s:textfield></td>
									</tr>
									<tr>
										<td>湿陷下限深度</td>
										<td><s:textfield class="form-control" name="kcgc.shixianXiaxianshendu"></s:textfield></td>
										<td>起始日期</td>
										<td>
											<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
												<s:textfield class="form-control" name="kcgc.beginDate" value="%{kcgc.beginDateStr}"></s:textfield>
												<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>
											</div>
										</td>
										<td>终止日期</td>
										<td>
											<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
												<s:textfield class="form-control" name="kcgc.endDate" value="%{kcgc.endDateStr}"></s:textfield>
												<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>
											</div>
										</td>
									</tr>
									<tr>
										<td>总孔数</td>
										<td><s:textfield class="form-control" name="kcgc.zongkongshu"></s:textfield></td>
										<td>液化孔数</td>
										<td><s:textfield class="form-control" name="kcgc.yehuakongshu"></s:textfield></td>
										<td>液化等级</td>
										<td><s:textfield class="form-control" name="kcgc.yehuadengji"></s:textfield></td>
									</tr>
									<tr>
										<td>建筑场地类别</td>
										<td><s:select class="form-control" list="{'','Ⅰ0','Ⅰ1','Ⅱ','Ⅲ','Ⅳ','Ⅰ(2001标准)'}" label="选择场地" name="kcgc.changdileibie"></s:select></td>
										<td>平面坐标系</td>
										<td><s:select class="form-control" list="{'','经纬度坐标系','西安市建筑坐标系','国家2000坐标系','其他'}" label="选择坐标系" name="kcgc.planeCoorsystem"></s:select>
										</td>
										<td>高程坐标系</td>
										<td><s:select class="form-control" list="{'','56黄海高程系','85国家高程系','独立高程系','其他','不确定的国家高程系'}" label="选择坐标系" name="kcgc.eleCoorsystem"></s:select>
										</td>
									</tr>
									<tr>
										<td>黄土规范</td>
										<td><s:select class="form-control" list="{'','04规范','90规范','78规范','66规范'}" label="选择黄土规范" name="kcgc.huangtuguifan"></s:select></td>
										<td>湿陷等级</td>
										<td><s:select class="form-control" list="{'','Ⅰ','Ⅱ','Ⅲ','Ⅳ'}" label="选择湿陷等级" name="kcgc.shixiandengji"></s:select></td>
										<td>抗震规范</td>
										<td><s:select class="form-control" list="{'','10规范','01规范','89规范','78规范'}" label="选择抗震规范" name="kcgc.kangzhenguifan"></s:select></td>
									</tr>
									<tr>
										<td>场地类型选择</td>
										<td colspan="5">
											<div class="input-group" style="width:100%;">
												<s:textfield class="form-control" name="kcgc.siteType" id="siteType"></s:textfield>
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" data-toggle="modal" data-target="#siteModal" id="btnSelectSite" onclick="OpenSiteDlg()">...</button>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>备注</td>
										<td colspan="5"><s:textarea class="form-control" rows="2" style="word-wrap: normal; resize: none;" name="kcgc.beizhu"></s:textarea></td>
									</tr>
									<tr>
										<td>工程属性</td>
										<td colspan="5"><s:textfield class="form-control" name="kcgc.gcshuxing"></s:textfield></td>
									</tr>
									<tr>
										<td>行业分类</td>
										<td><s:select class="form-control" list="{'','民用建筑','工业工程','交通工程','能源环境'}" label="选择行业" name="kcgc.industry"></s:select></td>
										<td>项目规模</td>
										<td><s:select class="form-control" list="{'','小规模','中等规模','大规模'}" label="选择规模" name="kcgc.scale"></s:select></td>
										<td>勘察等级</td>
										<td><s:select class="form-control" list="{'','甲','乙','丙'}" label="选择等级" name="kcgc.kcLevel"></s:select></td>
									</tr>
									<tr>
										<td>工程描述(结论)</td>
										<td colspan="5"><s:textarea class="form-control" rows="3" style="word-wrap: normal; resize: none;" name="kcgc.gcmiaoshu"></s:textarea>
										</td>
									</tr>
									<!-- <tr id="gcTypeRow" style="display: none">
										<td>线性工程类型</td>
										<td colspan="2"><input id="CheckBoxIsXianXing" type="checkbox" />是线性工程 <a href="#"
												onclick="OpenMapWin(document.getElementById('CheckBoxIsXianXing').checked,'CheckBoxIsXianXing','TextBoxGCCoords','map_canvas','formCoordsInput')">
												选择坐标</a></td>
									</tr> -->
									<tr>
										<td>经度:</td>
										<td><s:textfield class="form-control" name="kcgc.lat" id="gcLat"></s:textfield></td>
										<td>经度:</td>
										<td><s:textfield class="form-control" name="kcgc.lng" id="gcLng"></s:textfield></td>
										<td><a href="#" data-toggle="modal" data-target="#coordModal">选择坐标</a></td>
									</tr>
									<tr style="display:none">
										<td>纬度gcj02:</td>
										<td><s:textfield class="form-control" name="kcgc.latGCJ02" id="gcLatGCJ02"></s:textfield></td>
										<td>经度gcj02:</td>
										<td><s:textfield class="form-control" name="kcgc.lngGCJ02" id="gcLngGCJ02"></s:textfield></td>
									</tr>

									<tr>
										<td>上传日期</td>
										<td><input type="text" class="form-control" value="${kcgc.uploadDateStr }" /></td>
									</tr>
									<tr>
										<td colspan="6"><hr></td>
									</tr>
									<tr>
										<td colspan="6"><button type="button" class="btn btn-primary" onclick="EditGCinfo(true)">编辑工程</button>
											<button type="button" style="margin-left:10px;margin-right:10px;" class="btn btn-success" onclick="SaveGcInfo()">保存工程</button>
											<button type="button" class="btn btn-warning" onclick="DeleteGC()">删除工程</button> <a style="padding-left: 10px;" data-toggle="modal"
												data-target="#zklistModal" href="#"> 列出该工程钻孔</a>
											<div class="modal fade" id="zklistModal" role="dialog" aria-labelledby="选择坐标" data-backdrop="static">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-body">
															<table class="table table-hover">
																<tr>
																<th>钻孔编号</th>
																<th>深度(m)</th>
																<th>详细信息</th>
																</tr>
																<s:iterator value="kczks" var="zk">
																	<tr>
																		<td><s:property value="#zk.bianhao" /></td>
																		<td><s:property value="#zk.zkDepth" /></td>
																		<td><s:property value="#zk.id" /></td>
																	</tr>
																</s:iterator>
															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div></td>
									</tr>
									<tr>
										<td colspan="6"><hr></td>
									</tr>
								</tbody>
							</table>
						</s:form>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="panel panel-info" style="margin-top:10px;">
								<div class="panel-heading">
									<h3 class="panel-title">项目附件</h3>
								</div>
								<div class="panel-body">
									<div style="width:100%;">
										<div class="row">
											<div class="col-xs-7">
												<input type="file" id="file_upload" name="file_upload" style="display:none;" />
											</div>
											<div class="col-xs-5">
												<a class="btn btn-info" style="width:80px;margin-left:20px;height:30px;" href="javascript:UploadAttachment();">上传</a>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<div id="uploadfileQueue"></div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<hr style="height:10px;border:none;border-top:2px solid #87CEFA;" />
												<table class="table table-hover" id="attTable">

													<thead>
														<tr>
															<th style="display:none"></th>
															<th style="width:55%;">附件名称</th>
															<th>类型</th>
															<th style="width:25%;">上传日期</th>
															<th>下载</th>
															<th><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></th>
														</tr>
													</thead>
													<tbody id="attBody">
													</tbody>
												</table>
											</div>
										</div>
										<div class="row" style="padding-left:20px;">
											<hr />
											<input type="checkbox" id="checkAllowDownLoad" />
											<label for="checkAllowDownLoad">不允许下载附件</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="panel panel-success" style="margin-top:10px;">
						<div class="panel-heading">
							<h3 class="panel-title">项目评论（写下对此项目信息的评论）</h3>
						</div>
						<div class="panel-body">
							<div style="width:100%;">
								<div class="row">
									<div class="col-xs-12">
										<textarea class="form-control" id="newComment" name="gccomm.CommContent" rows="3" style="word-wrap: normal; resize: none;"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<input value="提交" onclick="AjaxNewComment()" type="button" class="btn btn-success" style="margin:5px;float:right;width:80px;" />
									</div>
								</div>
								<div class="row">
									<hr />
									<table id="gccomments" style="width:100%;">
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="modal fade" id="siteModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">请选择场地类型</h4>
				</div>
				<div class="modal-body">
					<div class="container" style="width:100%;">
						<div class="row">
							<div class="col-xs-4">
								<input id="checkZiZSXXHT" type="checkbox" value="自重湿陷黄土场地" />
								<label for="checkZiZSXXHT">自重湿陷黄土场地</label>
							</div>
							<div class="col-xs-4">
								<input id="checkGongCDZ" type="checkbox" value="工程地质分区" />
								<label for="checkGongCDZ">工程地质分区</label>
							</div>
							<div class="col-xs-4">
								<input id="checkWuRT" type="checkbox" value="污染土场地" />
								<label for="checkWuRT">污染土场地</label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4 col-md-4">
								<input id="checkYeH" type="checkbox" value="液化土场地" />
								<label for="checkYeH">液化土场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkFeiZZSXXHT" type="checkbox" value="非自重湿陷黄土场地" />
								<label for="checkFeiZZSXXHT">非自重湿陷黄土场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkYanZT" type="checkbox" value="盐渍土场地" />
								<label for="checkYanZT">盐渍土场地</label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4 col-md-4">
								<input id="checkPengZT" type="checkbox" value="膨胀土场地" />
								<label for="checkPengZT">膨胀土场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkYanR" type="checkbox" value="岩溶场地" />
								<label for="checkYanR">岩溶场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkBaoHHT" type="checkbox" value="饱和黄土场地" />
								<label for="checkBaoHHT">饱和黄土场地</label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4 col-md-4">
								<input id="checkRenGTT" type="checkbox" value="人工填土场地" />
								<label for="checkRenGTT">人工填土场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkFeiShiXianXHTCD" type="checkbox" value="非湿陷性黄土场地" />
								<label for="checkFeiShiXianXHTCD">非湿陷性黄土场地</label>
							</div>
							<div class="col-xs-4 col-md-4">
								<input id="checkHongNT" type="checkbox" value="红粘土场地" />
								<label for="checkHongNT">红粘土场地</label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4 col-md-4">
								<input id="checkDiLF" type="checkbox" value="地裂缝场地" />
								<label for="checkDiLF">地裂缝场地</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="SiteTypeOk()">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="coordModal" role="dialog" aria-labelledby="选择坐标" data-backdrop="static" style="margin-top:-90px;">
		<div class="modal-dialog" style="width:900px;">
			<div class="modal-content">
				<div class="modal-body" style="height:450px;padding:0px;">
					<div id="map_canvas" style="width:100%;height:100%;"></div>
					<div id="myPageTop">
						<table>
							<tr>
								<td><label>输入关键字查询:</label></td>
							</tr>
							<tr>
								<td><input id="tipinput" class="form-control input-sm" /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer form-horizontal">
					<table>
						<tr>
							<td>地图上点击查询坐标</td>
							<td style="padding-left:80px;">经度：</td>
							<td><input type="text" class="form-control input-sm" id=txtLng></td>
							<td>纬度：</td>
							<td><input type="text" class="form-control input-sm" id=txtLat></td>
							<td style="padding-left:80px;">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-success" onclick="SelectCoord()">确定</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="confirmModal" role="dialog" aria-labelledby="是否删除" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div></div>
					<div>
						<label id="delAttName"></label>
					</div>
				</div>
				<div class="modal-footer form-horizontal">
					<input type="hidden" id="delAttID" />
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-success" onclick="ConfirmDel()">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=contextPath%>includes/js/uploadifive/jquery.uploadifive.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script src="<%=contextPath%>includes/js/uploadifive/uploadBase.js"></script>
	<script src="<%=contextPath%>includes/js/jktech/jkgis.js"></script>
	<script type="text/javascript">
		var delrow;//删除的附件行
		var isDelGC = true;//为真时删除工程，为假时删除附件（用同一个弹出框）
		$(function() {
			AjaxLoadComment();//异步加载该项目评论列表
			AjaxLoadAttFiles();//异步加载该项目附件列表
			$("#siteModal input[type=checkbox]").each(function(i) {
				$(this).click(function() {
					if (this.checked) {
						$(this).find("+label").css("font-weight", "bold");
					} else {
						$(this).find("+label").css("font-weight", "normal");
					}
				});
			});
			CUpload.Initialize("kc");//上传控件的初始化
			EditGCinfo(false);//控件信息不可编辑
			//初始化日期控件
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
		});
		function OpenSiteDlg() {
			var sites = $("#siteType").val();
			var siteList = sites.split("；");
			if (siteList != null && siteList.length > 0) {
				var checkList = $("#siteModal input[type=checkbox]");
				for ( var i in siteList) {
					var site = siteList[i];
					if (site != "") {
						for ( var j in checkList) {
							if (site == checkList[j].value) {
								var chx = checkList[j];
								checkList[j].checked = true;
								$(chx).find("+label")
										.css("font-weight", "bold");
							}
						}
					}
				}
			}
		}
		function SiteTypeOk() {
			//点击确定时，选择的场地类型更新到对应的表单上
			var checkList = $("#siteModal input[type=checkbox]");
			var sites = "";
			for ( var i in checkList) {
				var chx = checkList[i];
				if (chx.checked) {
					sites += chx.value + "；";
				}
			}
			$("#siteType").attr("value", sites);
			$("#siteModal").modal("hide");
		}
		function AjaxNewComment() {
			var newComment = $("#newComment").val();//新增评论
			var gcid = $("#gcid").val();//新增评论
			$.ajax({
				// 这里的需要Struts.xml的<action/>的name属性一致。
				url : '/jktech/gccomment/add.action',
				// 提交类型
				type : 'POST',
				// 提交数据给Action传入数据
				data : {
					gcid : gcid,
					tbtype : 'kc',
					CommContent : newComment
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.gccomm != null) {
						alert("添加完成。");
						var rows = $('#gccomments tr').length / 2;
						var newrow = GetNewCommentRow(data.gccomm, rows + 1);
						$('#gccomments').append(newrow);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					//alert(XMLHttpRequest.readyState);
					//alert(textStatus);
				}
			});
		}
		function AjaxLoadComment() {
			var gcid = $("#gcid").val();//新增评论
			$.ajax({
				// 这里的需要Struts.xml的<action/>的name属性一致。
				url : '/jktech/gccomment/query.action',
				// 提交类型
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					gcid : gcid,
					tbtype : 'kc'
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.gccomms != null) {
						for (var i = 0; i < data.gccomms.length; i++) {
							var newrow = GetNewCommentRow(data.gccomms[i],
									i + 1);
							$('#gccomments').append(newrow);
						}
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					//alert(XMLHttpRequest.readyState);
					//alert(textStatus);
				}
			});
		}
		function GetNewCommentRow(gccomm, floor) {
			var newRow = "<tr><td style='padding-top:20px;'><textarea class='form-control' rows='1' readonly='true' style='word-wrap: normal; resize: none;background:#fff;width:95%;margin:0 auto;'>"
					+ gccomm.commContent
					+ "</textarea></td></tr>"
					+ "<tr style='border-bottom:1px solid #ccc;font-size:12px;font-weight:normal;font-color:#999;'><td style='padding-bottom:10px;'><label style='padding-left:20px;'>"
					+ "#"
					+ floor
					+ "</label><label  style='float:right;padding-right:10px;'>"
					+ gccomm.userId
					+ "&nbsp&nbsp|&nbsp"
					+ gccomm.commdateStr
					+ "</label></td></tr>";
			return newRow;
		}
		function AjaxLoadAttFiles() {
			var gcid = $("#gcid").val();//新增评论
			$.ajax({
				// 这里的需要Struts.xml的<action/>的name属性一致。
				url : '/jktech/gcatt/query.action',
				// 提交类型
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					gcid : gcid,
					tbtype : 'kc'
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.gcAttachs != null) {
						for (var i = 0; i < data.gcAttachs.length; i++) {
							var newrow = GetNewAttachRow(data.gcAttachs[i]);
							$('#attTable').append(newrow);
						}
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					//alert(XMLHttpRequest.readyState);
					//alert(textStatus);
				}
			});
		}
		function GetNewAttachRow(gcatt) {
			var newRow = "<tr><td style=display:none>"
					+ gcatt.id
					+ "</td>"
					+ "<td>"
					+ gcatt.filename
					+ "</td>"
					+ "<td>"
					+ gcatt.atttype
					+ "</td><td>"
					+ gcatt.uploadDate
					+ "</td><td> <a href='download?attid="
					+ gcatt.id
					+ "&filename="
					+ gcatt.filename
					+ "'>下载</a> </td><td><a href='javascript:void(0);' onclick=DeleteAtt('"
					+ gcatt.filename + "'," + gcatt.id
					+ ",this)>删除</a></td></tr>";
			return newRow;
		}
		function EditGCinfo(istrue) {
			if (!istrue) {
				$("#tbkcinfo").find("*").attr("readonly", "readonly");//元素不可编辑
				$("#tbkcinfo").find("select").attr("disabled", "disabled");//元素不可编辑
			} else {
				$("#tbkcinfo").find("*").removeAttr("readonly");//元素可编辑
				$("#tbkcinfo").find("select").removeAttr("disabled");//元素可编辑
			}
		}
		//ajax方式提交整个表单
		function SaveGcInfo() {
			//保存之前，先对坐标进行转换
			var lat = parseFloat($("#gcLat").val());
			var lng = parseFloat($("#gcLng").val());
			var gcjpt = GPS.gcj_encrypt(lat, lng);
			$("#gcLatGCJ02").attr("value", gcjpt.lat);
			$("#gcLngGCJ02").attr("value", gcjpt.lon);
			$.ajax({
				type : "post",
				url : "/jktech/kc/update.action?param=1",
				data : $("#formGcinfo").serialize(),
				cache : false,
				dataType : "json",
				success : function(dta) {
					EditGCinfo(false);//控件信息不可编辑
					alert("保存成功");
					return;
				},
				error : function(dta) {
					alert("保存失败...");
				}
			});
		}
		//初始化高德地图
		var theMap;
		var auto;
		var posiMarker;
		function initialize() {
			var script = document.createElement("script");
			script.type = "text/javascript";
			script.src = "http://webapi.amap.com/maps?v=1.3&key=22eec657405637891487432575b7b0f8&plugin=AMap.Autocomplete&callback=initMap";
			document.body.appendChild(script);
		}
		// 初始化地图
		function initMap() {
			theMap = new AMap.Map("map_canvas", {
				center : new AMap.LngLat(109.00, 34.30), // 地图中心点
				defaultCursor : "crosshair",
				level : 11
			});
			AMap.event.addListener(theMap, 'click', function(e) {
				if (!posiMarker) {
					posiMarker = new AMap.Marker({
						position : e.lnglat,
						map : theMap
					});
				} else {
					posiMarker.setPosition(e.lnglat);
				}
				var x = e.lnglat.getLat();
				var y = e.lnglat.getLng();
				var newpt = GPS.gcj_decrypt(x, y);
				$("#txtLat").attr("value", newpt.lat.toFixed(8));
				$("#txtLng").attr("value", newpt.lon.toFixed(8));
			});
			//加入查询控件
			auto = new AMap.Autocomplete({
				input : "tipinput"
			});
			AMap.event.addListener(auto, "select", function(e) {
				if (e.poi && e.poi.location) {
					theMap.setZoom(15);
					theMap.setCenter(e.poi.location);
				}
			});//注册监听，当选中某条记录时会触发
		}
		function SelectCoord() {
			$("#gcLat").attr("value", $("#txtLat").val());
			$("#gcLng").attr("value", $("#txtLng").val());
			$("#coordModal").modal("hide");
		}
		//删除附件
		function DeleteAtt(attname, attid, tr) {
			isDelGC = false;
			$("#delAttName").text("是否删除附件  " + attname + " ?");
			$("#delAttID").val(attid);
			if (tr) {
				delrow = $(tr).parent().parent();
			}
			$("#confirmModal").modal("show");
		}
		//确定删除
		function ConfirmDel() {
			if (isDelGC) {
				$("#formGcinfo").attr("action",
						"/jktech/kc/delete.action?id=" + $("#gcid").val());
				$("#formGcinfo").attr("method", "post");
				$("#formGcinfo").submit();
			} else {
				$.ajax({
					type : "post",
					url : "/jktech/gcatt/delete.action",
					data : {
						attid : $("#delAttID").val()
					},
					cache : false,
					dataType : "json",
					success : function(dta) {
						delrow.remove();
						$("#confirmModal").modal("hide");
						return;
					},
					error : function(dta) {
						alert("删除失败..." + dta);
					}
				});
			}
		}
		function DeleteGC() {
			isDelGC = true;
			$("#delAttName").text("是否删除工程?");
			$("#confirmModal").modal("show");
		}
	</script>
</body>
</html>
