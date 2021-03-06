import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.WindowsInternalFrameTitlePane.ScalableIconUIResource;

/**
 * Servlet implementation class LoginSuccess
 */
@WebServlet("/LoginSuccess")
public class LoginSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginSuccess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");

		ServletContext sc = getServletContext();
		RequestDispatcher header = sc.getRequestDispatcher("/Header");
		RequestDispatcher footer = sc.getRequestDispatcher("/Footer");
		String name = (String) getServletContext().getAttribute("name");
		PrintWriter out = response.getWriter();
		header.include(request, response);
		out.println("<center>로그인 성공 <br> <b>" + name
				+ " 님 환영합니다.<br> <a href=login.html Style=text-decoration: none;>로그아웃</a>");
		footer.include(request, response);
		out.close();
	}

}
