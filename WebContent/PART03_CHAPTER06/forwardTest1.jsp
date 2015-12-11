<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<jsp:forward page='<%=request.getParameter("forwardPage")%>'>
		<jsp:param value="034-1234-5678" name="tel" />
	</jsp:forward>

</body>
</html>