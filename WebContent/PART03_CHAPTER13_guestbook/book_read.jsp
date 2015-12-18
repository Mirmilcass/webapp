<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, db.DBAction" errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>* 방명록 *</title>
<script type="text/javascript">
	function goUpdate(f, num){
		f.action = "book_update_form.jsp?num=" + num;
		f.submit();
	}
	function goList(f){
		f.action = "book_list.jsp";
		f.submit();
	}
</script>
</head>
<%
	DBAction db;
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	String sql;
%>
<!-- <a href="javascript:history.back()">전 페이지 가기</a>
<a href="javascript:location.reload()">새로고침</a>
<a href="javascript:history.forward">다음 페이지 가기</a> -->
<body>
	<center>
		<h3>* 방명록 게시물 *</h3>
		<hr>
		<p>
			<%
				try {
					request.setCharacterEncoding("utf-8");
					db = DBAction.getInstance();
					con = db.getConnection();

					String num = request.getParameter("num");
					sql = "select * from guestbook where seq_guestbook=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, num);
					rs = pstmt.executeQuery();

					if (rs.next()) {
			%>
		
		<form name="book" action="book_delete.jsp?num=<%=num%>" method="post">
			<table border='1'>
				<tr>
					<td width="50" height="25" align="center">번 호</td>
					<td><%=rs.getString(1)%></td>
				</tr>
				<tr>
					<td width="50" height="25" align="center">이 름</td>
					<td><%=rs.getString(2)%></td>
				</tr>
				<tr>
					<td width="50" height="25" align="center">제 목</td>
					<td><%=rs.getString(3)%></td>
				</tr>
				<tr>
					<td width="50" height="25" align="center">이메일</td>
					<td><%=rs.getString(4)%></td>
				</tr>
				<tr>
					<td width="50" height="25" align="center">내 용</td>
					<td width="300" height="200"><%=rs.getString(5)%></td>
				</tr>
				<tr align="center">
					<td colspan=2 height=40>
						<input type="submit" value=" 삭  제 ">
						&nbsp;&nbsp;
						<input type="button" value=" 리 스 트 " onClick="goList(this.form)">
						&nbsp;&nbsp;
						<input type="button" value=" 수  정 "
							onClick="goUpdate(this.form, <%=num%>)">
						<!-- &nbsp;&nbsp;<input type="button" value=" 리 스 트 " onClick="javascript:history.go(-1)">&nbsp;&nbsp;
					<input type="button" value=" 수  정 " onClick="javascript:history.go(-1)">&nbsp;&nbsp; -->
					</td>
				</tr>
			</table>
			<%
				} else {
						out.println("<h3> 실 패 </h3>");
					}
				} catch (Exception e) {
					response.sendRedirect("book_error.jsp?message+readfail...");
				}
			%>
		</form>
	</center>
</body>
</html>