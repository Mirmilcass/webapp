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
		<h1>회원 정보 수정</h1>
		<p>
		<hr>
		<br>
		<p>
		<form method="post" action="/webapp/userinfo.do">
			<input type="hidden" name="id" value="${user.id }" /> 
			<input type="hidden" name="reqview" value="update" />
			<table border=1 cellspacing="0" width="300"
				style="text-align: center;">
				<fmt:requestEncoding value="utf-8" />
				<tr>
					<th align="right" height="50" width="100"><b>ID
							&nbsp;&nbsp;</b></th>
					<td><input type="text" name="id" value="${user.id }"
						readonly></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>PASS
							&nbsp;&nbsp;</b></th>
					<td><input type="text" name="pass"
						value="${user.pass }"></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>NAME
							&nbsp;&nbsp;</b></th>
					<td><input type="text" name="name"
						value="${user.name }"></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>REGSIT
							&nbsp;&nbsp;</b></th>
					<td><input type="text" name="regist"
						value="${user.regist }"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="정보수정">&nbsp;&nbsp;
						<input type="button" value=" 뒤로가기 " onClick="javascript:history.go(-1)">&nbsp;&nbsp;
						<input type="button" value=" 목록보기 " onClick="location.href='userinfo.do?reqview=list'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>