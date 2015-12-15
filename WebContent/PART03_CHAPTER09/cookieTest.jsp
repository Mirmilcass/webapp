<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DBAction, java.sql.*"%>
<%!public DBAction db;
	public Connection conn;
	public String sql;%>
<%
	request.setCharacterEncoding("UTF-8");
	db = DBAction.getInstance();
	conn = db.getConnection();
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");

	sql = "select * from userinfo where id =? and pass=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	ResultSet rs = pstmt.executeQuery();
	out.println("<Center> * 쿠키정보 확인합시다 * <hr>");
	try {
		if (rs.next()) {
			Cookie cookie1 = new Cookie("id", id);
			Cookie cookie2 = new Cookie("pass", pass);

			cookie1.setMaxAge(60 * 60);
			cookie2.setMaxAge(60 * 60);

			application.setAttribute("cookie1", cookie1);
			application.setAttribute("cookie2", cookie2);
			// 쿠키 저장
			response.addCookie(cookie1);
			response.addCookie(cookie2);

			out.println(id + " 님 환영합니다 <p>");
			out.println("<a href = \"cookiePro.jsp\"> [ 확인하기 ] </a>");
		} else {
			// 			out.println("password를 확인하세요 <br><a href= \"loginTestCookie.html\">[다시로긴]</a>");
			out.println("password를 확인하세요 <br><a href= \"layout.jsp\">[다시로긴]</a>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
