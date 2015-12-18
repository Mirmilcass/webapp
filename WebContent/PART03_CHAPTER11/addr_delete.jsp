<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, beans.*, db.DBAction, java.sql.*"
	errorPage="../errors/error.jsp" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	DBAction db = DBAction.getInstance();
	String sql = "delete addrbook where id=?";
	PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	response.sendRedirect("addr_list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>