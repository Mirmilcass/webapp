import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ConnectionPoolTest
 */
@WebServlet("/ConnectionPoolTest")
public class ConnectionPoolTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConnectionPoolTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String sql = "select * from customer order by num asc";
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		PrintWriter out = response.getWriter();

		// Connection pool
		Connection conn = null;
		try {
			InitialContext initctx = new InitialContext();
			Context ctx = (Context) initctx.lookup("java:/comp/env");
			DataSource ds = (DataSource) ctx.lookup("JDBC/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			out.println("<center><h3>UserInfo Table View</h3><hr><table border='1'><tr>");
			for (int i = 1; i <= cnt; i++) {
				out.println("<td align=center>" + rsmd.getColumnName(i) + "</td>");
			}
			out.println("</tr");
			while (rs.next()) {
				out.println("<tr>");
				for (int i = 1; i <= cnt; i++) {
					out.println("<td><b>" + rs.getString(i) + "</b></td>");
				}
				out.println("</tr>");
			}
			out.println("</table>");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			out.close();
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
