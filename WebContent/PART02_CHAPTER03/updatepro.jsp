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
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String regist = request.getParameter("regist");

		UserBean bean = new UserBean();
		bean.setId(id);
		bean.setPass(pass);
		bean.setName(name);
		bean.setRegist(regist);

		if (!(id != null && id.trim().length() > 0)) {
			out.println("전달 값 누락");
			return;
		}

		String sql = "UPDATE userinfo set pass=?, name=?, regist=? where id=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getPass());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getRegist());
		pstmt.setString(4, bean.getId());

		int result = pstmt.executeUpdate();
		String str = result > 0 ? "success" : "fail";
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect("userinfolist.jsp?result=" + URLEncoder.encode(str));
	%>

</body>
</html>