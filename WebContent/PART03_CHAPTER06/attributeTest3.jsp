<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	<%
		request.setCharacterEncoding("UTF-8");

		String name = (String) application.getAttribute("name");
		String id = (String) application.getAttribute("id");

		// 		String email = (String) session.getAttribute("email");
		// 		String tel = (String) session.getAttribute("tel");
		// 		String address = (String) session.getAttribute("address");

		Enumeration e = session.getAttributeNames();
		while (e.hasMoreElements()) {
			String attributeName = (String) e.nextElement();
			String AttributeValue = (String) session.getAttribute(attributeName);
	%>
	<h3 align="center">
		<%=name%>님의 정보
	</h3>
	<table align="center" style="text-align: center;">
		<tr>
			<td>아이디</td>
			<td><%=id%></td>
		</tr>
		<tr>
			<td><%=attributeName%></td>
			<td><%=AttributeValue%></td>
		</tr>

		<%
			}
		%>

	</table>

</body>
</html>