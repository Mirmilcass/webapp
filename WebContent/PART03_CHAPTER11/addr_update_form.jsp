<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, beans.AddrBean"
	errorPage="../errors/error.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	Object obj = session.getAttribute("datas");
	HashMap datas = (HashMap) obj;
	AddrBean user = (AddrBean) datas.get(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>* 주소록 수정 *</h3>
		<hr>
		<table WIDTH="100%">
			<tr>
				<td>
					<form METHOD="post" ACTION="addr_update.jsp">
						<table BORDER="1" ALIGN="center">
							<tr>
								<td COLSPAN="2" ALIGN="center">사용자 수정</td>
							</tr>

							<tr>
								<td>아이디</td>
								<td>
									<input type="text" NAME="id" VALUE="<%=user.getId()%>">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" NAME="name" VALUE="<%=user.getName()%>">
								</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>
									<input type="text" NAME="phone" VALUE="<%=user.getPhone()%>">
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>
									<input type="text" NAME="addr" VALUE="<%=user.getAddr()%>">
								</td>
							</tr>
							<tr>
								<td COLSPAN="2" ALIGN="center">
									<input TYPE="submit" VALUE="사용자 추가">
									<input type="reset" VALUE="Reset">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>