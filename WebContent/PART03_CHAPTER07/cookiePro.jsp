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
		out.println("* 쿠키 정보 보기 * <hr> ");
		if (cookies == null) {
			out.println("cookie 정보 없음");
		} else {
			for (int i = 0; i < cookies.length; i++) {
				out.println("Cookie의 이름 : " + cookies[i].getName());
				out.println("Cookie의 값 : " + cookies[i].getValue() + "<p>");
			}
			out.println("<a href=\"cookieRemove.jsp\"> [ 쿠키 삭제 ] </a>");
		}
	%>


</body>
</html>