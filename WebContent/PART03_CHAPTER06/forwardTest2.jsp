<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forward Action Test</title>
</head>
<body>
	<h2>포워드 된 페이지 (forwardTest2.jsp)</h2>
	<table>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("name")%>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=request.getParameter("age")%>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=request.getParameter("tel")%>
		</tr>
	</table>

</body>
</html>