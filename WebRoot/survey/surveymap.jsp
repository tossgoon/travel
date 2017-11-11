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

<title>OA系统-动物状况监测</title>

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
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/visitor/first.action">返回首页</a>
			<a style="float:right;margin-right:20px;"href="<%=contextPath%>/survey/chickedit.jsp">返回OA功能列表</a>
			
	</div>
		<div class="contentstyle">
		<div class="maincontent">
			<div  style="width:100%;border:1px solid #666666;margin:0px;margin-bottom:10px;">
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
	<script type="text/javascript" src="<%=contextPath%>/includes/js/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" charset="utf-8"  src="<%=contextPath%>/includes/js/webuploader-0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/includes/js/travel/gps.js"></script>
	<script type="text/javascript">
		var map;//地图
		var tileLayerDitu;        //切片地图
		var tileLayerSatellite;   //卫星影像图
		var tileLayerRoad;        //路网图层
		var marker;//标记
		//var ptlist=new Array();  
		var contextPath="<%=contextPath%>";
		var type=${maptype};//展示类型
		//var dtlist=  eval('(' + ${mapstr} + ')');//数据字符串
		var dtlist= ${mapstr};//数据字符串
		var ptsmap;//点在地图上的定义
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
				icon : contextPath+'/includes/image/redmarker.png',//24px*24px
				position : map.getCenter()
			});
			marker.setMap(map);
			// 设置label标签
			/* marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
						offset : new AMap.Pixel(-100, -30),//修改label相对于maker的位置
						content : "<label style='font-size:14px;'>延安黄龙山褐马鸡国家级自然保护区</label>"
					}); */
			//二维数据的定义 
			/* for(var i=0;i<6;i++){          //一维长度为6
				ptlist[i]='';    //初始化二维数组
			 }; */
			 //加载后根据日期查询相当的数据
			 //var type=GetQueryString("type");//类型
			 //var begindate=GetQueryString("begindate");//起始日期
			 //var enddate=GetQueryString("enddate");//终止日期
			 //var searchstr;
			 /* switch(type)
				{
				case "1":
					var baohuzhan=GetQueryString("baohuzhan");//保护站
					var xiaodiming=GetQueryString("xiaodiming");//小地名
					var jianceren=GetQueryString("jianceren");//监测人
					var shengjingleixing=GetQueryString("shengjingleixing");//生境类型
					searchstr="baohuzhan="+baohuzhan+"&xiaodiming="+xiaodiming+"&jianceren="+jianceren+"&shengjingleixing="+shengjingleixing;
				  break;
				case "2":
				  break;
				case "3":
					var jianceren=GetQueryString("jianceren");//监测人
					var dongwumingcheng=GetQueryString("dongwumingcheng");//动物名称
					var shengjingleixing=GetQueryString("shengjingleixing");//生境类型 
					searchstr="jianceren="+jianceren+"&dongwumingcheng="+dongwumingcheng+"&shengjingleixing="+shengjingleixing;
				  break;
				case "4":
				  break;
				case "5":
					var p1=GetQueryString("p1");//
					var p2=GetQueryString("p2");//
					var p3=GetQueryString("p3");//
					var p4=GetQueryString("p4");//
					var p5=GetQueryString("p5");//
					var p6=GetQueryString("p6");//
					var searchstr="p1="+p1+"&p2="+p2+"&p3="+p3+"&p4="+p4+"&p5="+p5+"&p6="+p6;
				  break;
				case "6":
				  break;
				default:
					break;
				} */
			 //loadpts(type,begindate,enddate,searchstr);
			 initPtList(dtlist,type);
			});
		//checkbox点击事件
		/* function toggle(type,checkbox){
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
		} */
		//异步加载显示点
		/* function loadpts(type,begindate,enddate,searchstr){
			 if(begindate==null)
				 {
				 begindate="";
				 }
			 if(enddate==null)
				 {
				 enddate="";
				 }
			 var infoWindow = new AMap.InfoWindow({ });
			 var datecondition="";//日期字符串
			 if(begindate==""&&enddate==""){
				 datecondition="";
			 }
			 else if(begindate==""){
				 datecondition="&enddate="+enddate;	 
			 }
			 else if(enddate==""){
				 datecondition="&begindate="+begindate;	 
			 }
			 else{
				 datecondition="&begindate="+begindate+"&enddate="+enddate;
			 }
			var url="";
			switch(type)
			{
			case "1":
				url=contextPath+"/survey/showchicklist.action?"+searchstr+datecondition;
			  break;
			case "2":
				url=contextPath+"/survey/showcameralist.action?1=1"+datecondition;
			  break;
			case "3":
				url=contextPath+"/survey/showanimallist.action?"+searchstr+datecondition;
			  break;
			case "4":
				url=contextPath+"/survey/showplantlist.action?1=1"+datecondition;
			  break;
			case "5":
				url=contextPath+"/survey/showimportlist.action?"+searchstr+datecondition;
			  break;
			case "6":
				url=contextPath+"/survey/showprotectlist.action?1=1"+datecondition;
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
						case "1":
							datalist=data.chicklist;
						  break;
						case "2":
							datalist=data.cameralist;
						  break;
						case "3":
							datalist=data.animallist;
						  break;
						case "4":
							datalist=data.plantlist;
						  break;
						case "5":
							datalist=data.importinfolist;
						  break;
						case "6":
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
		} */
		function initPtList(datalist,type){
			var pts=[];
			var infoWindow = new AMap.InfoWindow({ });
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
			 ptsmap = new AMap.MassMarks(pts, {
		            opacity:0.8,
		            zIndex: 111,
		            cursor:'pointer',
		            style:style
		      });
			 //var infoWindow = new AMap.InfoWindow();
		     // var marker = new AMap.Marker({content:' ',map:map});
		      ptsmap.on('mouseover',function(e){
		        //marker.setPosition(e.data.lnglat);
		        //marker.setLabel({content:e.data.id});
		         var content=getptinfo(type,e.data.survey);
		    	 infoWindow.setContent(content);
		    	 infoWindow.open(map, e.data.lnglat);
		      });
		      ptsmap.setMap(map);
		}
		//直接显示点
		/* function visiblepts(type){
			ptlist[type-1].show();
		}
		//隐藏点
		function hidept(type) {
			ptlist[type-1].hide();
		} */
		function getptinfo(type,survey){
			var info = [];
			switch(type)
			{
			case 1:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>褐马鸡野外种群状况监测</label>");
				info.push("保护站:"+survey.baohuzhan);
				info.push("小地名:"+survey.xiaodiming);
				info.push("实体数量:"+survey.shitishuliang);
				info.push("填表时间:"+survey.datestr);
				info.push("样线号:"+survey.yangxianhao);
				info.push("记录号:"+survey.jiluhao);
				info.push("<a href='"+contextPath+"/survey/querychick.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 2:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>红外相机监测数据</label>");
				info.push("相机编号:"+survey.xiangjibianhao);
				info.push("安装日期:"+survey.datestr);
				info.push("安装人员:"+survey.anzhuangrenyuan);
				info.push("小地名:"+survey.xiaodiming);
				info.push("<a href='"+contextPath+"/survey/querycamera.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 3:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>动物状况监测信息</label>");
				info.push("样线号:"+survey.yangxianhao);
				info.push("动物名称:"+survey.dongwumingcheng);
				info.push("实体数量:"+survey.shitishuliang);
				info.push("尸体数量:"+survey.bodyshuliang);
				info.push("填表时间:"+survey.datestr);
				info.push("<a href='"+contextPath+"/survey/queryanimal.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 4:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>森林植物群落监测</label>");
				info.push("样方号:"+survey.yangfanghao);
				info.push("群系名称:"+survey.qunximingcheng);
				info.push("树种名:"+survey.shuzhongming);
				info.push("标本编号:"+survey.biaobenbianhao);
				info.push("填表时间:"+survey.datestr);
				info.push("<a href='"+contextPath+"/survey/queryplant.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 5:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>动植物相关重要信息</label>");
				info.push("填报单位:"+survey.tianbaodanwei);
				info.push("名称:"+survey.mingcheng);
				info.push("痕迹类型:"+survey.henjileixing);
				info.push("发现地点:"+survey.faxiandidian);
				info.push("发现时间:"+survey.faxiandatestr);
				info.push("发现人员:"+survey.faxianrenyuan);
				info.push("填写时间:"+survey.datestr);
				info.push("<a href='"+contextPath+"/survey/queryimportinfo.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			case 6:
				info.push("<div style='margin:10px;'><label style='border-bottom:1px solid;padding-bottom:5px;'>保护区巡护记录</label>");
				info.push("保护站名称:"+survey.baohuzhanmingcheng);
				info.push("巡护人员:"+survey.xunhurenyuan);
				info.push("巡护日期:"+survey.xunhudatestr);
				info.push("动物名称:"+survey.dongwumingcheng);
				info.push("数量:"+survey.shuliang);
				info.push("<a href='"+contextPath+"/survey/queryprotect.action?id="+survey.id+"' target='_blank'>查看详细信息</a></div>");
			  break;
			default:
				break;
			}
			return info.join("<br/>");
		}
		//地图点样式
		 var style = [{
             url: contextPath+'/includes/image/survey/mass0.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: contextPath+'/includes/image/survey/mass1.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: contextPath+'/includes/image/survey/mass2.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: contextPath+'/includes/image/survey/mass3.png',
             anchor: new AMap.Pixel(6, 6),
             size: new AMap.Size(11, 11)
           },{
        	   url: contextPath+'/includes/image/survey/mass4.png',
               anchor: new AMap.Pixel(6, 6),
               size: new AMap.Size(11, 11)
             },{
          	   url: contextPath+'/includes/image/survey/mass5.png',
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
			function GetQueryString(name)
			{
			     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  unescape(r[2]); return null;
			}
	</script>
</body>
</html>
