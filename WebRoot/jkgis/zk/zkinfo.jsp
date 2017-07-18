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
<title>钻孔信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="钻孔信息">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/jqplot/jquery.jqplot.min.css" />

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

body .navtext {
	min-width: 950px;
	font-family: "Microsoft Yahei", "微软雅黑", "Pinghei";
	font-size: 12px;
}

#tbkczkinfo {
	border-collapse: separate;
	border-spacing: 0px 5px;
	text-align: right;
	font-size: 14px;
	font-family: "Microsoft Yahei", "微软雅黑", "Pinghei";
}
/* #tbkczkinfo input[readonly] {true;
} */
.modal.fade.in {
	top: 25%;
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

.bigfont {
	font-family: "Microsoft Yahei", "微软雅黑", "Pinghei";
	font-size: 14px;
}

#formZkinfo {
	
}
</style>
</head>

<body onload="initialize()">
	<div class="navtext">
		<h3>机勘院技术资料信息系统</h3>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-5 col-xs-offset-7">
				<div style="margin-top:15px;text-align:center;" class="bigfont">
					<label>项目信息：</label>
					<s:a href="/jktech/kc/update.action?param=0&id=%{kczk.gcid}">
						<s:property value="%{gcname}" />
					</s:a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-5">
				<div class="panel panel-info" style="width:320px;float:right;">
					<div class="panel-heading">
						<h3 class="panel-title bigfont">基本信息</h3>
					</div>
					<div class="panel-body">
						<s:form action="update" namespace="/zk" method="post" role="form" theme="simple" id="formZkinfo">
							<table id="tbkczkinfo">
								<tr>
									<td>钻孔编号</td>
									<td><s:textfield class="form-control" name="kczk.bianhao"></s:textfield> <s:hidden id="zkid" class="form-control" name="kczk.id"></s:hidden></td>
								</tr>
								<tr>
									<td>地面标高(m)</td>
									<td><s:textfield class="form-control" name="kczk.hBiaogao"></s:textfield></td>
								</tr>
								<tr>
									<td>钻孔深度(m)</td>
									<td><s:textfield class="form-control" name="kczk.zkDepth"></s:textfield></td>
								</tr>
								<tr>
									<td>探井深度(m)</td>
									<td><s:textfield class="form-control" name="kczk.tanjingDepth"></s:textfield></td>
								</tr>
								<tr>
									<td>静探深度(m)</td>
									<td><s:textfield class="form-control" name="kczk.jingtanDepth"></s:textfield></td>
								</tr>
								<tr>
									<td>稳定水位(m)</td>
									<td><s:textfield class="form-control" name="kczk.wendingshuiwei"></s:textfield></td>
								</tr>
								<tr>
									<td>液化指数</td>
									<td><s:textfield class="form-control" name="kczk.yehuazhishu"></s:textfield></td>
								</tr>
								<tr>
									<td>等效剪切波速(m/s)</td>
									<td><s:textfield class="form-control" name="kczk.dengxiaojqbs"></s:textfield></td>
								</tr>
								<tr>
									<td>开孔日期</td>
									<td><div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
											<s:textfield class="form-control" name="kczk.kaikongdate" value="%{kczk.kaikongdateStr}"></s:textfield>
											<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>
										</div></td>
								</tr>
								<tr>
									<td>终孔日期</td>
									<td><div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
											<s:textfield class="form-control" name="kczk.zhongkongdate" value="%{kczk.zhongkongdateStr}"></s:textfield>
											<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>
										</div></td>
								</tr>
								<tr>
									<td>地貌单元</td>
									<td><s:textfield class="form-control" name="kczk.dimaodanyuan"></s:textfield></td>
								</tr>
								<tr>
									<td>场地湿陷类型</td>
									<td><s:select class="form-control" list="{'','非自重湿陷性黄土场地','自重湿陷性黄土场地'}" label="选择场地湿陷类型" name="kczk.gongchengdzfq"></s:select></td>
								</tr>
								<tr>
									<td>地基湿陷等级</td>
									<td><s:select class="form-control" list="{'','Ⅰ','Ⅱ','Ⅲ','Ⅳ'}" label="选择场地湿陷等级" name="kczk.shixiandengji"></s:select></td>
								</tr>
								<tr>
									<td>备注</td>
									<td><s:textarea class="form-control" rows="2" style="word-wrap: normal; resize: none;" name="kczk.beizhu "></s:textarea></td>
								</tr>
								<tr>
									<td>纬度</td>
									<td><s:textfield class="form-control" name="kczk.xNorth" id="zkLat"></s:textfield></td>
								</tr>
								<tr>
									<td>经度</td>
									<td><s:textfield class="form-control" name="kczk.yEast" id="zkLng"></s:textfield></td>
								</tr>

								<tr>
									<td><s:textfield class="form-control" name="kczk.latMars" id="zkLatMars"></s:textfield></td>
									<td><s:textfield class="form-control" name="kczk.lngMars" id="zkLngMars"></s:textfield></td>
								</tr>
								<tr>
									<td colspan="2"><a href="#" data-toggle="modal" data-target="#coordModal">选择坐标</a></td>
								</tr>
								<tr>
									<td colspan="2">
										<hr />
										<button id="btnEditZk" type="button" class="btn btn-primary btn-sm" onclick="EditZKinfo()">编辑</button>
										
										<button id="btnSaveZk" type=button onclick="SaveZkInfo()" style="margin-left:10px;margin-right:10px;" disabled="disabled" validate="true" class="btn btn-success  btn-sm"
											>保存</button>
										<button type="button" class="btn btn-warning  btn-sm" onclick="DeleteGC()">删除钻孔</button> <a style="padding-left: 10px;" data-toggle="modal"
											data-target="#zklistModal" href="#"> 土工试验</a>
									</td>
								</tr>
								<tr>
									<td colspan="2"><div id="zkinputerror"></div></td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
			</div>
			<div class="col-xs-7">
				<div class="panel panel-info" style="width:550px;">
					<div class="panel-heading">
						<h3 class="panel-title bigfont">钻孔柱状图</h3>
					</div>
					<div class="panel-body">
						<div id="zkSymbol" style="width:100px;height:730px;float:left;"></div>
						<div id="zkPouMian" style="width:120px;height:730px;float:left;"></div>
						<div style="float:left;" style="width:320px;">
							<div id="tcinfo">
								<table class="bigfont" style="text-align:right;">
									<tr>
										<td colspan="2"><label>钻孔统计信息</label></td>
									</tr>
									<tr>
										<td>层底深度</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>平均波速(m/s)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>平均锥尖阻力(MPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>平均侧壁摩阻力(MPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>平均比贯入阻力(MPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>备注</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
								</table>
							</div>
							<hr />
							<label style="text-align:right;width:100%;" class="bigfont">场地地层信息</label>
							<div id="dcxxinfo">
								<table class="bigfont" style="text-align:right;">
									<tr>
										<td>层号</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>地层名称</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>时代成因</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>地层颜色</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>含水率w(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>天然密度(g/cm3)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>干密度(g/cm3)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>孔隙比E0</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>饱和度Sr(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>液限WL(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>塑限WP(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>塑性指数Ip(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>液性指数IL(%)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>压缩系数a1-2(MPa-1)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>压缩模量Es1-2(MPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>湿陷系数δs</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>自重湿陷系数δzs</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>粘聚力C(kPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>内摩擦角φ(°)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>标贯N(击)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>动探修正N63.5(击)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>承载力(kPa)</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>平均波速</td>
										<td><input class="form-control input-sm" /></td>
									</tr>
									<tr>
										<td>地层描述</td>
										<td> <input class="form-control input-sm" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script src="<%=contextPath%>includes/js/jqplot/jquery.jqplot.min.js"></script>
	<script src="<%=contextPath%>includes/js/jqplot/jqplot.barRenderer.js"></script>
	<script src="<%=contextPath%>includes/js/jqplot/jqplot.blockRenderer.js"></script>
	<script src="<%=contextPath%>includes/js/jqplot/jqplot.categoryAxisRenderer.js"></script>
	<script src="<%=contextPath%>includes/js/jqplot/jqplot.pointLabels.js"></script>
	<script src="<%=contextPath%>includes/js/jktech/zksymbol.js"></script>
	<script src="<%=contextPath%>includes/js/jktech/jkgis.js"></script>
	<script type="text/javascript">
		var delrow;//删除的附件行
		var isDelGC = true;//为真时删除工程，为假时删除附件（用同一个弹出框）
		var tcidList = []; //存储每一层土的id值
		$(function() {
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
			AjaxLoadtc();
			bindClickEvent();
		});

		function EditGCinfo(istrue) {
			if (!istrue) {
				$("#tbkczkinfo").find("*").attr("readonly", "readonly");//元素不可编辑
				$("#tbkczkinfo").find("select").attr("disabled", "disabled");//元素不可编辑
			} else {
				$("#tbkczkinfo").find("*").removeAttr("readonly");//元素可编辑
				$("#tbkczkinfo").find("select").removeAttr("disabled");//元素可编辑
			}
		}
		//ajax方式提交整个表单
		function SaveZkInfo() {
			//保存之前，先对坐标进行转换
			var lat = parseFloat($("#zkLat").val());
			var lng = parseFloat($("#zkLng").val());
			var gcjpt = GPS.gcj_encrypt(lat, lng);
			$("#zkLatMars").attr("value", gcjpt.lat);
			$("#zkLngMars").attr("value", gcjpt.lon);
			$.ajax({
				type : "post",
				url : "/jktech/zk/update.action?param=1",
				data : $("#formZkinfo").serialize(),
				cache : false,
				dataType : "json",
				success : function(dta) {
					$("#btnSaveZk").attr("disabled", "disabled");
					$("#btnEditZk").removeAttr("disabled");//元素可编辑
					ChangeCtrlStatus(false, $("#formZkinfo"));//设置为可用
					alert("保存成功");
					return;
				},
				error : function(dta) {
					alert(dta);
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
			$("#zkLat").attr("value", $("#txtLat").val());
			$("#zkLng").attr("value", $("#txtLng").val());
			$("#coordModal").modal("hide");
		}
		//确定删除
		function ConfirmDel() {
			$("#formZkinfo").attr("action",
					"/jktech/zk/delete.action?id=" + $("#zkid").val());
			$("#formZkinfo").attr("method", "post");
			$("#formZkinfo").submit();
		}
		function DeleteGC() {
			isDelGC = true;
			$("#delAttName").text("是否删除钻孔?");
			$("#confirmModal").modal("show");
		}
		function AjaxLoadtc() {
			var zkid = $("#zkid").val();//新增评论
			//获得钻孔地层信息
			$.ajax({
				type : "GET",
				url : "/jktech/tc/query.action",
				data : {
					zkid : zkid
				},
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if (data != null) {
						var tclist = data.kctcList;//土层列表
						var depthList = []; //深度列表
						var dcNameList = []; //地层名称列表
						var yTickList = new Array(); //y轴的坐标刻度值
						var segList = new Array(); //地层填充数组
						var symbolList = new Array(); //地层渲染数组

						//计算钻孔深度
						var xLepth = 0; //x轴
						var interval = 0; //斜线间隔
						/* for (var i = 0; i < tclist.length; i++) {
							xLepth = xLepth + tclist[i].cengdiDepth;
						} */
						//为地层信息增加厚度
						var lastHeight = 0;
						for (var i = 0; i < tclist.length; i++) {
							tclist[i]["houdu"] = tclist[i].cengdiDepth
									- lastHeight;
							lastHeight = tclist[i].cengdiDepth;
						}
						if (tclist.length > 0) {
							xLepth = tclist[tclist.length - 1].cengdiDepth;
						}
						var xyScale = 0.09; //X轴大概是Y轴的0.09倍，换算比例尺
						if (xLepth > 50) {
							//钻孔深度超过50米，按比例缩放ZKSymbol控件的高度
							var height = 730 / 50 * xLepth;
							$("#zkSymbol,#zkPouMian").height(height);
							xyScale = xyScale * (50 / xLepth);
						}
						xLepth = xLepth * xyScale; //X轴大概是Y轴的0.09倍，换算比例尺
						interval = xLepth / 5 > 0 ? xLepth / 5 : 1; //间隔
						var lastDepth = 0; //上一次深度,从最上层的深度
						for (var i = 0; i < tclist.length; i++) {
							//土层ID列表
							tcidList.push(tclist[i].id);
							//深度列表
							depthList.push([ 0 - tclist[i].houdu ]);
							//刻度列表
							yTickList.push(0 - tclist[i].cengdiDepth);
							//地层名称列表
							var tempPotion = {
								pointLabels : {
									show : true,
									labels : [ tclist[i].tcname ]
								}
							};
							dcNameList.push(tempPotion);
							//进行填充及符号化
							var layerData = GetDCSymbol(tclist[i].tcname,
									lastDepth, 0 - tclist[i].houdu, xLepth,
									interval);
							segList = segList.concat(layerData.data);
							symbolList = symbolList.concat(layerData.sysmbol);
							lastDepth = 0 - tclist[i].cengdiDepth;
						}
						//地下水位符号
						/* if (jsonD.waterHeight > 0) {
							layerData = getWaterHeight(0,
									0 - jsonD.waterHeight, xLepth);
							segList = segList.concat(layerData.data);
							symbolList = symbolList.concat(layerData.sysmbol);
						} */
						//ytickList排序
						yTickList = yTickList.reverse();
						yTickList.push(0);
						var plot1 = $.jqplot('zkSymbol', segList, {
							sortData : false,
							seriesDefaults : {
								showMarker : false,
								color : '002145',
								lineWidth : 0.6,
								shadow : false
							},
							grid : {
								//background:'#F0FFFF',
								drawGridLines : true,
								//shadow: true,
								gridLineWidth : 1.5,
								gridLineColor : '#000000',
								borderWidth : 0,
								drawBorder : true
							},
							series : symbolList,
							axes : {
								xaxis : {
									min : 0,
									max : xLepth,
									showTicks : false
								},
								yaxis : {
									ticks : yTickList
								}
							}
						});
						var plot3 = $.jqplot('zkPouMian', depthList, {
							/* negativeSeriesColors : [ "#d0ea7c", "#7fdce6",
									"#ffd985", "#ffc38e", "#9dcada" ], */
							negativeSeriesColors : [ "#DEDEDE", "#C7C7C7" ],
							//title: '钻孔柱状图', 
							stackSeries : true,
							seriesDefaults : {
								renderer : $.jqplot.BarRenderer,
								shadow : true,
								rendererOptions : {
									barPadding : 1,
									barWidth : 100,
									highlightColors : [ "#ffd985" ],
									fillToZero : true
								}
							},
							series : dcNameList,
							//legend: { show: true, placement: 'outsideGrid' },
							grid : {
								background : '#ffffff',
								borderColor : '#999999',
								borderWidth : 0
							},
							axes : {
								xaxis : {
									min : 0,
									max : 2,
									//max:1.5,
									showTicks : false
								},
								yaxis : {
									ticks : yTickList
								}
							}
						});
					}
				}
			});
		}
		function bindClickEvent() {
			$('#zkPouMian').bind('jqplotDataHighlight',
					function(ev, seriesIndex) {
						var tcid = tcidList[seriesIndex];
						//document.getElementById("TextTCID").value = tcid;
						$.ajax({
							type : "GET",
							url : "/jktech/tc/update.action",
							data : {
								id : tcid,
								param : 0
							},
							contentType : "application/json; charset=utf-8",
							dataType : 'html',
							success : function(data) {
								$("#tcinfo").html(data);
								//$("#dcinfo").prepend(data);
							}
						});
						$.ajax({
							type : "GET",
							url : "/jktech/dcxx/update.action",
							data : {
								tcid : tcid,
								param : 2
							},
							contentType : "application/json; charset=utf-8",
							dataType : 'html',
							success : function(data) {
								$("#dcxxinfo").html(data);
								//$("#formTcinfo").prepend(data);
							}
						});
					});

		}
		function EditZKinfo(istrue, divObj) {
			$("#btnEditZk").attr("disabled", "disabled");
			$("#btnSaveZk").removeAttr("disabled");//元素可编辑
			ChangeCtrlStatus(true, $("#formZkinfo"));//设置为可用
		}
		function ChangeCtrlStatus(istrue, divObj) {
			if (!istrue) {
				divObj.find("*").attr("readonly", "readonly");//元素不可编辑
				divObj.find("select").attr("disabled", "disabled");//元素不可编辑
			} else {
				divObj.find("*").removeAttr("readonly");//元素可编辑
				divObj.find("select").removeAttr("disabled");//元素可编辑
			}
		}
	</script>
</body>
</html>
