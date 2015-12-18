<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addr_form</title>

</head>
<body>
	<center>
		<h3>* 주소록 추가 *</h3>
		<hr>
	</center>
	<table WIDTH="100%">
		<tr>
			<Td>
				<form METHOD="post" ACTION="add.jsp">
					<table BORDER="1" ALIGN="center" STYLE="text-align: center;">
						<tr>
							<td COLSPAN="2">사용자 추가</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td>
								<input TYPE="text" NAME="id">
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input TYPE="text" NAME="name">
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
								<input TYPE="text" NAME="phone">
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input TYPE="text" NAME="addr">
							</td>
						</tr>
						<tr>
							<td COLSPAN="2">
								<input TYPE="submit" VALUE="사용자 추가">
								<input TYPE="reset" VALUE="Reset">
							</td>
						</tr>
					</table>
				</form>
			</Td>
	</table>
</body>
</html>