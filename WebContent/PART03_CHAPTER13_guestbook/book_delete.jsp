<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBAction, java.util.*"
	errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<%!DBAction db;
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	String sql;
	String num;%>
<%
	request.setCharacterEncoding("utf-8");
	num = request.getParameter("num");
	db = DBAction.getInstance();

	sql = "delete from guestbook where seq_guestbook=?";
	pstmt = db.getConnection().prepareStatement(sql);
	pstmt.setString(1, num);
	int result = pstmt.executeUpdate();
	if (result < 1) {
		response.sendRedirect("book_error.jsp?message=deletefail...");
	} else {

		/* sql = "update guestbook set seq_guestbook = seq_guestbook -1 where (seq_guestbook > ?)";
		pstmt = db.getConnection().prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate(); */
		pstmt.close();
		response.sendRedirect("book_list.jsp");
	}
%>
<body>

</body>
</html>

