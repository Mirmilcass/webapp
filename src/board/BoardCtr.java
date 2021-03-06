package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc_ch21.UserServiceImpl;
import beans.UserBean;

/**
 * Servlet implementation class BoardCtr
 */
@WebServlet("/Board.do")
public class BoardCtr extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEWPATH = "/PART05_CHAPTER17_MVC/";
	private static final String ERRORPATH = "/errors/";

	public BoardCtr() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// user request page
		String requestpage = request.getParameter("reqview");

		// service
		UserServiceImpl service = new UserServiceImpl();
		ServletContext ctx = request.getServletContext();

		// user request handle
		if (requestpage.equals("index")) {
			ctx.getRequestDispatcher(VIEWPATH + "index.jsp").forward(request, response);
		} else if (requestpage.equals("list")) {
			ArrayList<UserBean> users = (ArrayList<UserBean>) service.userList();
			request.setAttribute("users", users);
			ctx.getRequestDispatcher(VIEWPATH + "board_list.jsp").forward(request, response);
		} else if (requestpage.equals("insert")) {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String regist = request.getParameter("regist");
			int result = service.userInsert(id, pass, name, regist);
			if (result > 0) {
				ctx.getRequestDispatcher(VIEWPATH + "success.jsp").forward(request, response);
			} else {
				ctx.getRequestDispatcher(ERRORPATH + "fail.jsp").forward(request, response);
			}
		} else if (requestpage.equals("read")) {
			request.setAttribute("user", service.findById(request.getParameter("id")));
			ctx.getRequestDispatcher(VIEWPATH + "board_read.jsp").forward(request, response);
		} else if (requestpage.equals("insertform")) {
			ctx.getRequestDispatcher(VIEWPATH + "board_write_form.jsp").forward(request, response);
		} else if (requestpage.equals("update_form")) {
			request.setAttribute("user", service.findById(request.getParameter("id")));
			ctx.getRequestDispatcher(VIEWPATH + "board_update_from.jsp").forward(request, response);
		} else if (requestpage.equals("update")) {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String regist = request.getParameter("regist");
			int result = service.userUpdate(id, pass, name, regist);
			if (result > 0) {
				ctx.getRequestDispatcher(VIEWPATH + "success.jsp").forward(request, response);
			} else {
				ctx.getRequestDispatcher(ERRORPATH + "fail.jsp").forward(request, response);
			}
		} else if (requestpage.equals("remove")) {
			String id = request.getParameter("id");
			int result = service.userDelete(id);
			if (result > 0) {
				ctx.getRequestDispatcher(VIEWPATH + "success.jsp").forward(request, response);
			} else {
				ctx.getRequestDispatcher(ERRORPATH + "fail.jsp").forward(request, response);
			}
		}
	}
}
