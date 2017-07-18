var theMap; // 地图
var tileLayerDitu; // 切片地图
var tileLayerSatellite; // 卫星影像图
var tileLayerRoad; // 路网图层
/*------------------工具变量-----------------*/

var mouseTool;
var ptsListInput; // 自动生成点，输入点的列表
var lineListInput; // 自动生成线，输入线的列表
var polygonListInput; // 自动生成面，输入面的列表
/*-----------------画矩形的函数-------------*/

var isRectLinePt1; // 手工矩形:是否是第一个点方框线
var startPtForRect; // 手工矩形:起始点
var rectOfManual; // 手工矩形
// 手动输入标注信息
var lineManualWidth = 2;// 手工画线宽度
var lineManualColor = "rgb(255,0,0)";// 手工画线颜色
var lineManualOpacity = 1;// 手工画线颜色
var polygonManualBorderWidth = 1;// 多边形边界宽度
var polygonManualBorderColor = "rgb(0,0,0)";// 多边形边界颜色
var polygonManualColor = "rgb(0,255,255)";// 多边形填充颜色
var polygonManualBorderOpacity = 1;// 多边形边界透明度
var polygonManualOpacity = 0.3;// 多边形填充透明度
var fontManualSize = "12";
var fontManualColor = "rgb(123,0,45)";// 字体颜色
var fontManualStyle = "宋体";// 字体类型
var fontManualIsBold = false;// 粗体
var fontManualIsItalic = false;// 斜体
/*-----------------大西安边界----------------*/

var dxa_bound; // 大西安边界
/*-----------------查询----------------------*/
var layers = [];
var searchMarkers;
var spatialMarker;
var LOADCOUNT = 200;
/*----------------地貌查询---------------------*/
var dimaoMarker;
var defaultCursor = "url(http://webapi.amap.com/theme/v1.3/openhand.cur),default";// 默认鼠标
/*----------------地裂缝查询--------------------*/

var dlfSearchLine;

function initialize() {
	var script = document.createElement("script");
	script.type = "text/javascript";
	script.src = "http://webapi.amap.com/maps?v=1.3&key=22eec657405637891487432575b7b0f8&callback=initMap";
	document.body.appendChild(script);
	/*------------------变量初始化------------------*/
	/*
	 * ptsListInput = []; //输入点 lineListInput = []; //生成线 polygonListInput = [];
	 * //生成面 loadjscssfile("/CSS/GaodeMapZP.css", "css");
	 * loadjscssfile("/js/jqplot/jquery.jqplot.min.css", "css");
	 * loadjscssfile("/js/jqplot/jqplot.barRenderer.min.js", "js");
	 * loadjscssfile("/js/jqplot/jqplot.pointLabels.min.js", "js");
	 */
}
// 初始化地图
function initMap() {
	theMap = new AMap.Map("map_canvas", {
		center : new AMap.LngLat(109.00, 34.30), // 地图中心点
		cursor : "crosshair",
		level : 13
	});
	theMap.plugin([ "AMap.MouseTool" ], function() {
		mouseTool = new AMap.MouseTool(theMap);
		// 鼠标工具插件添加draw事件监听
		AMap.event.addListener(mouseTool, "draw", function callback(e) {
			var eObject = e.obj; // obj属性就是鼠标事件完成所绘制的覆盖物对象。
			HideObj(eObject);
		});
	});
	/*
	 * AMap.event.addListener(theMap, 'mousemove', OnMapMouseMoveEvent);
	 * AMap.event.addListener(theMap, 'click', OnMapMouseLClickEvent);
	 * AMap.event.addListener(theMap, 'rightclick', OnMapMouseRClickEvent);
	 * AMap.event.addListener(theMap, 'dblclick', OnMapMouseDBClickEvent);
	 */

	var mass = new AMap.MassMarks(citys, {
		url : 'http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png',
		anchor : new AMap.Pixel(3, 7),
		size : new AMap.Size(5, 7),
		opacity : 0.7,
		cursor : 'pointer',
		zIndex : 1
	});
	
	  /*var marker = new AMap.Marker({ content:' ', map:theMap })
	  mass.on('mouseover',function(e){ marker.setPosition(e.data.lnglat);
	  marker.setLabel({content:e.data.name})});
	 */
	  //mass.setMap(theMap);
}
// 定义勘察工程
var kcgcLayer;
function AjaxUpdateKC(){
	$.ajax({
		   url: '/jktech/kc/query.action',
		   async: false ,// 嵌套时最好加上这个，不然容易出问题，我的就是这里出问题了，外层的应该无所谓，内层一定要加
		   type : 'POST',
			// 提交数据给Action传入数据
			data : {
				'searchText' : ''
			},
		   success: function(data){
				for (var i = 0; i < data.kcgcs.length; i++) {
					var layer = data.kcgcs[i];
					if (layer.lng && layer.lat) {
						var newpt=GPS.gcj_encrypt(layer.lat, layer.lng);
						layer.latGCJ02=newpt.lat;
						layer.lngGCJ02=newpt.lon;
						$.ajax({
	                          url: "/jktech/kc/updateCoordGCJ02.action",
	                          async: false ,
	                          data: {
	                        	  "id":layer.id,
	                        	  "latGCJ02":layer.latGCJ02,
	                        	  "lngGCJ02":layer.lngGCJ02
	                          },
	                          success: function(msg){
	                                        // 对返回值的处理
	                                       }
	                           });
					}
				}
		   }
		});	
}


function AjaxLoadKC() {
	
	$.ajax({
				// 这里的需要Struts.xml的<action/>的name属性一致。
				url : '/jktech/kc/query.action',
				// 提交类型
				type : 'GET',
				// 提交数据给Action传入数据
				data : {
					'searchText' : ''
				},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.kcgcs != null) {
						//var layers = [];data.kcgcs.length
						for (var i = 0; i < data.kcgcs.length; i++) {
							
							var layer = data.kcgcs[i];
							if (layer.lngGCJ02 && layer.latGCJ02) {
								layers.push({
									"lnglat" :new AMap.LngLat(layer.lngGCJ02, layer.latGCJ02),// [ layer.lngGCJ02, layer.latGCJ02 ],
									"id" : layer.id,
									//"style":1,
									"name" : layer.name
								});
							}
						}

						if (!kcgcLayer) {
							kcgcLayer = new AMap.MassMarks(
									//citys,
									layers,
									{
										url : 'http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png',
										anchor : new AMap.Pixel(5, 16),
										size : new AMap.Size(9, 16),
										opacity : 0.9,
										cursor : 'pointer',
										zIndex : 110
									});
							  /*var marker = new AMap.Marker({ content:' ', map:theMap });
							  kcgcLayer.on('mouseover',function(e){ marker.setPosition(e.data.lnglat);
							  marker.setLabel({content:e.data.name}) });
							  */
							/*
							 * GCMarkerModel.zkMarkerMass.on('click',
							 * function(e) {
							 * AddMarkerInfoBox_KCZKMass(e.data.id,
							 * e.data.lnglat);// 添加事件 });
							 */
							kcgcLayer.setMap(theMap);
							// ExecMarkerAjax(0, markerType);
						} else {
							// GCMarkerModel.zkMarkerMass.show();
						}
					}
				}
			});
}
/*-------------------------------定义javascript类--------------------------*/
var MapLayer = {
	createNew : function() {
		var mapLayer = {};
		mapLayer.show = function() {

		};
		return mapLayer;
	}
};
var KcgcLayer = {
	createNew : function() {
		var kcgcLayer = MapLayer.createNew();
		kcgcLayer.layers = [];
		kcgcLayer.show = function() {

		};
	}
};


//动画效果展开
var leftHide = -324; // 工具栏隐藏时left值
var leftShow = 0; // 工具栏显示时left值
var inv = 40; // 间隔，每次缩短距离
var leftnow = leftShow; // 当前
var speed = 20; // 毫秒
function HideBySpeed() {
	leftnow -= inv;
	if (leftnow > leftHide) {
		document.getElementById('toolbar').style.left = leftnow + 'px';
		setTimeout('HideBySpeed()', speed);
	} else {
		leftnow = leftHide;
		document.getElementById('toolbar').style.left = leftHide + 'px';
		document.getElementById('shrink').onclick = ShowBySpeed;
		document.getElementById('shrink').title = "显示工具栏";
		document.getElementById('shrinkspan').className = "glyphicon glyphicon-chevron-right";
	}
}
function ShowBySpeed() {
	leftnow += inv;
	if (leftnow < leftShow) {
		document.getElementById('toolbar').style.left = leftnow + 'px';
		setTimeout('ShowBySpeed()', speed);
	} else {
		leftnow = leftShow;
		document.getElementById('toolbar').style.left = leftShow + 'px';
		document.getElementById('shrink').onclick = HideBySpeed;
		document.getElementById('shrinkspan').className = "glyphicon glyphicon-chevron-left";
		document.getElementById('shrink').title = "隐藏工具栏";
	}
}
$(document).ready(function() {
});
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

