<%@page import="com.sds.customer.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! CustomerDAO dao=new CustomerDAO(); %>
<%
	request.setCharacterEncoding("utf-8");
	//넘겨 받은 아이디를 이동하여, 중복체크 중, 알맞는 메시지를 출력하자
	String id=request.getParameter("id");
	boolean result=dao.isExist(id);
	out.print(result);
%>