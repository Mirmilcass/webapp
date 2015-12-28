<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
</head>
<body bgcolor = #eeeeee text=#fb3c00>
<center>
	<h2> * 로그인 * </h2>
	<form method="post" action="/webapp/ProcessSvt">
		<table border=0 cellspacing="0">
			<tr>
				<td align="right" height="50" width="100"><b>ID &nbsp;&nbsp;</b></td>
				<td> <input type="text" size="30" name="id"></td>
			</tr>
			<tr>
				<td align="right" height="50" width="100"><b>PASS &nbsp;&nbsp;</b></td>
				<td> <input type="text" size="30" name="pass"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>