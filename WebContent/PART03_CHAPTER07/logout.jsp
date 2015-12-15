<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SESSION</title>
</head>
<body>
	<h1>Session Test</h1>
	<%
		session.removeAttribute("id");
		session.removeAttribute("name");
		// session.invalidate();
		String sessionid = (String) session.getAttribute("id");
		String sessionname = (String) session.getAttribute("name");
		if (sessionid == null && sessionname == null) {
	%>
	<h3>로그아웃 하였습니다.</h3>
	<%
		} else {
	%>
	<h3><%=sessionid%>
		님 로그인 중입니다.
	</h3>
	<%
		}
		// 		response.sendRedirect("sessionTest.jsp");
	%>
	<a HREF="layout.jsp"> 홈으로 </a>
</body>
</html>