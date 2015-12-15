<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DBAction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		DBAction db = DBAction.getInstance();
		Connection conn = db.getConnection();
		
	%>
	<jsp:useBean id="userInfo" class="beans.UserBean" />
	<jsp:setProperty property="*" name="userInfo" />
	
	<h2>입력 하신 회원 정보 입니다.</h2>

	아이디 :
	<jsp:getProperty property="id" name="userInfo" /><br>
	비밀번호 :
	<jsp:getProperty property="pass" name="userInfo" /><br>
	이름 :
	<jsp:getProperty property="name" name="userInfo" /><br>
	주소 :
	<jsp:getProperty property="regist" name="userInfo" /><br>
	
	
</body>
</html>