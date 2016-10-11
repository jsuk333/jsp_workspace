<%@page import="com.fashion.product.domain.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.jdbc.dao.SubCategoryDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!SubCategoryDAO dao = new SubCategoryDAO();%>
<%
	String top_id = request.getParameter("top_id");
	System.out.print("넘겨받은 top_id"+top_id);
	
	List<SubCategory> list=dao.select(Integer.parseInt(top_id));
	
	StringBuffer sb = new StringBuffer();

	sb.append("{");
	sb.append("\"subList\" : [");
	for(int i=0;i<list.size();i++){
		SubCategory dto=list.get(i);
		sb.append("{");
		sb.append("\"sub_id\":"+dto.getSub_id()+",");
		sb.append("\"title\": \""+dto.getTitle()+"\"");
		
		if(i<list.size()-1){
			sb.append("},");
		}else{
			sb.append("}");
		}
	}
	sb.append("]");
	sb.append("}");
	
	//응답 객체인 response 객체와 연결된 스트림으로 부터 
	//화면에 출력하는 메서드
	out.print(sb.toString());
%>














