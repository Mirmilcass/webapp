<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, mvc_ch21.*, beans.*"%>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList clientList = (ArrayList) session.getAttribute("client");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bean JSP</title>
</head>
<body bgcolor=#eeeeee text=#fb3c00>
	<center>
		<h3>* 회원 정보 *</h3>
		<hr>
		<p>
		<table width="500" border=1 cellspacing="0"
			style="border-left-style: hidden; border-right-style: hidden">
			<tr align="center"
				style="border-left-style: hidden; border-right-style: hidden; background-color: aqua;">
				<td style="border-left-style: hidden;">이 름</td>
				<td>전화번호</td>
				<td style="border-right-style: hidden;">직 업</td>
			</tr>
			<%
				for (int i = 0; i < clientList.size(); i++) {
					ClientBean clientData = (ClientBean) clientList.get(i);
			%>
			<tr align="center"
				style="border-left-style: hidden; border-right-style: hidden">
				<td style="border-left-style: hidden;"><%=clientData.getName()%></td>
				<td><%=clientData.getPhone()%></td>
				<td style="border-right-style: hidden;"><%=clientData.getJob()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>

</body>
</html>