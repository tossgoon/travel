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

<title>OA系统-动物状况监测</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="OA系统">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-table.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>includes/css/oastyle.css" />
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
.button-group {
	position: absolute;
	top: 150px;
	left: 320px;
	font-size: 12px;
	padding: 10px;
}

.button-group .button {
	height: 28px;
	line-height: 28px;
	background-color: #0D9BF2;
	color: #FFF;
	border: 0;
	outline: none;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 3px;
	margin-bottom: 4px;
	cursor: pointer;
}
.button-group .inputtext {
	height: 26px;
	line-height: 26px;
	border: 1px;
	outline: none;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 3px;
	margin-bottom: 4px;
	cursor: pointer;
}
	    
.button-tool {
	position: absolute;
	top: 180px;
	right: 30%;
	font-size: 12px;
	padding: 10px;
}
.button-tool .button {
	height: 28px;
	line-height: 28px;
	background-color: #0D9BF2;
	color: #FFF;
	border: 0;
	outline: none;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 3px;
	margin-bottom: 4px;
	cursor: pointer;
}
</style>
<body>
	<%@ include file="/oaadmin/oahead.jsp"%>
   <div class="toptool">
			<span>当前位置：OA系统&gt;&gt;监测信息
			</span> 
			<a style="float:right;margin-right:20px;"href="/travel/visitor/first.action">返回首页</a>
			<a style="float:right;margin-right:20px;"href="/travel/oa/querynotifysend.action?pagesize=7&pagenum=1">返回OA功能列表</a>
			
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div  style="width:100%;border:1px solid #666666;margin:0px;margin-bottom:10px;">
				<div style="background-color: #7EC0EE;height:38px;padding:5px;">
					<input type="checkbox" id="chk1" onclick="toggle(1,this)" />褐马鸡野外种群监测
					<input type="checkbox" id="chk2" style="margin-left:10px;" onclick="toggle(2,this)" />红外相机监测点
					<input type="checkbox" id="chk3" style="margin-left:10px;" onclick="toggle(3,this)" />野生动物监测 
					<input type="checkbox" id="chk4" style="margin-left:10px;" onclick="toggle(4,this)" />森林植物群落监测
					<input type="checkbox" id="chk5" style="margin-left:10px;" onclick="toggle(5,this)" />动植物相关重要信息 
					<input type="checkbox" id="chk6" style="margin-left:10px;" onclick="toggle(6,this)" />保护区巡护记录
				</div>
				<div id="themap" style="width:100%;height:680px;"></div>
				<div class="button-tool">
					<input type="button" class="button" value="地图"
						onclick="ChangeDiTuTile()" /> <input  type="button"
						class="button" value="卫星图" onclick="ChangeSatelliteTile()" />
				</div>
			</div>
			<!-- <div style="clear:both;"></div> -->
		</div>
	</div>
	<div style="height:10px;"></div>
	<%@ include file="/portal/footmodal.jsp"%>
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=3ad53ae8a26edf19caf8573cbdbb9b15"></script> 
	<script type="text/javascript" src="<%=contextPath%>includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>includes/js/webuploader-0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>includes/js/travel/gps.js"></script>
	<script type="text/javascript">
		var map;//地图
		var tileLayerDitu;        //切片地图
		var tileLayerSatellite;   //卫星影像图
		var tileLayerRoad;        //路网图层
		var marker;//标记
		var ptlist=new Array();  
		//var animals=[],cameras=[],chicks=[],importinfos=[],plants=[],protects=[];
		$(function() {
			//初始化地图
			tileLayerSatellite=new AMap.TileLayer.Satellite();
			tileLayerRoad=new AMap.TileLayer.RoadNet();
			map = new AMap.Map('themap', {
				zoom : 10,
				layers : [ tileLayerSatellite,tileLayerRoad],
				center : [ 109.803373, 35.600862 ]
			});
			//tileLayerSatellite.setMap(map);
			//tileLayerRoad.setMap(map);
			/* map.plugin(["AMap.MapType"],function(){  //添加地图类型切换插件 
		        //地图类型切换  
		        var mapType= new AMap.MapType({defaultType:2,showRoad:true});  
		        map.addControl(mapType);  
		    }); */
			marker = new AMap.Marker({
				icon : '/travel/includes/image/redmarker.png',//24px*24px
				position : map.getCenter()
			});
			marker.setMap(map);
			// 设置label标签
			/* marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
						offset : new AMap.Pixel(-100, -30),//修改label相对于maker的位置
						content : "<label style='font-size:14px;'>延安黄龙山褐马鸡国家级自然保护区</label>"
					}); */
			//二维数据的定义 
			for(var i=0;i<6;i++){          //一维长度为6
				ptlist[i]='';    //初始化二维数组
			 };
			});
		//checkbox点击事件
		function toggle(type,checkbox){
			if (checkbox.checked) {
	            showpt(type);
	        } else {
	            hidept(type);
	        }
		}
		//显示点
		function showpt(type){
			if(ptlist[type]==null||ptlist[type].length==0){
				loadpts(type);
			}
			else{
				visiblepts(type);
			}
		}
		//异步加载显示点
		function loadpts(type){
			 var infoWindow = new AMap.InfoWindow({
		        });
			var url="";
			switch(type)
			{
			case 1:
				url="/travel/survey/querychicklist.action";
			  break;
			case 2:
				url="/travel/survey/querycameralist.action";
			  break;
			case 3:
				url="/travel/survey/queryanimallist.action";
			  break;
			case 4:
				url="/travel/survey/queryplantlist.action";
			  break;
			case 5:
				url="/travel/survey/queryimportinfolist.action";
			  break;
			case 6:
				url="/travel/survey/queryprotectlist.action";
			  break;
			default:
				break;
			}
			$.ajax({
				url : url,
				type : 'GET',
				//data : {userid:delUserid},
				// 返回的数据类型
				dataType : 'json',
				// 成功是调用的方法
				success : function(data) {
					if (data.errormsg == "0") {
						var pts=[];
						var datalist=[];
						switch(type)
						{
						case 1:
							datalist=data.chicklist;
						  break;
						case 2:
							datalist=data.cameralist;
						  break;
						case 3:
							datalist=data.animallist;
						  break;
						case 4:
							datalist=data.plantlist;
						  break;
						case 5:
							datalist=data.importinfolist;
						  break;
						case 6:
							datalist=data.protectlist;
						  break;
						default:
							break;
						}
						for(var i=0;i<datalist.length;i++){
							var survey=datalist[i];//单个动物监测点
							var ptgcj02=GPS.gcj_encrypt(survey.weidu,survey.jingdu);
							var pt={
									"lnglat":[ptgcj02.lon,ptgcj02.lat],
									"id":survey.id,
									"survey":survey,
									"style":type-1
							};
							pts.push(pt);
						}
						//定义点
						 ptlist[type-1] = new AMap.MassMarks(pts, {
					            opacity:0.8,
					            zIndex: 111,
					            cursor:'pointer',
					            style:style
					      });
						 //var infoWindow = new AMap.InfoWindow();
					     // var marker = new AMap.Marker({content:' ',map:map});
					      ptlist[type-1].on('mouseover',function(e){
					        //marker.setPosition(e.data.lnglat);
					        //marker.setLabel({content:e.data.id});
					         var content=getptinfo(type,e.data.survey);
					    	 infoWindow.setContent(content);
					    	 infoWindow.open(map, e.data.lnglat);
					      });
					      ptlist[type-1].setMap(map);
					      //ptlist[type-1]=mass;
					}
					else{
						alert(data.errormsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		}
		//直接显示点
		function visiblepts(type){
			ptlist[type-1].show();
		}
		//隐藏点
		function hidept(type) {
			ptlist[type-1].hide();
		}
		function getptinfo(type,survey){
			var info = [];
			switch(type)
			{
			case 1:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>褐马鸡野外种群状况监测</label>");
				info.push("保护站:"+survey.baohuzhan);
				info.push("小地名:"+survey.xiaodiming);
				info.push("实体数量:"+survey.shitishuliang);
				info.push("填表时间:"+survey.tianbiaoshijian);
				info.push("样线号:"+survey.yangxianhao);
				info.push("记录号:"+survey.jiluhao);
				info.push("<a href='/travel/survey/querychick.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 2:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>红外相机监测数据</label>");
				info.push("相机编号:"+survey.xiangjibianhao);
				info.push("安装日期:"+survey.anzhuangriqi);
				info.push("安装人员:"+survey.anzhuangrenyuan);
				info.push("小地名:"+survey.xiaodiming);
				info.push("<a href='/travel/survey/querycamera.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 3:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>动物状况监测信息</label>");
				info.push("样线号:"+survey.yangxianhao);
				info.push("动物名称:"+survey.dongwumingcheng);
				info.push("实体数量:"+survey.shitishuliang);
				info.push("尸体数量:"+survey.bodyshuliang);
				info.push("填表时间:"+survey.tianbiaoshijian);
				info.push("<a href='/travel/survey/queryanimal.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 4:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>森林植物群落监测</label>");
				info.push("样方号:"+survey.yangfanghao);
				info.push("群系名称:"+survey.qunximingcheng);
				info.push("树种名:"+survey.shuzhongming);
				info.push("标本编号:"+survey.biaobenbianhao);
				info.push("填表时间:"+survey.tianbiaoshijian);
				info.push("<a href='/travel/survey/queryplant.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 5:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>动植物相关重要信息</label>");
				info.push("填报单位:"+survey.tianbaodanwei);
				info.push("名称:"+survey.mingcheng);
				info.push("痕迹类型:"+survey.henjileixing);
				info.push("发现地点:"+survey.faxiandidian);
				info.push("发现时间:"+survey.faxianshijian);
				info.push("发现人员:"+survey.faxianrenyuan);
				info.push("填写时间:"+survey.tianxieshijian);
				info.push("<a href='/travel/survey/queryimportinfo.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 6:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>保护区巡护记录</label>");
				info.push("保护站名称:"+survey.baohuzhanmingcheng);
				info.push("巡护人员:"+survey.xunhurenyuan);
				info.push("巡护日期:"+survey.xunhuriqi);
				info.push("动物名称:"+survey.dongwumingcheng);
				info.push("数量:"+survey.shuliang);
				info.push("<a href='/travel/survey/queryprotect.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			default:
				break;
			}
			return info.join("<br/>");
		}
		//地图点样式
		 var style = [{
             url: '/travel/includes/image/survey/mass0.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: '/travel/includes/image/survey/mass1.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: '/travel/includes/image/survey/mass2.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: '/travel/includes/image/survey/mass3.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: '/travel/includes/image/survey/mass4.png',
               anchor: new AMap.Pixel(6, 6),
               size: new AMap.Size(11, 11)
             },{
          	   url: '/travel/includes/image/survey/mass5.png',
               anchor: new AMap.Pixel(6, 6),
               size: new AMap.Size(11, 11)
             }
         ];
		 function ChangeDiTuTile() {
			    if (!tileLayerDitu) {
			        tileLayerDitu = new AMap.TileLayer({
			            map: map
			        });
			    }
			    //隐藏卫星图
			    if (tileLayerSatellite) {
			        tileLayerSatellite.hide();
			    }
			    //隐藏路网图
			    if (tileLayerRoad) {
			        tileLayerRoad.hide();
			    }
			    tileLayerDitu.show();
			}
			//切换到卫星影像底图
			function ChangeSatelliteTile() {
			    if (!tileLayerSatellite) {
			        tileLayerSatellite = new AMap.TileLayer.Satellite({
			            map: map
			        });
			    }
			    //隐藏地图
			    if (tileLayerDitu) {
			        tileLayerDitu.hide();
			    }
			    tileLayerSatellite.show();
			    if (!tileLayerRoad) {
			        tileLayerRoad = new AMap.TileLayer.RoadNet({
			            map: map
			        });
			    }
			    tileLayerRoad.show();
			}
	</script>
</body>
</html>
