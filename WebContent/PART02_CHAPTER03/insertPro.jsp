<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.UserBean"%>
<%@ page import="java.sql.*, javax.naming.*,javax.sql.*"%>
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

		// 요청자 입력값 가져오기.
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String regist = request.getParameter("regist");

		// 이후 자동화
		UserBean bean = new UserBean();
		bean.setId(id);
		bean.setPass(pass);
		bean.setName(name);
		bean.setRegist(regist);

		// DB핸들
		// 		String sql = "select id from userinfo where id= '" + id + "'";
		String sql = "insert into userinfo(id,pass, name, regist) values (?,?,?,?)";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPass());
		pstmt.setString(3, bean.getName());
		pstmt.setString(4, bean.getRegist());

		int result = pstmt.executeUpdate();
		String str = result > 0 ? "success" : "fail";
		response.sendRedirect("userinfolist.jsp?result=" + str);
	%>

</body>
</html>