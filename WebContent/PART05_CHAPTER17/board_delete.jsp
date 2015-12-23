<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, db.DBAction, board.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!BoardMgr mgr;
	BoardData bd;
	DBAction db;
	boolean insert_confirm;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>* 게시물 삭제 *</title>
</head>
<body BGCOLOR="#eeeeaa" TEXT="#fb3c00">
	<center>
		<h3>* 게시물 결과 *</h3>
		<hr>
		<p>
			<%
				request.setCharacterEncoding("UTF-8");
				String reqPage = request.getParameter("page");
				String no = request.getParameter("no");

				BoardMgr mgr = BoardMgr.getInstance();
				BoardData bdTaget = mgr.selectedBoardData("board_list", Integer.parseInt(no), false);

				bd = new BoardData();
				db = DBAction.getInstance();

				bd.setGroup(bdTaget.getGroup());
				bd.setOrder(bdTaget.getOrder());
				bd.setNested(bdTaget.getNested());

				mgr = BoardMgr.getInstance();

				insert_confirm = mgr.insertBoardData("board_list", bd);
			%>
			<br>
		<p>
			<br>
		<p>
			<br>
		<p>
			<%
				if (insert_confirm) {
			%>
		
		<h3>
			<b>글을 저장하였습니다.</b>
		</h3>
		<%
			} else {
				out.println("<h1><b> 삭제 실패 !!! </h1>");
			}
		%>
		<p>
			<a HREF="board_list.jsp">리스트</a>
	</center>
</body>
</html>