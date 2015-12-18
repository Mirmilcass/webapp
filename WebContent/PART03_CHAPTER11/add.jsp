<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, beans.*, db.DBAction, java.sql.*"
	errorPage="../errors/error.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="data" class="beans.AddrBean" />
<jsp:setProperty property="*" name="data" />
<%
	DBAction db = DBAction.getInstance();
	String sql = "insert into addrbook values(?,?,?,?)";
	PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
	pstmt.setString(1, data.getId());
	pstmt.setString(2, data.getName());
	pstmt.setString(3, data.getPhone());
	pstmt.setString(4, data.getAddr());
	pstmt.executeUpdate();
	out.println("자알~ 추가되었습니다.");
%>
