<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	if (type != null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<table width="100%" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>타잎</td>
			<td>
				<b><%=type%></b>
			</td>
		</tr>
		<tr>
			<td>특징</td>
			<td>
				<%
					if (type.equals("A")) {
				%>
				강한 내구성.
				<%
					} else if (type.equals("B")) {
				%>
				뛰어난 대처능력
				<%
					}
				%>
			</td>
		</tr>
	</table>
	<%
		}
	%>

</body>
</html>