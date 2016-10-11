<%@page import="com.sds.gallery.domain.dao.GalleryDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	GalleryDAO dao=new GalleryDAO();

%>
<%
	request.setCharacterEncoding("utf-8");
	String gallery_id=request.getParameter("gallery_id");
	int result=dao.delete(Integer.parseInt(gallery_id));
	
	if(result!=0){
		String code=showMsgURL("삭제 성공", "/board/detail.jsp");
		out.print(code);
	}else{
		String code=showMsgBack("삭제 실패");
		out.print(code);
	}



%>
