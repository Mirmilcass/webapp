<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.*, java.util.*, java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInfo list</title>
</head>
<body bgcolor=#eeeeee text=#fb3c00>
	<center>
		<br>
		<p>
			<br>
		<p>
		<h1>회원 정보</h1>
		<p>
		<hr>
		<br>
		<p>
		<table border=1 cellspacing="0" width="800"	style="text-align: center;">
			<fmt:requestEncoding value="utf-8" />
			<tr>
				<c:forTokens var="token" items="id,pass,name,regist" delims=",">
					<th>${token }</th>
				</c:forTokens>
			</tr>
			<tr>
				<td>${user.id }</td>
				<td>${user.pass }</td>
				<td>${user.name }</td>
				<td>${user.regist }</td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="userinfo.do?reqview=insertform"> insert </a> &nbsp;&nbsp;
					<a href="userinfo.do?reqview=update_form&id=${user.id }"> update </a> &nbsp;&nbsp;
					<a href="userinfo.do?reqview=remove&id=${user.id }"> remove </a> &nbsp;&nbsp;
					<a href="javascript:history.go(-1)"> back </a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>