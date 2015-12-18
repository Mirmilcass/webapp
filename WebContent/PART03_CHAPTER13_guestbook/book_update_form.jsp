<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, db.DBAction, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<script language="javascript">
	function check(form1) {
		var name = document.form1.name.value;
		if (name == "") {
			alert("이름 입력 하세요 ");
			document.form1.name.focus();
		} else {
			form1.submit();
		}
	}
</script>
</head>
<%!DBAction db;
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	String sql;%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	db = DBAction.getInstance();
	sql = "select * from guestbook where seq_guestbook=?";
	pstmt = db.getConnection().prepareStatement(sql);
	pstmt.setString(1, num);
	rs = pstmt.executeQuery();
%>
<body>
	<center>
		<h3>* 방명록 수정 *</h3>
		<hr>
		<p>
		<form name="form1" action="book_update.jsp?num=<%=num%>"
			<%try {
				if (rs.next()) {%> method="post">
			<table border='3'>
				<tr>
					<td align="center">이 름</td>
					<td>
						<input type="text" name="name" readonly
							value="<%=rs.getString("name")%>">
					</td>
				</tr>
				<tr>
					<td align="center">제 목</td>
					<td>
						<input type="text" name="title" value="<%=rs.getString("title")%>">
					</td>
				</tr>
				<tr>
					<td align="center">E-mail</td>
					<td>
						<input type="text" name="email" value="<%=rs.getString("email")%>">
					</td>
				</tr>
				<tr>
					<td align="center">
						<font color="#1545EA"> 내 용 </font>
					</td>
					<td>
						<textarea rows="20" cols="50" name="content"><%=rs.getString("content")%></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan=2 height=40>
						<input type="button" value="내용 수정" ONCLICK="check(this.form)">
						&nbsp;&nbsp;
						<input type="reset" value="취 소">
						&nbsp;&nbsp;
						<input type="button" value="돌아가기"
							onClick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
			<%
				} else {
						out.println("<h3> 실 패 </h3>");
					}
				} catch (Exception e) {
					response.sendRedirect("book_error.jsp?message=updatefail...");
				}
			%>
		</form>
	</center>
</body>
</html>