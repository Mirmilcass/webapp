<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, javax.naming.*,javax.sql.*,java.net.URLDecoder,java.awt.CheckboxGroup"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!public Connection getConnection() {
		Connection conn = null;

		try {
			InitialContext initctx = new InitialContext();
			Context ctx = (Context) initctx.lookup("java:/comp/env");
			DataSource ds = (DataSource) ctx.lookup("JDBC/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInfo List</title>
</head>
<body>
	<center>
		<br>
		<p>
			<br>
		<p>
		<h1>회원 가입 관리자 페이지</h1>
		<p>
		<hr>
		<br>
		<p>
		<h3>
			<%
				request.setCharacterEncoding("UTF-8");
				String result = request.getParameter("result");
				if (result != null)
					out.println(URLDecoder.decode(result));
			%>
		</h3>
		<hr>
		<br>
		<p>
		<FORM action="update_form.jsp" method="post">
			<table border="1" style="text-align: center;">

				<%
					String sql = "select * from userinfo";
					Statement stmt = getConnection().createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					ResultSetMetaData rsmd = rs.getMetaData();
					int columcnt = rsmd.getColumnCount();

					CheckboxGroup ch = new CheckboxGroup();

					String colName[] = new String[columcnt];
					for (int i = 1; i <= columcnt; i++) {
						colName[i - 1] = rsmd.getColumnName(i);
					}
					request.setAttribute("colName", colName);
				%>
				<tr>
					<!-- for문 사용 -->
					<td>select</td>
					<c:forEach var="colname" items="${colName }">
						<td>${colname }</td>
					</c:forEach>
				</tr>
				<tr>
					<!-- for 토큰 -->
					<c:forTokens items="SELECT,ID,PASS,NAME,REGIST" delims=","
						var="colname">
						<td>${colname}</td>
					</c:forTokens>
				</tr>
				<%
					while (rs.next()) {
				%>

				<tr>
					<td>
						<input type="radio" name="sel" value="<%=rs.getString("id")%>" />
					</td>
					<%
						for (int i = 1; i <= columcnt; i++) {
								if (i == 1) {
					%>
					<td>
						<a href="deletePro.jsp?id=<%=rs.getString(i)%>"><%=rs.getString(i)%></a>
					</td>
					<%
						} else {
					%>
					<td>
						<%=rs.getString(i)%>
					</td>
					<%
						}
							}
					%>
				</tr>
				<%
					}
					// 				session.setAttribute("id", "4");
				%>


			</table>
			<p>
				<a href="insert_Form.jsp"> 회원 가입</a>
				&nbsp;&nbsp;
				<!-- 				<a href="update_form.jsp"> 회원 수정</a> -->
				<input type=submit value="회원 수정" />
				&nbsp;&nbsp;
				<a href="remove.jsp"> 회원 탈퇴</a>
		</form>
	</center>

</body>
</html>