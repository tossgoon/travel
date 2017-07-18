<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>新增勘察工程</title>
</head>
<body>

<!-- 如果不使用标签，则为<form action="/jktech/kc/add.action" method="post"> -->
	<s:form action="add" namespace="/kc" method="post">
		<table width="500" align="center">
			<caption>新增勘察工程</caption>
			<tr height="26px">
				<td width="150px" align="right">工程名称</td>
				<td width="350px"><input type="hidden" name="param" value="1" />
					<input type="text" name="kcgc.name" value="${kcgc.name }" /></td>
			</tr>

			<tr height="26px">
				<td colspan="2" align="center" width="500"><input type="submit"
					value="保存" /> <input type="button" value="Back"
					onclick="window.history.back(-1)" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>