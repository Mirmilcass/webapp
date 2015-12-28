<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="beans.*, java.util.*, java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
	<center>
		<h3>* 게시물 목록 *</h3>
		<hr>
		<p>
		<table WIDTH="800" CELLSPACING="1">
			<tr BGCOLOR="#0008b" ALIGN="center">
				<c:forTokens var="token" items="번호,I D,날 짜,제 목,조회수 " delims=",">
					<td WIDTH="100" STYLE="color: white;">${token }</td>
				</c:forTokens>
			</tr>
			<c:forEach var="userbean" items="${users }">
				<!-- EL구문으로 컨트롤러에서 보낸 users를 받음. -->
				<tr>
					<td>${userbean.id }</td>
					<td>${userbean.pass }</td>
					<td>
						<a href="userinfo.do?reqview=read&id=${userbean.id }">${userbean.name }</a>
					</td>
					<td>${userbean.regist }</td>
				</tr>
			</c:forEach>

			<tr>
				<td COLSPAN="5" ALIGN="right">
					<a HREF="board_write_form.jsp?page=<%=reqPageNo%>>">글쓰기</a>
				</td>
			</tr>
			<tr>
				<td ALIGN="center">
					<%
						for (int i = 1; i <= pageCount; i++) {
					%>
					<a HREF="board_list.jsp?page=<%=i%>"> [<%=i%>]
					</a>
					<%
						}
					%>
				</td>
			</tr>
		</table>
	</center>

</body>
</html>