<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, db.DBAction, java.util.*"
	errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
</head>
<body>
	<center>
		<h3>* 방명 목록 *</h3>
		<hr>
		<p>
			<%!Calendar cal;
	ResultSet rs;
	ResultSetMetaData rsmd;
	int columns;
	DBAction da;
	String sql;%>
		<table border='1'>
			<%
				request.setCharacterEncoding("utf-8");
				cal = Calendar.getInstance();
				sql = "select * from guestbook order by seq_guestbook desc";
				PreparedStatement pstmt = DBAction.getInstance().getConnection().prepareStatement(sql);
				rs = pstmt.executeQuery();
			%>
			<tr align="center">
				<td>번 호</td>
				<td>이 름</td>
				<td>제 목</td>
				<td>메 일</td>
				<td>내 용</td>
				<td>작성일</td>
			</tr>
			<%
				try {
					rsmd = rs.getMetaData();
					columns = rsmd.getColumnCount();
					while (rs.next()) {
			%>
			<tr>
				<%
					for (int i = 1; i <= columns; i++) {
								if (i == 3) {
				%>
				<td align="center">
					<a href="book_read.jsp?num=<%=rs.getString(1)%>"><%=rs.getString(i)%></a>
				</td>
				<%
					} else {
				%>
				<td align="center"><%=rs.getString(i)%></td>
				<%
					}
							}
				%>
			</tr>
			<%
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			%>
			<tr>
				<td colspan="6" align="right">
					<a href="book_form.jsp"> 글쓰기 </a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>