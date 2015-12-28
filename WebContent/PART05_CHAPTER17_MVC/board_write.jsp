<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, db.DBAction, board.*, beans.MyCalendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!BoardMgr mgr;
	BoardData bd;
	DBAction db;
	boolean insert_confirm;
	MyCalendar mycal;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 게시물 결과</title>
</head>
<body BGCOLOR="#eeeeaa" TEXT="#fb3c00">
	<center>
		<h3>* 게시물 결과 *</h3>
		<hr>
		<p>
			<%
				mycal = new MyCalendar();
				bd = new BoardData();
				db = DBAction.getInstance();

				String title = request.getParameter("title");
				String name = request.getParameter("name");
				String id = request.getParameter("id");
				String content = request.getParameter("content");

				bd.setTitle(title);
				bd.setName(name);
				bd.setId(id);
				bd.setContent(content);
				bd.setWdate(mycal.getToday());

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
				out.println("<h1><b> 저장 실패 !!! </h1>");
			}
		%>
		<p>
			<a HREF="board_list.jsp">리스트</a>
	</center>

</body>
</html>