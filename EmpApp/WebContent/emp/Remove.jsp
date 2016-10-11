<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.sds.pool.*" %>
<%!
	PoolManager pool=PoolManager.getInstance();
	Connection con;
	PreparedStatement pstmt;
	
%>
<%
	String sql="delete from emp where empno="+request.getParameter("empno");
	con=pool.getConnection();
	pstmt=con.prepareStatement(sql);
	int result=pstmt.executeUpdate();
	pool.freeConnection(con, pstmt);
	if(result!=0){
		out.print("<script>");
		out.print("alert('삭제성공');");
		out.print("location.href=\"/list\"");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('삭제실패');");
		out.print("history.back();");
		out.print("</script>");
	}
	
	
%>