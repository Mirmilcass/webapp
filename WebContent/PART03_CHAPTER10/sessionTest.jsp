<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>
			<p>
				<%
					String str = (String) session.getAttribute("id");
					if (str == null) {
				%>
				session none.....
			</p>
			<p>
				<a href="../PART02_CHAPTER03/insert_Form.jsp">[ 회원 가입 페이지로 이동 ]</a>
			</p>
			<p>
				<a href="login.jsp">[ 로그인 페이지로 이동 ]</a>
				<%
					} else {
				%>
				<%=str%>님 로그인 중입니다.
			</p>
			<p>
				<%
					}
				%>
			
		</h1>
	</center>

</body>
</html>