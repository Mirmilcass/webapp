<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삽입 예제</title>
</head>
<body>
	<h2>insert 예제</h2>
	<P>
	<hr>
	<CENTER>
		<FORM ACTION="insertPro.jsp" METHOD="post">
			id: <INPUT TYPE="text" name="id">
			<br>
			pass: <INPUT TYPE="text" name="pass">
			<br>
			name: <INPUT TYPE="text" name="name">
			<br>
			regist: <INPUT TYPE="text" name="regist">
			<br>
			<INPUT TYPE="submit" VALUE="전송">
			<br>
			<HR>
			<a href="userinfolist.jsp"> 회원 목록 보기 </a>
		</FORM>
	</CENTER>
</body>
</html>