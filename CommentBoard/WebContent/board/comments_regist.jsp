<%@page import="com.sds.comments.domain.CommentsDAO"%>
<%@page import="com.sds.comments.domain.Comments"%>
<%@ page contentType="text/html;charset=utf-8"%>
    <%@ include file="/inc/message.jsp"%>
    <%! CommentsDAO dao=new CommentsDAO(); %>
<%
	//넘겨 받은 데이터를 db에 넣자
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String board_id=request.getParameter("board_id");
	Comments dto=new Comments();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setBoard_id(Integer.parseInt(board_id));
	int result=dao.insert(dto);
	
	if(result!=0){
		
		String url=showMsgURL("등록 성공","/board/detail.jsp?board_id="+board_id);
		out.print(url);
		
	}else{
		String back=showMsgBack("등록 실패");
		out.print(back);
	}

%>