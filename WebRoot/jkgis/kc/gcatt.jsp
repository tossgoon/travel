<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'gcatt.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	This is my JSP page.
	<br>
	<s:form action="add" namespace="/gcatt" method="post">
		<table width="500" align="center">
			<caption>新增勘察工程附件</caption>
			<tr height="26px">
				<td width="150px" align="right">工程ID</td>
				<td width="350px"><input type="hidden" name="param" value="1" /> <input type="text" name="gcAttach.gcid" value="${gcAttach.gcid }" /></td>
			</tr>
			<tr height="26px">
				<td width="150px" align="right">文件名称</td>
				<td width="350px"><input type="hidden" name="param" value="1" /> <input type="text" name="gcAttach.filename" " /></td>
			</tr>
			<tr height="26px">
				<td colspan="2" align="center" width="500"><input type="submit" value="保存" /> <input type="button" value="Back"
						onclick="window.history.back(-1)" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>
