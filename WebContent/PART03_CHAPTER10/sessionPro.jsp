<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session Test</h1>
	<%
		String sessionid = (String) session.getAttribute("id");
		if (sessionid == null) {
			session.setAttribute("id", "abc");
			session.setMaxInactiveInterval(10);
	%>
	<h3><%=session.getAttribute("id")%>
		님 로그인 하였습니다.
	</h3>
	<a HREF="logout.jsp"> 로그아웃 </a>
	<%
		} else {
	%>
	<h3><%=sessionid%>
		님 로그인 중입니다.
	</h3>
	<h3><%=session.getId()%>
		님 로그인 중입니다.
	</h3>
	<a HREF="logout.jsp"> 로그아웃 </a>
	<%
		}
	%>
</body>
</html>