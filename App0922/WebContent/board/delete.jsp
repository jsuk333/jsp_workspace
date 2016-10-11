<%@page import="com.sds.model.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	BoardDAO boardDAO=new BoardDAO();
%>
<% 
	boolean flag=boardDAO.delete(Integer.parseInt(request.getParameter("board_id")));
	out.print("<script>");
	if(flag){
		out.print("location.href=\'/board/list.jsp\'");
	}else{
		out.print("history.back()");
	}
	out.print("</script>");	
%>