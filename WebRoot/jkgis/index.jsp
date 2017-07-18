<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String rootpath = request.getContextPath();
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<script type="text/javascript" src='http://cache.amap.com/lbs/static/allCity.js'></script>
<style type="text/css">
html,body {
	margin: 0;
	height: 100%;
	width: 100%;
	position: absolute;
}

#map_canvas {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
}

#toolbar {
	position: absolute;
	top: 0px;
	left: 0px;
	font-size: 12px;
	width: 324px;
	height: 100%;
	background: #fff;
	border-right: 1px solid;
	/* background: #47a3da; */
}

#shrink {
	position: absolute;
	top: 40%;
	left: 324px;
	font-size: 12px;
	width: 15px;
	height: 60px;
	cursor: pointer;
	background: #D6D6D6;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-right: 1px solid;
	/* border-left:5px solid #EAEAEA; */
}

#shrink:hover {
	background: #F5F5F5;
}

#shrinkspan {
	top: 40%;
}

.amap-logo {
	right: 0 !important;
	left: auto !important;
}

.amap-copyright {
	right: 70px !important;
	left: auto !important;
}

.panelheader {
	width: 100%;
	cursor: pointer;
}

.collapsing {
	-webkit-transition: height .1s ease;
	transition: height .1s ease
}

#search td {
	vertical-align: middle;
	text-align: center;
}

.panel-default {
	border-style: solid none none none;
}

.panel-default>.panel-heading {
	border-bottom: 1px solid #dddddd;
}

.panel {
	-webkit-box-shadow: none;
	box-shadow: none;
}
</style>

</head>
<body onload="initialize()">
	<div id="map_canvas"></div>
	<div id="toolbar">
		<div style="width:100%;height:100%;">
			<ul class="nav nav-tabs" role="tablist" id="tab-list">
				<li class="active">
					<a href="#display" role="presentation" data-toggle="tab">展示</a>
				</li>
				<li>
					<a href="#search" role="presentation" data-toggle="tab">查询</a>
				</li>
				<li>
					<a href="#upload" role="presentation" data-toggle="tab">上传</a>
				</li>
				<li>
					<a href="#gistool" role="presentation" data-toggle="tab">工具</a>
				</li>
			</ul>

			<div class="tab-content" style="padding-top:3px;">
				<div class="tab-pane fade in active" role="tabpanel" id="display">
					<div style="width: 100%;">
						<div class="panel-group" id="accordshow">
							<div class="panel panel-default">
								<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordshow" href="#collkc">
									<a class="accordion-toggle">勘察</a>
								</div>
								<div id="collkc" class="panel-collapse collapse in">
									<div class="panel-body">
										<table class="table table-hover">
											<tbody>
												<tr>
													<td><input type="checkbox" id="checkkcgc" onclick="AjaxLoadKC()" /></td>
													<td><label for="checkkcgc">勘察工程</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkkczk" /></td>
													<td><label for="checkkczk">钻孔</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkkcdxa" /></td>
													<td><label for="checkkcdxa">大西安边界</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkkcdxa-main" /></td>
													<td><label for="checkkcdxa-main">大西安主城区</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordshow" href="#colljc">
									<a class="accordion-toggle">检测</a>
								</div>
								<div id="colljc" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table table-hover">
											<tbody>
												<tr>
													<td><input type="checkbox" id="checkzjgc" /></td>
													<td><label for="checkzjgc">桩基工程</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkfhdj" /></td>
													<td><label for="checkfhdj">复合地基</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordshow" href="#collzp">
									<a class="accordion-toggle">工程照片</a>
								</div>
								<div id="collzp" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table table-hover">
											<tbody>
												<tr>
													<td><input type="checkbox" id="checkgczp" /></td>
													<td><label for="checkgczp">工程照片</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordshow" href="#colldlf">
									<a class="accordion-toggle">地裂缝</a>
								</div>
								<div id="colldlf" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table table-hover">
											<tbody>
												<tr>
													<td><input type="checkbox" id="checkdlf" /></td>
													<td><label for="checkdlf">地裂缝</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdlfpt" /></td>
													<td><label for="checkdlfpt">地裂缝(勘探点)</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordshow" href="#collmap">
									<a class="accordion-toggle">地质图</a>
								</div>
								<div id="collmap" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table table-hover table-condensed">
											<tbody>
												<tr>
													<td><input type="checkbox" id="checkxadzdmt" /></td>
													<td><label for="checkxadzdmt">西安地质地貌图(1:55万)</label></td>
													<td><input type="checkbox" id="checkxadzdmtbz" /></td>
													<td><label for="checkxadzdmtbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkxadzgzt" /></td>
													<td><label for="checkxadzgzt">西安地质构造图(1:55万)</label></td>
													<td><input type="checkbox" id="checkxadzgztbz" /></td>
													<td><label for="checkxadzgztbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkxargtt" /></td>
													<td><label for="checkxargtt">西安人工填分布图</label></td>
													<td><input type="checkbox" id="checkxargttbz" /></td>
													<td><label for="checkxargttbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkxabhrht" /></td>
													<td><label for="checkxabhrht">西安饱和软黄土分布图</label></td>
													<td><input type="checkbox" id="checkxabhrhtbz" /></td>
													<td><label for="checkxabhrhtbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkxasxfj" /></td>
													<td><label for="checkxasxfj">西安湿陷分级图</label></td>
													<td><input type="checkbox" id="checkxasxfjbz" /></td>
													<td><label for="checkxasxfjbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkxagcdzfq" /></td>
													<td><label for="checkxagcdzfq">西安工程地质分区图</label></td>
													<td><input type="checkbox" id="checkxagcdzfqbz" /></td>
													<td><label for="checkxagcdzfqbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkgzpd4j" /></td>
													<td><label for="checkgzpd4j">关中盆地第四纪地质图</label></td>
													<td><input type="checkbox" id="checkgzpd4jbz" /></td>
													<td><label for="checkgzpd4jbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxadmt" /></td>
													<td><label for="checkdxadmt">大西安地貌图</label></td>
													<td><input type="checkbox" id="checkdxadmtbz" /></td>
													<td><label for="checkdxadmtbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxadzt" /></td>
													<td><label for="checkdxadzt">大西安地质图</label></td>
													<td><input type="checkbox" id="checkdxadztbz" /></td>
													<td><label for="checkdxadztbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxazcqdmt" /></td>
													<td><label for="checkdxazcqdmt">大西安主城区地貌图</label></td>
													<td><input type="checkbox" id="checkdxazcqdmtbz" /></td>
													<td><label for="checkdxazcqdmtbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxazcqsxt" /></td>
													<td><label for="checkdxazcqsxt">大西安主城区湿陷图</label></td>
													<td><input type="checkbox" id="checkdxazcqsxtbz" /></td>
													<td><label for="checkdxazcqsxtbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxacjdzx" /></td>
													<td><label for="checkdxacjdzx">西安沉降等值线</label></td>
													<td><input type="checkbox" id="checkdxacjdzxbz" /></td>
													<td><label for="checkdxacjdzxbz">标注</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" id="checkdxacjlj" /></td>
													<td><label for="checkdxacjlj">西安沉降累计值</label></td>
													<td><input type="checkbox" id="checkdxacjljbz" /></td>
													<td><label for="checkdxacjljbz">标注</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" role="tabpanel" id="search">
					<div class="panel-group" id="accordsearch" style="width: 100%;">
						<div class="panel panel-default">
							<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordsearch" href="#collgcsearch">
								<a class="accordion-toggle">工程项目查询</a>
							</div>
							<div id="collgcsearch" class="panel-collapse collapse in">
								<div class="panel-body" style="padding:0px;">
									<table class="table table-hover">
										<tbody>
											<tr>
												<td style="border:none;"><label>项目类型</label></td>
												<td style="border:none;"><select class="form-control" style="float:left;">
														<option value="KC">勘察工程</option>
														<option value="ZJ">桩基工程</option>
														<option value="DJJC">地基检测</option>
													</select></td>
											</tr>
											<tr>
												<td><label>查询内容</label></td>
												<td><input type="text" id="searchcontent" class="form-control"></td>
											</tr>
											<tr>
												<td><label>起始日期</label></td>
												<td>
													<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" style="width:235px;">
														<input class="form-control" type="text" value="">
														<span class="input-group-addon"> <span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"> <span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</td>
											</tr>
											<tr>
												<td><label>结束日期</label></td>
												<td>
													<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" style="width:235px;">
														<input class="form-control" type="text" value="">
														<span class="input-group-addon"> <span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"> <span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<button type="button" class="btn btn-primary" style="float:right;margin-right:20px;">查 询</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading panelheader" data-toggle="collapse" data-parent="#accordsearch" href="#collsearchgis">
								<a class="accordion-toggle">空间查询</a>
							</div>
							<div id="collsearchgis" class="panel-collapse collapse">
								<div class="panel-body" style="padding:0px;">
									<table style="width:100%;">
										<tr>
											<td colspan="2">
												<div class="panel panel-success" style="margin-top:7px;">
													<div class="panel-heading">
														<h3 class="panel-title">坐标</h3>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><label style="float:left;">
													<input type="radio" name="coordTypeRadios" id="latlngCoord" value="经纬度坐标" checked>
													经纬度坐标
												</label></td>
											<td>
												<div class="form-inline">
													<div class="form-group form-inline">
														<label class="form-label">x(北)</label>
														<input type="text" class="form-control" style="width:110px;" placeholder="输入北坐标" id="gisSearchLat" />
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><label style="float:left;">
													<input type="radio" name="coordTypeRadios" id="xianCoord" value="西安城建坐标" checked>
													西安城建坐标
												</label></td>

											<td>
												<div class="form-inline">
													<div class="form-group form-inline">
														<label class="form-label">y(东)</label>
														<input type="text" class="form-control" style="width:110px;" placeholder="输入东坐标" id="gisSearchLng" />
													</div>
												</div>

											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="panel panel-info">
													<div class="panel-heading">
														<h3 class="panel-title">勘察钻孔查询</h3>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><label>查询半径(m)</label></td>
											<td><input type="text" id="searchZKRadius" value="1000" class="form-control"></td>
										</tr>
										<tr>
											<td colspan="2"><label for="checksearchzk" style="float:left;padding:5px;padding-left:15px;">
													<input type="checkbox" id="checksearchzk" />
													点击查询(勾选后在地图上点击查询位置)
												</label></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<button class="btn btn-primary btn-sm" style="margin-right:30px;">查 询</button>
												<button class="btn btn-warning btn-sm">清 空</button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="panel panel-info">
													<div class="panel-heading">
														<h3 class="panel-title">地貌类型查询</h3>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2"><label for="checksearchdm" style="float:left;padding:5px;padding-left:15px;">
													<input type="checkbox" id="checksearchdm" />
													点击查询(勾选后在地图上点击查询位置)
												</label></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<button class="btn btn-primary btn-sm" style="margin-right:30px;">查 询</button>
												<button class="btn btn-warning btn-sm">清 空</button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="panel panel-info">
													<div class="panel-heading">
														<h3 class="panel-title">地裂缝查询</h3>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2"><label for="checksearchdlf" style="float:left;padding:5px;padding-left:15px;">
													<input type="checkbox" id="checksearchdlf" />
													点击查询(勾选后在地图上点击查询位置)
												</label></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<button class="btn btn-primary btn-sm" style="margin-right:30px;">查 询</button>
												<button class="btn btn-warning btn-sm">清 空</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="tab-pane fade" role="tabpanel" id="upload">

					<h2>创建模态框（Modal）</h2>
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
								</div>
								<div class="modal-body">在这里添加一些文本</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary">提交更改</button>
								</div>
							</div>
						</div>
					</div>


				</div>
				<div class="tab-pane fade" role="tabpanel" id="gistool">3</div>
			</div>
		</div>
		<div id="shrink" onclick="HideBySpeed()" title="隐藏工具栏">
			<span id="shrinkspan" class="glyphicon glyphicon-chevron-left"></span>
		</div>
	</div>
	<script src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap-table.js"></script>
	<script src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script src="<%=contextPath%>includes/js/jktech/jkgis.js"></script>
	<script type="text/javascript" src = 'http://a.amap.com/jsapi_demos/static/citys.js'></script> 
	<%-- <script src="<%=contextPath%>includes/js/jktech/gaodeOperate20160601.js"></script> --%>
	<script src="<%=contextPath%>includes/js/jktech/AMapOperate.js"></script>
	<script type="text/javascript">
		var pt = GPS.gcj_encrypt(34, 108);
	</script>
</body>
</html>