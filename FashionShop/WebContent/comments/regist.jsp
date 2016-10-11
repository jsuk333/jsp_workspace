<%@page import="com.fashion.product.mybatis.dao.CommentsDAO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.fashion.product.domain.Comments"></jsp:useBean>
<%!
	CommentsDAO commentsDAO=new CommentsDAO();
%>
<%
	//클라이언트가 비동기로 전송한 파라미터값을 db에 넣어주자
	request.setCharacterEncoding("utf-8");
	
%>
<jsp:setProperty property="*" name="dto"/>
<%
	int result=commentsDAO.insert(dto);
	StringBuffer sb=new StringBuffer();
	sb.append("{");
	sb.append("\"result\":"+result+"");
	sb.append("}");
	out.print(sb.toString());
%>