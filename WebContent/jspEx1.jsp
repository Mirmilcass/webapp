<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- 

ㅁ 부분은 공백.

<%@ㅁ-------ㅁ%>	// 선언태그
<%ㅁ------ㅁ%>	// java code
<%=ㅁ-------ㅁ%>	// 출력태그
<%!ㅁ-------ㅁ%>	// 정의 태그
<%--ㅁ------ㅁ-%> // 주석
 --%>

<head>
<!-- <meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
> -->
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.util.*"%>
<title>Insert title here</title>
</head>
<body>
	<CENTER>
		<%!Calendar cal = Calendar.getInstance();
	Date now = new Date();
	int a;
	int b;%>

		<%
			a = 10;
			b = 20;
			if (b / a > 10) {
		%>
		<p>
			양의 값 (첫번째) <br>
			<%=" 양의 값 ( 두번째) "%>
			<br>
			<!-- 출력태그 -->
			<%
				out.println("다시 양의 값 ( 세번째 )");
			%>
			<%
				} else {
			%>
			음의 값
			<%
				}
			%>
		
		<p>
			오늘은
			<%=cal.get(Calendar.YEAR)%>
			년
			<%=cal.get(Calendar.MONTH) + 1%>
			월
			<%=cal.get(Calendar.DATE)%>
			일 이며,
			<%
					String[] yoil = { "일", "월", "화", "수", "목", "금", "토" };
				%>
			<%="오늘의 " + yoil[cal.get(Calendar.DAY_OF_WEEK) - 1] + "요일 입니다."%>
			현재 시각 :
			<%=now%>
		<p>
		<table
			BORDER="5"
			ALIGN="center"
		>
			<tr>
				<%
					for (int i = 2; i < 10; i++) {
				%><th><%=i + " 단"%></th>
				<%
					}
				%>
			</tr>
			<%
				for (int i = 2; i < 10; i++) {
			%>

			<tr>
				<%
					for (int j = 2; j < 10; j++) {
				%><td>
					<%=j + " * " + i + " = " + (i * j)%></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>

		</table>

	</CENTER>
</body>
</html>