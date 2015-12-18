<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, db.DBAction"%>

<!-- create table guestbook(
			SEQ_GUESTBOOK number(10),   
			name varchar2(20) primary key,
			title varchar2(100),
			email varchar2(200),
			content varchar2(4000),
			wdate varchar2(50));
			/mysql에서는 오토인크리먼트 속성 사용.
	create sequence seq_guestbook start with 1 INCREMENT BY 1 nocache;-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<script language="javascript">
	function check(form1) {
		var name = document.form1.name.value;
		if (name == "") {
			alert("이름 입력 하세요 ");
			document.form1.name.focus();
		} else {
			form1.submit();
		}
	}
</script>
</head>
<body>
	<center>
		<h3>* 방명록 *</h3>
		<hr>
		<p>
		<form name="form1" action="book_confirm.jsp" method="post">
			<table border='3'>
				<tr>
					<td align="center">이 름</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td align="center">제 목</td>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td align="center">E-mail</td>
					<td>
						<input type="text" name="email">
					</td>
				</tr>
				<tr>
					<td align="center">
						<font color="#1545EA"> 내 용 </font>
					</td>
					<td>
						<textarea rows="20" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan=2 height=40>
						<input type="button" value="ok" onClick="check(this.form)">
						&nbsp;&nbsp;
						<input type="reset" value="cancel">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>