<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBAction, java.util.*"
	errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!DBAction da;
	String sql;
	Connection con;
	PreparedStatement pstmt;%>
<jsp:useBean id="guest" class="beans.GuestBook"></jsp:useBean>
<jsp:setProperty property="*" name="guest" />

<%
	String name = guest.getName();
	String title = guest.getTitle();
	String email = guest.getEmail();
	String content = guest.getContent();

	da = DBAction.getInstance();
	con = da.getConnection();
	sql = "update guestbook set title=?, email=?, content=? where name=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, email);
	pstmt.setString(3, content);
	pstmt.setString(4, name);
	int result = pstmt.executeUpdate();
	if (result < 1) {
		response.sendRedirect("book_error.jsp?message=updatefail...");
	} else {
		pstmt.close();
		response.sendRedirect("book_list.jsp");
	}
%>
<body>

</body>
</html>