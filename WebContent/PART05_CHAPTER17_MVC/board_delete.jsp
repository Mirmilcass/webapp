<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String reqPage = request.getParameter("page");
	String no = request.getParameter("no");
	BoardMgr bMgr = BoardMgr.getInstance();
	bMgr.deleteBoardData("board_list", Integer.parseInt(no));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제</title>
</head>
<body>
	<center>
		<h3>* 게시물 삭제 *</h3>
		<hr>
		<p>
			<b> 삭제했습니다. </b>
		<table width="650" border="3" bordercolor="#000000">
			<tr>
				<td colspan="2"><a href=board_list.jsp?page= <%=reqPage%>>
						[ 목록보기 ] </a></td>
			</tr>
		</table>
	</center>
</body>
</html>