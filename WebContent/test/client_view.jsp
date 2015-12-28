<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="beans.ClientBean, java.util.*"
	session="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList clientList = (ArrayList) session.getAttribute("client");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bean JSP</title>
<style type="text/css">
table #t {
	border: 1;
	border-bottom-style: hidden;
	border-top-style: hidden;
	text-align: center;
	border-bottom-style: hidden;
	cellpadding: 0;
	cellspacing: 0;
}

td .c {
	border-bottom-style: hidden;
	border-top-style: hidden;
}
</style>
</head>
<body>
	<center>
		<h3>* 회원 정보 *</h3>
		<hr>
		<p>
		<table id="t">
			<tr>
				<td class="c">이 름</td>
				<td class="c">전화번호</td>
				<td class="c">직업</td>
			</tr>
			<%
				for (int i = 0; i < clientList.size(); i++) {
					ClientBean clientData = (ClientBean) clientList.get(i);
			%>
			<tr>
				<td class="c"><%=clientData.getName()%></td>
				<td class="c"><%=clientData.getPhone()%></td>
				<td class="c"><%=clientData.getJob()%></td>
			</tr>
			<%
				}
			%>

		</table>
	</center>

</body>
</html>