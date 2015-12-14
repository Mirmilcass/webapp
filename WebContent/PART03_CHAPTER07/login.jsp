<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DBAction, java.sql.*"%>
<%!public DBAction db;
	public Connection conn;
	public String sql;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>

		<script type="text/javascript" language="javascript">
			function check(form_1) {
				var id = document.f.id.value;
				var pass = document.f.pw.value;
				if (id == "") {
					alert(" 아이디를 입력해주세요 ");
					document.f.id.focus();
				} else {
					if (pass == "") {
						alert(" 암호를 입력해주세요 ");
						document.f.pw.focus();
					} else {
						form_1.submit();
					}
				}
			}
		</script>


		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			if (id == null || pw == null) {
		%>
		<!-- 		<form name=f method="post" action="login.jsp"> -->
		<!-- 		<form name=f method="post" action="layout.jsp"> -->
		<form name=f method="post" action="cookieTest.jsp">
			<br>
			<br>
			<br>
			<h2>^^</h2>
			<table border="5" bordercolor="BLUE" cellpadding="2" cellspacing="1"
				align="center">
				<tr>
					<td colspan="2" align="center">Login</td>
				</tr>
				<tr>
					<td>ID</td>
					<td>
						<input NAME="id" type="text" size="20" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td>
						<input NAME="pw" type="password" size="20" maxlength="10">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="OK" onclick="check(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="Cencle">
					</td>
				</tr>
			</table>
		</form>
		<%
			} else {
				String sql = "select * from userinfo where id = ? and pass = ?";

				db = DBAction.getInstance();
				conn = db.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				ResultSet rs = pstmt.executeQuery();
				try {
					if (rs.next()) {
		%>
		<br>
		<h3>
			"
			<%=id%>
			님, 로그인 하셨습니다 ~~ ^^ * "
			<%
			session.setAttribute("id", rs.getString("name"));
						session.setAttribute("name", rs.getString("name"));
		%>

			<a href="layout.jsp">
				<input type="submit" value="로그아웃">
			</a>
		</h3>
		<p>

			<%
				} else {
			%>

			<!-- 		<form name=f method="post" action="login.jsp"> -->
		<form name=f method="post" action="cookieTest.jsp">

			<h2>ㅠㅠ</h2>
			<table border="5" bordercolor="BLUE" cellpadding="2" cellspacing="1"
				align="center">
				<tr>
					<td colspan="2" align="center">Login</td>
				</tr>
				<tr>
					<td>ID</td>
					<td>
						<input NAME="id" type="text" size="20" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td>
						<input NAME="pw" type="password" size="20" maxlength="10">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="OK" onclick="check(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" value="Cencle">
					</td>
				</tr>
			</table>
		</form>
		<%
			}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		%>

	</center>
</body>
</html>