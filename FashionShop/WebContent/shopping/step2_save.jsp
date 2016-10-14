<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.member.mybatis.dao.GuestDAO"%>
<%@page import="com.fashion.member.domain.Guest"%>
<%@page import="com.fashion.member.domain.Member"%>
<%@page import="com.fashion.shopping.domain.Customer"%>
<%@page import="com.fashion.shopping.mybatis.dao.OrderSumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	OrderSumDAO dao=new OrderSumDAO();
	GuestDAO guestDAO = new GuestDAO();
%>    
<%
	//주문고객, 주문요약, 주문상세 , 배송지정보,
	String customer_type=(String)session.getAttribute("customer_type");
	List cart=(ArrayList)session.getAttribute("cart");
	Customer customer = new Customer();
	customer.setCustomer_type(customer_type);
	
	//회원인 경우
	if(customer_type.equals("member")){
		Member member=(Member)session.getAttribute("customer");
		customer.setType_id(member.getMember_id()); //member_id, 
	//비회원인 경우		
	}else if(customer_type.equals("guest")){
		Guest guest=(Guest)session.getAttribute("customer");
		//insert 메서드 안에서 하나의 세션 객체가 사용되므로,
		//이 세션 객체내에서 주문과 관련된 4가지 업무를 하나의 논리적 단계로 묶어야 한다.
		//비회원인경우 여기서 db에 등록!
		int result=dao.insert(guest,cart);
	
	}
		
%>







