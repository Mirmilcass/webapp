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
		request.setAttribute("number", 100);
		session.setAttribute("str", "홍길동");
	%>

	<h3>표현 언어에서 사용 가능한 데이터</h3>

	[1] 정수형 = ${10 }
	<p>[1-1] request scope 변수 : ${requestScope.number}
	<p>[1-1] request scope 변수 : ${number}
	<p>
		[1-2]
		<%=request.getAttribute("number")%>
	<p>[1-3] session scope 변수 : ${str}
	<p>

		[1-4]
		<%=session.getAttribute("str")%>
	<p>[1-5] 파라미터 값 : ${user }
	<p>[1-6] 파라미터 값 2 : ${param.user }
	<p>[2] 실수형 : ${5.6 }
	<p>[3] 문자열 : ${"정도령" }
	<p>[4] null값 : ${null }
	<p>
</body>
</html>