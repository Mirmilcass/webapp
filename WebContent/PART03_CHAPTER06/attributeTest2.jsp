<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	<%
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");

		session.setAttribute("email", email);
		session.setAttribute("tel", tel);
		session.setAttribute("address", address);

		String name = (String) application.getAttribute("name");
	%>
	<h3>
		<%=name%>님의 정보가 모두 저장되었습니다.
	</h3>
	<a href="attributeTest3.jsp" style="text-decoration: none;">확인하러 가기</a>
</body>
</html>