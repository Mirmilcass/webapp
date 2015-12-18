<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="db.DBAction, java.sql.*, beans.AddrBean, java.util.*"
	errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>* 주소록 만들기 *</h3>
		<hr>
		<table WIDTH="100%">
			<tr>
				<td>
					<table BORDER="1" ALIGN="center" CELLPADDING="0" CELLSPACING="0">
						<tr>
							<TD COLSPAN="6" ALIGN="center">주소록</TD>
						</tr>
						<tr STYLE="text-align: center;">
							<td>아이디</td>
							<td>이름</td>
							<td>전화번호</td>
							<td>주소</td>
							<td COLSPAN="2">관리</td>
							<%
								DBAction db = DBAction.getInstance();
								String sql = "select * from addrbook order by id desc";

								PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();
								Map datas = new HashMap();
								while (rs.next()) {
							%>
						
						<tr>
							<%
								String id = rs.getString("id");
									String name = rs.getString("name");
									String phone = rs.getString("phone");
									String addr = rs.getString("addr");
									AddrBean addrbean = new AddrBean();
									addrbean.setId(id);
									addrbean.setName(name);
									addrbean.setPhone(phone);
									addrbean.setAddr(addr);
							%>
							<td><%=addrbean.getId()%></td>
							<td><%=addrbean.getName()%></td>
							<td><%=addrbean.getPhone()%></td>
							<td><%=addrbean.getAddr()%></td>

							<td>
								<a HREF="addr_update_form.jsp?id=<%=id%>">수정</a>
							</td>
							<td>
								<a HREF="addr_delete.jsp?id=<%=id%>">삭제</a>
							</td>
						</tr>
						<%
							datas.put(id, addrbean);
							}
							session.setAttribute("datas", datas);
						%>
						<tr ALIGN="center">
							<td COLSPAN="2">
								<a HREF="add.jsp"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>