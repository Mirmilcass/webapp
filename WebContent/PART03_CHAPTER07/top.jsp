<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				상단 메뉴 :
				<a href="layout.jsp">HOME</a>
				<a href="info.jsp">INFO</a>
			<td>
		</tr>
		<%
			String name = request.getParameter("name");
			// 			String name = (String) session.getAttribute("name");
			if (name != null) {
		%>
		<tr>
			<td align="right">
				<%=name%>
				님 어서오세요.
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>