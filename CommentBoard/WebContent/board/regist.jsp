<%@page import="com.sds.board.domain.BoardDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp"%>  
<%! BoardDAO dao=new BoardDAO(); %>
<jsp:useBean id="dto" class="com.sds.board.domain.Board"/>
<jsp:setProperty property="*" name="dto"/>    
<%
	request.setCharacterEncoding("utf-8");
	//글쓰기 폼에서 전송되어온 파라미터 값들을
	//오라클에 insert !!
	int result=dao.insert(dto);
	
	if(result !=0){
		out.print(showMsgURL("등록완료", "/board/list.jsp"));
	}else{
		out.print(showMsgBack("등록실패"));
	}

%>