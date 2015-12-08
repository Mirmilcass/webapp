import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginForm
 */
@WebServlet("/LoginForm")
public class LoginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginForm() {
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
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet ServletTest</title>");
		out.println("</head>");
		out.println("<body>");
		//		out.println("<Center>");
		//		out.println("<h1> 안녕하세요, 서블릿 페이지 입니다.</h1>");
		//		out.println("</Center>");
		out.println("<form ACTION=/webapp/LoginDispatcher METHOD=get>");
		out.println("<table border=5 bordercolor=BLUE cellpadding=2 cellspacing=1 align=center>");
		out.println("<tr>");
		out.println("<td colspan=2 align=center>Login</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>ID</td>");
		out.println("<td><input name=id type=text size=20 maxlength=10></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>PASSWORD</td>");
		out.println("<td><input name=pw type=password size=20 maxlength=10></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td colspan=2 align=center><input type=submit value=OK>&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value=Cencle></td>");
		out.println("</tr>");
		//		out.println("<tr>");
		//		out.println("<td colspan=2 align=center><a href=Join.html>회원가입</a></td>");
		//		out.println("</tr>");
		out.println("<tr>");
		out.println("<td colspan=2 align=center><a href=Join.html><input type=submit value=회원가입></a></td>");
		out.println("</tr>");
		//		out.println("<tr>");
		//		out.println("<td colspan=2 align=center><input type=button value=회원가입 새창/온 onclick=window.open('Join.html')></td>");
		//		out.println("</tr>");
		//		out.println("<tr>");
		//		out.println("<td colspan=2 align=center><input type=button value=회원가입 현재창/온 onclick=location.href='Join.html'></td>");
		//		out.println("</tr>                                                                                                                        ");
		out.println("</table>                                                                                                                         ");
		out.println("<h3 align=center>어서오세요</h3>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
		out.close();

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
