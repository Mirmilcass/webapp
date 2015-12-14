<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Include Action Test</title>
</head>
<body>
	<h2>인클루드 액션 테스트</h2>
	<jsp:include page="insludeTest2.jsp">
		<jsp:param value="hongkildong" name="name" />
	</jsp:include>

</body>
</html>