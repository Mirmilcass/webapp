import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletEx2")
public class ServletEx2 extends HttpServlet {
	/*
	학습 목표
	
	request 객체 method 사용 & response 객체 method 사용
	
	request.getParameter(String name)
	request.getParameterNames()
	request.getParameterValues(String name)
	*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String check[];
		String checks = "";
		String fruit;
		String content;
		PrintWriter out;

		check = request.getParameterValues("check");
		fruit = request.getParameter("fruit");
		content = request.getParameter("content");
		java.util.Enumeration data = request.getAttributeNames();
		out = response.getWriter();
		for (int i = 0; i < check.length; i++) {
			checks += check[i];
			if (check.length > i + 1) {
				checks += ", ";
			}
		}
		while (data.hasMoreElements()) {
			out.println(data.nextElement());
		}
		out.println("<html><head><title>폼 연습 서블릿 </title></head><body><center>" + "취 미 : " + checks + "<br>" + "선 택 : "
				+ fruit + "<br>" + "내 용 : " + content + "</body></html>");
		out.close();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
