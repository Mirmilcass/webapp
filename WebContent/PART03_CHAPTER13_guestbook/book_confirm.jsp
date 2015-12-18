<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBAction, java.util.*"
	errorPage="../errors/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%!DBAction da;
	String sql;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String seq_num;

	Calendar cal = new GregorianCalendar();%>
	<jsp:useBean id="guest" class="beans.GuestBook"></jsp:useBean>
	<jsp:setProperty property="*" name="guest" />

	<%
		request.setCharacterEncoding("utf-8");
		String name = guest.getName();
		String title = guest.getTitle();
		String email = guest.getEmail();
		String content = guest.getContent();
		/* String name = request.getParameter("name");
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		String content = request.getParameter("content"); */

		String day = (String) (cal.get(Calendar.YEAR) + "년" + (cal.get(Calendar.MONTH) + 1) + "월"
				+ (cal.get(Calendar.DATE)) + "일" + (cal.get(Calendar.HOUR)) + "시" + (cal.get(Calendar.MINUTE))
				+ "분" + (cal.get(Calendar.SECOND)) + "초");

		// wdate 컬럼 속성을 date로 했을 경우
		// oracle : wdate date -> insert ... sysdate 또는 current_timestamp(컬럼 속성이 timestamp 타입인 경우)
		// mysql : wdate date -> insert ... now() 내장 함수로 날짜 저장

		da = DBAction.getInstance();
		con = da.getConnection();
		sql = "select name from guestbook where name=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			response.sendRedirect("book_error.jsp?message=insertfalil...");
		} else {

			sql = "insert into guestbook values(SEQ_GUESTBOOK.nextval, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, email);
			pstmt.setString(4, content);
			pstmt.setString(5, day);
			pstmt.executeUpdate();

			sql = "select * from guestbook where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			try {
				rs = pstmt.executeQuery();
				if (rs.next()) {
					seq_num = rs.getString(1);
	%>
	<center>
		<h3>* 방명 기록 *</h3>
		<hr />
		<p>
			제목 :
			<%=title%>
		<p>
		<table border='1'>
			<tr align="center">
				<td>순 번</td>
				<td>이 름</td>
				<td>제 목</td>
				<td>E-Malil</td>
				<td>내 용</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td><%=seq_num%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
			</tr>
		</table>
		<br>
		<a href="book_form.jsp">[ 글 쓰 기 ]</a>
		&nbsp;&nbsp;
		<a href="book_list.jsp">[ 리 스 트 ]</a>
		<%
			sql = "select count(*) from guestbook";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							int start = rs.getInt(1);
							int end = Integer.parseInt(seq_num);
							if (start != end) {
								//sql = "update guestbook set seq_guestbook=? where seq_guestbook=?";  //oracle
								sql = "update guestbook set num=? where num=?"; //mysql
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, start);
								pstmt.setInt(2, end);
								int result = pstmt.executeUpdate();
								if (result < 1) {
									response.sendRedirect("book_error.jsp?message=insertfail...");
								} else {
									System.out.println("seq update...");
								}
							}
						}
					} else {
		%>
		오류 DB 확인 하시고 다시 시도하세요.
		<br>
		<a href="book_form.jsp">[ 다시 입력 ]</a>
		&nbsp;&nbsp;
		<a href="book_list.jsp">[ 리 스 트 ]</a>
		<%
			}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
				}
			}
		%>
	</center>
</body>
</html>