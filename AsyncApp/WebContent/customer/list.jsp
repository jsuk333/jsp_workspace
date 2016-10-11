<%@page import="com.sds.customer.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.sds.customer.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!CustomerDAO dao = new CustomerDAO();%>
<%
	//아작스 객체에게 응답하자
	List list=dao.selectAll();
	StringBuffer sb=new StringBuffer();
	sb.append("{");
	sb.append("\"customerList\": [");
	for(int i=0;i<list.size();i++){
		Customer dto=(Customer)list.get(i);
		
		sb.append("{");
		sb.append("\"customer_id\": "+dto.getCustomer_id()+",");
		sb.append("\"id\": \""+dto.getId()+"\",");
		sb.append("\"password\": \""+dto.getPassword()+"\",");
		sb.append("\"zipcode1\": \""+dto.getZipcode1()+"\",");
		sb.append("\"zipcode2\": \""+dto.getZipcode2()+"\",");
		sb.append("\"addr1\": \""+dto.getAddr1()+"\",");
		sb.append("\"addr2\": \""+dto.getAddr2()+"\",");
		sb.append("\"regdate\": \""+dto.getRegdate()+"\"");
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