<%@page import="java.util.List"%>
<%@page import="com.sds.customer.domain.Customer"%>
<%@page import="com.sds.customer.dao.CustomerDAO"%>
<jsp:useBean id="dto" class="com.sds.customer.domain.Customer"/>
<<jsp:setProperty property="*" name="dto"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	CustomerDAO dao=new CustomerDAO();
%>
<%
	String[] zipcodeArr=null;
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String zipcode1=request.getParameter("zipcode1");
	String zipcode2=request.getParameter("zipcode2");
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	
	
	int result=dao.insert(dto);
	
	out.print(result);
	
	
	
	
%>








