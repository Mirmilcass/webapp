<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*,javax.sql.*, beans.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!public Connection getConnection() {
		Connection conn = null;

		try {
			InitialContext initctx = new InitialContext();
			Context ctx = (Context) initctx.lookup("java:/comp/env");
			DataSource ds = (DataSource) ctx.lookup("JDBC/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 예제</title>
</head>
<body>
	<h2>Updata 예제</h2>
	<p>
	<hr>
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("sel");
			String pass = "", name = "", regist = "";

			UserBean bean = new UserBean();
			bean.setId(id);

			String sql = "select * from userinfo where id=?";
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setPass(rs.getString("pass"));
				bean.setName(rs.getString("name"));
				bean.setRegist(rs.getString("regist"));
			}
		%>
		<form action="updatepro.jsp" method="post">
			id:
			<INPUT TYPE="text" name="id" value="<%=bean.getId()%>" readonly>
			<%-- 			<input type="hidden" name="id" value="<%=bean.getId()%>"> --%>
			<br>
			pass:
			<INPUT TYPE="text" name="pass" value="<%=bean.getPass()%>">
			<br>
			name:
			<INPUT TYPE="text" name="name" value="<%=bean.getName()%>">
			<br>
			regist:
			<INPUT TYPE="text" name="regist" value="<%=bean.getRegist()%>">
			<br>
			<INPUT TYPE="submit" VALUE="전송">
			<br>
			<HR>
			<a href="userinfolist.jsp"> 회원 목록 보기 </a>
		</form>

	</center>

</body>
</html>