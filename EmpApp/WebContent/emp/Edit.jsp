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
	String sql="update emp set ename=?,job=?, mgr=?, hiredate=?, sal=?, comm=?, deptno=? where empno=?";

	con=pool.getConnection();
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("ename"));
	pstmt.setString(2, request.getParameter("job"));
	pstmt.setInt(3, Integer.parseInt(request.getParameter("mgr")));
	pstmt.setString(4, request.getParameter("hiredate"));
	pstmt.setInt(5, Integer.parseInt(request.getParameter("sal")));
	pstmt.setInt(6, Integer.parseInt(request.getParameter("comm")));
	pstmt.setInt(7, Integer.parseInt(request.getParameter("deptno")));
	pstmt.setInt(8, Integer.parseInt(request.getParameter("empno")));
	int result=pstmt.executeUpdate();
	pool.freeConnection(con, pstmt);
	if(result!=0){
		out.print("<script>");
		out.print("alert('변경성공');");
		out.print("location.href=\"/list\"");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('변경실패');");
		out.print("history.back();");
		out.print("</script>");
	}
	
	
%>