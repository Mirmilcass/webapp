<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		Cookie cookies[] = request.getCookies();
		response.setContentType("text/html;charset=UTF-8");
		out.println("* 쿠키 삭제 * <hr> ");
		for (int i = 0; i < cookies.length; i++) {
			cookies[i] = (Cookie) application.getAttribute("cookie" + (i + 1));
			if (cookies[i] != null) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		out.println("<h3> 삭제 되었습니다. </h3>");
		// 		cookies = null;
		// 		try {
		// 			if (cookies == null) {
		// 			} else {
		// 				throw new Exception(" 삭제 에러 ");
		// 			}
		// 		} catch (Exception e) {
		// 			e.printStackTrace();
		// 		}
	%>

</body>
</html>