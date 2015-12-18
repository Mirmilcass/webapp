<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DBAction, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script TYPE="text/javascript" LANGUAGE="javaScript">
	function pain() {
		opener.document.all.cheak.value = document.all.cheak.value
		self.close()
	}
</script>
</head>
<body>
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");

			String sql = "select email from users where email = ?";

			DBAction db = DBAction.getInstance();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();

				if (rs.next()) {
		%>
		<%=email%>
		는 이미 사용중인 E-mail 입니다 .....
		<input TYPE="button" VALUE="닫기" ONCLICK="window.close()">
		<%
			} else {
		%>
		<%=email%>
		는 사용 가능 합니다.
		<br>
		<input type="hidden" VALUE="1" NAME="cheak">
		<input type="button" VALUE="닫기" ONCLICK="pain()">
		<%
			}
			} catch (SQLException e) {
				e.getStackTrace();
			}
		%>

	</center>
</body>
</html>