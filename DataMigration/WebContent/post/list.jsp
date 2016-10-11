<%@page import="com.sds.post.domain.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.sds.post.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	PostDAO dao=new PostDAO();
%>
<%	
	request.setCharacterEncoding("utf-8");
	String dong=request.getParameter("dong");
	List list=dao.selectAll(dong);
	StringBuffer sb=new StringBuffer();
	sb.append("{");
	sb.append("	\"postlist\":[");
	for(int i=0;i<list.size();i++){
		Post dto=(Post)list.get(i);
		sb.append("{");
		sb.append("		\"zipcode\":\""+dto.getZipcode()+"\",");
		sb.append("		\"sido\":\""+dto.getSido()+"\",");
		sb.append("		\"gugun\":\""+dto.getGugun()+"\",");
		sb.append("		\"dong\":\""+dto.getDong()+"\",");
		sb.append("		\"bunji\":\""+dto.getBunji()+"\",");
			if(i<list.size()-1){
				sb.append("		},");
			}else{
				sb.append("		}");
			}
	}
	sb.append("	]");
	sb.append("}");
	out.print(sb.toString());
%>