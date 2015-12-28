<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, db.DBAction, board.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String reqPage = request.getParameter("page");
	String no = request.getParameter("no");

	BoardMgr mgr = BoardMgr.getInstance();
	BoardData bd = mgr.selectedBoardData("board_list", Integer.parseInt(no), false);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
</head>
<body BGCOLOR="#eeeeee" text="#fb3c00">
	<center>
		<h3>* 게시판 글 수정 *</h3>
		<hr>
		<p>
		<form ACTION="board_update.jsp?page<%=reqPage%>&no=<%=no%>"
			METHOD="post">
			<table BORDER="1">
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b>작성자</b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="name" READONLY="readonly"
							VALUE="<%=bd.getName()%>">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> I D </b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="id" READONLY="readonly"
							VALUE="<%=bd.getId()%>">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> 제 목 </b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="title"
							VALUE="<%=bd.getTitle()%>">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> 내 용 </b>
					</td>
					<td>
						<textarea ROWS="10" COLS="50" NAME="content"><%=bd.getContent()%></textarea>
					</td>
				</tr>
				<tr ALIGN="right">
					<td COLSPAN="2">
						<input TYPE="submit" VALUE="글쓰기">
						&nbsp;&nbsp;
						<input TYPE="reset" VALUE="Reset">
						&nbsp;&nbsp;
						<input type="button" value="돌아가기"
							onClick="javascript:history.go(-1)">
						&nbsp;&nbsp;
						<input TYPE="button" VALUE="리스트"
							ONCLICK="location.href='board_list.jsp?page<%=reqPage%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>