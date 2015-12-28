<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
</head>
<body bgcolor=#eeeeee text=#fb3c00>
	<center>
		<h2>* 회원가입 *</h2><br><p><hr>
		<form method="post" action="/webapp/userinfo.do">
			<input type="hidden" name="reqview" value="insert"/>
			<table border=0 cellspacing="0">
				<tr>
					<th align="right" height="50" width="100"><b>ID &nbsp;&nbsp;</b></th>
					<td><input type="text" size="30" name="id"></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>PASS &nbsp;&nbsp;</b></th>
					<td><input type="text" size="30" name="pass"></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>NAME &nbsp;&nbsp;</b></th>
					<td><input type="text" size="30" name="name"></td>
				</tr>
				<tr>
					<th align="right" height="50" width="100"><b>REGSIT &nbsp;&nbsp;</b></th>
					<td><input type="text" size="30" name="regist"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="전송"></td>
				</tr>
			</table>
			<a href="userinfo.do?reqview=list">cancel</a> 
			<a href="javascript:history.go(-1)">back</a>
		</form>
	</center>
</body>
</html>