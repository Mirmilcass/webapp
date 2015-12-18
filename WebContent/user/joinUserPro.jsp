<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DBAction, java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userin" class="beans.Joins" />
<jsp:setProperty property="*" name="userin" />
<%
	DBAction db = DBAction.getInstance();
	Connection conn = db.getConnection();
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if (request.getParameter("cheak").equals("true")) {
			sql = "select * from users where email=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userin.getU_email());
				rs = pstmt.executeQuery();
				if (!(rs.next())) {
					sql = "insert into users(email,pass, name, tel) values (?,?,?,?)";
					pstmt.setString(1, userin.getU_email());
					pstmt.setString(2, userin.getU_password());
					pstmt.setString(3, userin.getU_name());
					pstmt.setInt(4, userin.getU_phone());

					int result = pstmt.executeUpdate();
					String str = result > 0 ? "success" : "fail";
					response.sendRedirect("form_design.html?result=" + str);

				} else {
	%>

	<%
		}
			} catch (SQLException e) {
				e.getStackTrace();
			}
	%>

	<%
		} else {
	%>
	<script TYPE="text/javascript">
		alert("중복 체크를 하지 않으셨습니다.");
	</script>
	<%
		return;
		}
	%>
</body>
</html>
