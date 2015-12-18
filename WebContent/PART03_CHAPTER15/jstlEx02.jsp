<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="msg" value="${'Hello' }" />
	<c:set var="age"> ${30 }
	</c:set>
	<jsp:useBean id="user" class="beans.UserBean" />
	<c:set target="${user }" property="id" value="${'aaa' }" />
	<c:set target="${user }" property="name" value="${'bbb' }" />
	<c:out value="${msg }" />
	<p>
		<c:out value="${user.id }" default="ID" />
	<p>
		나이 :
		<c:out value="age" default="${10 }" />
	<p>
		<c:remove var="age" />
		나이 :
		<c:out value="${age }">${10 }</c:out>
		<c:catch var="errmsg">예외 발생전 <%=10 / 0%> 예외 발생 후 </c:catch>
		<c:out value="${errmsg }"></c:out>
</body>
</html>