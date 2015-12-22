<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.*"%>
<%!int reqPageNo;
	BoardData data[];
	String reqPage;
	BoardMgr mgr;
	int count = 1;%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<td WIDTH="100" STYLE="color: white;">번 호</td>
				<td WIDTH="100" STYLE="color: white;">I D</td>
				<td WIDTH="200" STYLE="color: white;">날 짜</td>
				<td WIDTH="300" STYLE="color: white;">제 목</td>
				<td WIDTH="100" STYLE="color: white;">조회수</td>
			</tr>
			<%
				reqPage = request.getParameter("page"); // page
				if (reqPage != null)
					reqPageNo = Integer.parseInt(reqPage);

				mgr = BoardMgr.getInstance();
				int pageCount = mgr.getPageCount("Board_list");
				if (pageCount == 0) {
			%>
			<tr BGCOLOR="white">
				<td COLSPAN="5" ALIGN="center">저장된 글이 없습니다.</td>
			</tr>
			<%
				} else {
					if (reqPageNo < 1) {
						reqPageNo = 1;
					}
					// 현재 보여지고 있는 페이지의 정보
					data = mgr.selectedBoardDataList("Board_list", reqPageNo);
					for (int i = 0; i < data.length; i++) {
			%>
			<tr>
				<td ALIGN="center">
					<%=(data[i].getNested() == 0) ? data[i].getGroup() : ""%>
				</td>
				<td ALIGN="center">
					<%=data[i].getId()%>
				</td>
				<td ALIGN="center">
					<%=data[i].getWdate()%></td>
				<td>
					<%
						if (data[i].getNested() > 0) {
					%>
					<%-- <img src="img/a.gif" WIDTH="<%=data[i].getNested() * 10%>"
						ALT="리플 표시">
					<img src="img/b.gif"> --%>
					<c:forEach var="re" begin="1" end="<%=data[i].getNested()%>">
					&nbsp;
					</c:forEach>
					RE :
					<%
						}
					%>
					<a
						HREF="board_read.jsp?page=<%=reqPageNo%>&no=<%=data[i].getNum()%>&count=<%=count%>">
						<%=data[i].getTitle()%>
					</a>
				</td>
				<td ALIGN="center"><%=data[i].getReadno()%></td>
			</tr>
			<%
				}
				}
			%>
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
					<a HREF="board_list.jsp?page=<%=i%>">
						[<%=i%>]
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