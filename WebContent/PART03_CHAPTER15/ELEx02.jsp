<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="beans.UserBean" />
	<jsp:setProperty property="id" name="user" value="aaa" />
	<jsp:setProperty property="name" name="user" value="bbb" />
	<h3>[액션 태그를 이용한 빈즈 객체 속성값 얻어 오기]</h3>
	<jsp:getProperty property="id" name="user" />
	<jsp:getProperty property="name" name="user" />
	<p />
	<h3>[표현 언어를 이용한 빈즈 객체 속성값 얻어 오기]</h3>

	<%
		request.setAttribute("aa", "id");
	%>
	${user.id } ${user.name }
	<p />
	${user[aa] } ${user["name"] }
	<p />
	${user[requestScope.aa] } ${user["name"] }
</body>
</html>