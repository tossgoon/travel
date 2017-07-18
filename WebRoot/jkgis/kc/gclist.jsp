<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<s:form action="query" namespace="/kc" method="post">
		<table align="center">
			<tr>
				<td style="vertical-align: middle;">工程名称 <input type="text"
					style="width: 300px;height: 30px;font-size: 16px" name="queryText"
					value="${searchText}" /> <input type="submit" value="查询"
					style="width: 100px;height: 30px;font-size: 16px" /> <input
					type="button" value="新增"
					style="width: 100px;height: 30px;font-size: 16px"
					onclick="window.location.href='/kc/add.action?param=0'" />
				</td>
			</tr>
		</table>
		<s:submit value="submit" />
	</s:form>

	<table align="center" border="1" cellpadding="0" cellspacing="0"
		bordercolor="#3366cc">
		<tr align="center" bgcolor="#3399cc" height="26px">
			<td width="100">ID</td>
			<td width="160">工程名称</td>
			<td width="70">单位</td>
			<td width="70">坐标</td>
		</tr>

		<c:forEach var="kcgc" items="${kcgcs}">
			<tr align="center" height="24px">
				<td width="100">${kcgc.id}</td>
				<td width="160">${kcgc.name}</td>
				<td width="70">${kcgc.danwei }</td>
				<td width="70">${kcgc.shape }</td>
				<td width="120"><a
					href="kc/update.action?param=0&id=${kcgc.id}">编辑</a>&nbsp;&nbsp; <a
					href="kc/delete.action?id=${kcgc.id}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>