<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>옵션 선택 화면</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/PART03_CHAPTER07/view.jsp">
		<!-- 	<form action="view.jsp"> -->
		보고 싶은 페이지 선택
		<br>
		<select name="code">
			<option value="A">A 페이지</option>
			<option value="B">B 페이지</option>
			<option value="C">C 페이지</option>
		</select>
		<br>
		<input type="submit" value="이동">
	</form>

</body>
</html>