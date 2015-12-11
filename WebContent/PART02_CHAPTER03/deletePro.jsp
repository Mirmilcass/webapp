<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.net.URLEncoder, beans.UserBean, java.sql.*, javax.naming.*,javax.sql.* "%>
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
<title>삭제 예제</title>
</head>
<body>

</body>
</html>