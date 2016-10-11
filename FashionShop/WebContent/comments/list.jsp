<%@page import="com.fashion.product.domain.Comments"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.mybatis.dao.CommentsDAO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"%>
<%!CommentsDAO commentsDAO=new CommentsDAO(); %>
<%
	response.setCharacterEncoding("utf-8");
	//특정상품의 id값을 받아서 그 상품에 딸려 있는 코멘트 목록 가져오기
	String proudct_id=request.getParameter("product_id");
	List list=commentsDAO.selectAll(Integer.parseInt(proudct_id));
	StringBuffer sb=new StringBuffer();
	sb.append("{");
	sb.append("\"commentsList\":[");
	for(int i=0;i<list.size();i++){
		Comments comments=(Comments)list.get(i);
		sb.append("{");
		sb.append("\"comments_id\":"+comments.getComments_id()+",");
		sb.append("\"product_id\":"+comments.getProduct_id()+",");
		sb.append("\"title\":\""+comments.getTitle()+"\",");
		sb.append("\"writer\":\""+comments.getWriter()+"\",");
		sb.append("\"regdate\":\""+comments.getRegdate().substring(0, 10)+"\"");
		if(i<list.size()-1){
			sb.append("},");
		}else{
			sb.append("}");
		}
	}
	sb.append("]");
	sb.append("}");
	out.print(sb.toString());
%>