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
	<%@ page import="java.util.*"%>
	<%
		Hashtable htable = new Hashtable();

		htable.put("사과", "apple");
		htable.put("딸기", "strawberry");
		htable.put("포도", "grape");

		int[] arr = { 1, 2, 3, 4, 5 };

		request.setAttribute("htable", htable);
		request.setAttribute("arr", arr);
	%>
	<c:set var="ht" value="${htable }" />

	<c:forEach var="element" items="${ht }">
	>> ${element.key } : ${element.value } <br>
	</c:forEach>

	<c:forEach var="test" begin="1" end="10" step="2">
		<b>${test}</b>&nbsp;</c:forEach>

	<c:forTokens items="a,b,c,d,e,f,g" delims="," var="alphabet">
		<b>${alphabet}</b>&nbsp;</c:forTokens>

	<c:forEach var="num" items="${arr }">
		${num }   
		</c:forEach>
</body>
</html>