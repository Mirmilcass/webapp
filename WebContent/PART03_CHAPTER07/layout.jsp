<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout1</title>
</head>
<body>
	<table width="400" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="2"><jsp:include page="top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
				<jsp:include page="login.jsp" />
			</td>
			<td>
				<!-- 				내용 부분 : 시작 -->
				<!-- 				레이아웃 1 -->
				<!-- 				<br> -->
				<!-- 				<br> -->
				<!-- 				<br> -->
				<!-- 				내용 부분 : 끝 -->
				<%
					if (request.getParameter("code") != null) {
				%>
				<jsp:include page="info.jsp" />
				<%
					} else {
				%>
				<jsp:include page="select.jsp" />
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="bottom.jsp" />
			</td>
		</tr>
	</table>

</body>
</html>