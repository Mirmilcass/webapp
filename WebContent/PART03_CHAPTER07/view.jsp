<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String select = request.getParameter("code");
		String viewPageURI = null;
		if (select != null) {
	%>
	선택한 페이지
	<br>
	<%
		if (select.equals("A")) {
				viewPageURI = "layout.jsp";
	%>
	<!-- 	A 페이지 -->

	<%
		} else if (select.equals("B")) {
	%>
	B페이지
	<%
		} else if (select.equals("C")) {
	%>
	C페이지

	<%
		}
		}
	%>
	<jsp:forward page="<%=viewPageURI%>" />
</body>
</html>