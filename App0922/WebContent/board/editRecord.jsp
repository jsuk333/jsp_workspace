<%@page import="com.sds.model.board.BoardDTO"%>
<%@page import="com.sds.model.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	BoardDAO boardDAO=new BoardDAO();
%>
<% 
	request.setCharacterEncoding("utf-8");
	BoardDTO dto=new BoardDTO();
	dto.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
	dto.setWriter(request.getParameter("writer"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	boolean flag=boardDAO.editRecord(dto);
	out.print("<script>");
	if(flag){
		out.print("alert('수정완료')");
		out.print("location.href=\'/board/detail.jsp?board_id="+request.getParameter("board_id")+"\'");
	}else{
		out.print("alert('수정실패')");
		out.print("history.back()");
	}
	out.print("</script>");
%>