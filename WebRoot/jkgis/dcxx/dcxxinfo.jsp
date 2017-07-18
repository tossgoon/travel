<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:form action="update?param=1" namespace="/dcxx" method="post" role="form" theme="simple" id="formDcxxinfo">
	<table class="bigfont" style="text-align:right;">
		<tr>
			<td>层号</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.ch"></s:textfield></td>
		</tr>
		<tr>
			<td>地层名称</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.dicengName"></s:textfield></td>
		</tr>
		<tr>
			<td>时代成因</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.shidaichengyin"></s:textfield></td>
		</tr>
		<tr>
			<td>地层颜色</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.dicengColor"></s:textfield></td>
		</tr>
		<tr>
			<td>含水率w(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.w"></s:textfield></td>
		</tr>
		<tr>
			<td>天然密度(g/cm3)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.gama"></s:textfield></td>
		</tr>
		<tr>
			<td>干密度(g/cm3)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.gamad"></s:textfield></td>
		</tr>
		<tr>
			<td>孔隙比E0</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.e"></s:textfield></td>
		</tr>
		<tr>
			<td>饱和度Sr(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.sr"></s:textfield></td>
		</tr>
		<tr>
			<td>液限WL(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.wl"></s:textfield></td>
		</tr>
		<tr>
			<td>塑限WP(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.wp"></s:textfield></td>
		</tr>
		<tr>
			<td>塑性指数Ip(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.ip"></s:textfield></td>
		</tr>
		<tr>
			<td>液性指数IL(%)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.il"></s:textfield></td>
		</tr>
		<tr>
			<td>压缩系数a1-2(MPa-1)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.a12"></s:textfield></td>
		</tr>
		<tr>
			<td>压缩模量Es1-2(MPa)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.es12"></s:textfield></td>
		</tr>
		<tr>
			<td>湿陷系数δs</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.delts"></s:textfield></td>
		</tr>
		<tr>
			<td>自重湿陷系数δzs</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.deltzs"></s:textfield></td>
		</tr>
		<tr>
			<td>粘聚力C(kPa)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.nianjvli"></s:textfield></td>
		</tr>
		<tr>
			<td>内摩擦角φ(°)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.neimocajiao"></s:textfield></td>
		</tr>
		<tr>
			<td>标贯N(击)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.biaoguan"></s:textfield></td>
		</tr>
		<tr>
			<td>动探修正N63.5(击)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.dongtan"></s:textfield></td>
		</tr>
		<tr>
			<td>承载力(kPa)</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.chengzaili"></s:textfield></td>
		</tr>
		<tr>
			<td>平均波速</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.pingjunbosu"></s:textfield></td>
		</tr>
		<tr>
			<td>地层描述</td>
			<td><s:textfield class="form-control input-sm" name="kcdcxx.dicengMiaoshu"></s:textfield></td>
		</tr>
	</table>
</s:form>
