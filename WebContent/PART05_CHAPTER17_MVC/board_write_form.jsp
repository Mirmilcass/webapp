<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
</head>
<body BGCOLOR="#eeeeee" text="#fb3c00">
	<center>
		<h3>* 게시판 글쓰기 *</h3>
		<hr>
		<p>
		<form ACTION="board_write.jsp" METHOD="post">
			<table BORDER="1">
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b>작성자</b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="name">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> I D </b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="id">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> 제 목 </b>
					</td>
					<td>
						<input TYPE="text" size="30" NAME="title">
					</td>
				</tr>
				<tr>
					<td ALIGN="center" HEIGHT="50" WIDTH="100">
						<b> 내 용 </b>
					</td>
					<td>
						<textarea ROWS="10" COLS="50" NAME="content"></textarea>
					</td>
				</tr>
				<tr ALIGN="right">
					<td COLSPAN="2">
						<input TYPE="submit" VALUE="글쓰기">
					</td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>