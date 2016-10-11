<%@page import="com.sds.model.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	BoardDAO boardDao=new BoardDAO();
%>
<%
	//글쓰기 폼양식으로부터 전송되어진 파라미터들을 이용하여
	//오라클에 insert시키자
	//그리고 나서, 다시 list를 보여주자
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");	
	int result=boardDao.insert(writer, title, content);
	System.out.println(boardDao);
	out.print("<script>");
	if(result!=0){
		out.print("alert('등록 성공');");
		//클라이언트의 브라우저에게 하여금 지정된 url로 보낸다.
		out.print("location.href=\'/board/list.jsp\'");
	}else{
		out.print("alert('등록 실패');");
		out.print("history.back()");
	}
	out.print("</script>");	
%>