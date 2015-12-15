<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="myinfo" class="beans.UserBean" scope="request" />
		<p>
		<p>
		<p>
			<jsp:setProperty property="name" name="myinfo" />
			<jsp:setProperty property="id" name="myinfo" />
			현재 설정된 이름 :
			<jsp:getProperty property="name" name="myinfo" /><br>
			현재 설정된 아이디 :
			<jsp:getProperty property="id" name="myinfo" /><br> 
		<hr>
		<p>
		<form name="formName" action="scope.jsp">
			이름 : <input type="text" NAME="name">
			<br>
			아이디 : <input TYPE="text" NAME="id">
			<p>

				&nbsp;&nbsp; <input TYPE="submit" VALUE="이름 & 나이 변경">
		</form>
		<a HREF="scope.jsp" STYLE="text-decoration: blink;">새로 고침</a>
	</center>
</body>
</html>