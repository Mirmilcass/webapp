<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, beans.*, db.DBAction, java.sql.*"
	errorPage="../errors/error.jsp" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="beans.AddrBean" />
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:setProperty property="*" name="user" />
<%
	DBAction db = DBAction.getInstance();
	String sql = "update addrbook set name=?, phone=?, addr=? where id = ?";
	PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
	pstmt.setString(1, user.getName().trim());
	pstmt.setString(2, user.getPhone().trim());
	pstmt.setString(3, user.getAddr().trim());
	pstmt.setString(4, user.getId().trim());
	pstmt.executeUpdate();
	response.sendRedirect("addr_list.jsp");
%>
