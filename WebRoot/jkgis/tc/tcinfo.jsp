<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:form action="update?param=1" namespace="/tc" method="post" role="form" theme="simple" id="formTcinfo">
	<table class="bigfont" style="text-align:right;">
		<tr>
			<td colspan="2"><label>钻孔统计信息</label> <s:hidden id="tcid" name="kctc.id"></s:hidden></td>
		</tr>
		<tr>
			<td>层底深度</td>
			<td><s:textfield class="form-control input-sm" name="kctc.cengdiDepth"></s:textfield></td>
		</tr>
		<tr>
			<td>平均波速(m/s)</td>
			<td><s:textfield class="form-control input-sm" name="kctc.pingjunbosu"></s:textfield></td>
		</tr>
		<tr>
			<td>平均锥尖阻力(MPa)</td>
			<td><s:textfield class="form-control input-sm" name="kctc.pingjunzhuijianzl"></s:textfield></td>
		</tr>
		<tr>
			<td>平均侧壁摩阻力(MPa)</td>
			<td><s:textfield class="form-control input-sm" name="kctc.pingjuncebimzl"></s:textfield></td>
		</tr>
		<tr>
			<td>平均比贯入阻力(MPa)</td>
			<td><s:textfield class="form-control input-sm" name="kctc.pingjunbiguanrzl"></s:textfield></td>
		</tr>
		<tr>
			<td>备注</td>
			<td><s:textfield class="form-control  input-sm" name="kctc.beizhu"></s:textfield></td>
		</tr>
	</table>
</s:form>
