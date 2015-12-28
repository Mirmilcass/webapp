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
		<h1>회원가입 관리자 페이지</h1>
		<p>
		<hr>
		<br>
		<p>
		<table border=1 cellspacing="0" width="800"
			style="text-align: center;">
			<fmt:requestEncoding value="utf-8" />
			<tr>
				<c:forTokens var="token" items="id,pass,name,regist" delims=",">
					<th>${token }</th>
				</c:forTokens>
			</tr>
			<tr>
				<c:forEach var="userbean" items="${users }">
					<!-- EL구문으로 컨트롤러에서 보낸 users를 받음. -->
					<tr>
						<td>${userbean.id }</td>
						<td>${userbean.pass }</td>
						<td><a href="userinfo.do?reqview=read&id=${userbean.id }">${userbean.name }</a></td>
						<td>${userbean.regist }</td>
					</tr>
				</c:forEach>
			</tr>
			<tr align="center">
				<td colspan="4"><input type="button" value=" 회원추가 "
					onClick="location.href='userinfo.do?reqview=insertform'"></td>
			</tr>
		</table>
	</center>
</body>
</html>