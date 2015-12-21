<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, db.DBAction, board.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String reqPage = request.getParameter("page");
	String no = request.getParameter("no");

	//임시 조회수 제한하기 위한 변수
	BoardMgr mgr = BoardMgr.getInstance();
	BoardData bd = mgr.selectedBoardData("board_list", Integer.parseInt(no), true);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 확인</title>
</head>
<body>
	<center>
		<h3>* 게시물 확인 *</h3>
		<hr>
		<p>
		<table WIDTH="800" BORDER="3" BORDERCOLOR="#000">
			<tr>
				<td WIDTH="15%" ALIGN="center">작성자</td>
				<td><%=bd.getId()%></td>
			</tr>
			<tr>
				<td ALIGN="center">날 짜</td>
				<td><%=bd.getWdate()%></td>
			</tr>
			<tr>
				<td ALIGN="center">조회수</td>
				<td><%=bd.getReadno()%></td>
			</tr>
			<tr>
				<td ALIGN="center">제 목</td>
				<td><%=bd.getTitle()%></td>
			</tr>
			<tr>
				<td COLSPAN="2"><%=bd.getContent()%>
				</td>
			</tr>
			<Tr>
				<td COLSPAN="2" ALIGN="center">
					<a href="board_list.jsp?page<%=reqPage%>"> [ 목록보기 ]</a>
					&nbsp;
					<a href="board_write_re_from.jsp?page<%=reqPage%>%no=<%=no%>">
						[ 답변쓰기 ]</a>
					&nbsp;
					<a href="board_update_from.jsp?page<%=reqPage%>%no=<%=no%>"> [
						수정하기 ]</a>
					&nbsp;
					<a href="board_delete.jsp?page<%=reqPage%>%no=<%=no%>"> [ 삭제하기
						]</a>
					&nbsp;
				</td>
			</Tr>
		</table>
	</center>
</body>
</html>