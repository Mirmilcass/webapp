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
		request.setAttribute("name1", "홍길동");
		request.setAttribute("name2", "김길동");
		request.setAttribute("name3", "박길동");
		request.setAttribute("name4", "최길동");
		request.setAttribute("name5", "이길동");

		for (int i = 1; i <= 5; i++) {
			request.setAttribute("str", "name" + i);
	%>
	${requestScope[str] }
	<p />
	${requestScope.str }
	<p />
	<%
		}
	%>
</body>
</html>