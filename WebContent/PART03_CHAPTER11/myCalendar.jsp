<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mycal" class="beans.MyCalendar" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b>기본 출력 형태</b>
	<br>
	오늘 날짜는 :
	<jsp:getProperty property="today" name="mycal" />
	<p>
		<b>구분자로 "-"를 주었을때</b>
		<br>
		<jsp:setProperty property="delimiter" name="mycal" value="-" />
		오늘 날짜는 :
		<jsp:getProperty property="today" name="mycal" />
	</p>
	<p>
		<b>구분자로 ""를 주었을때</b>
		<br>
		<jsp:setProperty property="delimiter" name="mycal" value="" />
		오늘 날짜는 :
		<jsp:getProperty property="today" name="mycal" />
	</p>
</body>
</html>