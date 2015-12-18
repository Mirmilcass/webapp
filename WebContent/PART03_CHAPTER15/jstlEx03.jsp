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
	<%
		request.setAttribute("fruit", "banana");
	%>

	<c:set var="fruit" value="${fruit }" />
	<c:if test="${empty fruit }">
		<c:out value="과일 없다" />
	</c:if>
	<c:if test="${!empty fruit }" var="result">
		<c:out value="${fruit }" />
		${result }
	</c:if>

	<c:choose>
		<c:when test="${fruit == 'apple' }">
			<c:out value="${fruit }" /> : 사과 </c:when>
		<c:when test="${fruit == 'banana' }">
			<c:out value="${fruit }" /> : 바나나 </c:when>
		<c:when test="${fruit == 'orange' }">
			<c:out value="${fruit }" /> : 오렌지 </c:when>
		<c:otherwise>기타 등등
	</c:otherwise>
	</c:choose>

</body>
</html>