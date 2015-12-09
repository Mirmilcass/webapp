import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginDispatcher
 */
@WebServlet("/LoginDispatcher")
public class LoginDispatcher extends HttpServlet {

	/*
	학습 목표
	1) JDBC/DBCP
	2) Databases 검색
	3) RequsetDispatcher instance 사용
		forward 서블릿에서 다른 리소스에 전달 요청
		include 동적 페이지 자원의 내용을 포함
	4) ServletContext instance 활용(속성 정보 저장).
	*/

	private Connection conn;

	@Override
	public void init() throws ServletException {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Successful Drivaer loading");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "hr", "hr");
			System.out.println("Connection Successful");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String id;
		String pw;
		PrintWriter out;

		id = request.getParameter("id");
		pw = request.getParameter("pw");
		out = response.getWriter();

		ServletContext sc = this.getServletContext();
		RequestDispatcher loginSuccess = sc.getRequestDispatcher("/LoginSuccess");
		RequestDispatcher loginfail = sc.getRequestDispatcher("/Loginfail");
		RequestDispatcher loginIDfail = sc.getRequestDispatcher("/LoginIDfail");

		String sql = "Select name,pass from customer where id='" + id + "'";
		Statement stmt = null;

		out.println("<center>");
		out.println("<hr>");

		//		String sql = "Select * from bankadmin where id=?";
		//		PreparedStatement prstmt;

		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("pass").equals(pw)) {
					//					out.println("로그인 성공 <b>" + rs.getString("name") + "</b> 님 환영합니다.<br> <a href=login.html>로그아웃</a>");
					sc.setAttribute("name", rs.getString("name"));
					loginSuccess.forward(request, response);
				} else {
					//TODO : login pass fail
					//					out.println("login pass fail");
					loginfail.forward(request, response);
				}
			} else {
				//TODO : login id fail
				//				out.println("login id fail");
				loginIDfail.forward(request, response);
			}
			out.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		//		out.println("<html><head><title>로그인 연습 서블릿 </title></head><body><center> 아이디 : " + id + "<br> 암호 : " + pw
		//				+ "</center></body></html>");
		//		out.close();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
