<%@page import="javax.websocket.WebSocketContainer"%>
<%@page import="com.fashion.member.domain.Guest"%>
<%@page import="com.fashion.shopping.domain.Payment"%>
<%@page import="com.fashion.shopping.domain.Dest"%>
<%@page import="com.fashion.member.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//step1.jsp에서 넘겨받은 구매관련 모든 파라미터를 
	//메모리에 저장해 놓자!! 그래야 step2.jsp 그 결과를 보여줄수
	//있기 때문에..	

	//주문정보 받기 
	String customer_name=request.getParameter("customer_name");
	String customer_tel1=request.getParameter("customer_tel1");
	String customer_tel2=request.getParameter("customer_tel2");
	String customer_tel3=request.getParameter("customer_tel3");
	String customer_email=request.getParameter("customer_email");
	String customer_zipcode1=request.getParameter("customer_zipcode1");
	String customer_zipcode2=request.getParameter("customer_zipcode2");
	String customer_addr1=request.getParameter("customer_addr1");
	String customer_addr2=request.getParameter("customer_addr2");
	
	if(session.getAttribute("customer_type").equals("member")){

		Member member = new Member();
		
		member.setMember_name(customer_name);
		member.setPhone1(customer_tel1);
		member.setPhone2(customer_tel2);
		member.setPhone3(customer_tel3);
		member.setEmail(customer_email);
		member.setZipcode1(customer_zipcode1);
		member.setZipcode2(customer_zipcode2);
		member.setAddr1(customer_addr1);
		member.setAddr2(customer_addr2);
		
		session.setAttribute("customer", member);
		
	}else if(session.getAttribute("customer_type").equals("guest")){//guest 인 경우
		
		Guest guest = new Guest();
	
		guest.setGuest_name(customer_name);
		guest.setTell1(customer_tel1);
		guest.setTell2(customer_tel2);
		guest.setTell3(customer_tel3);
		guest.setMail(customer_email);
		guest.setPost1(customer_zipcode1);
		guest.setPost2(customer_zipcode2);
		guest.setHome1(customer_addr1);
		guest.setHome2(customer_addr2);
		
		session.setAttribute("customer", guest);
	}
	
	//받는이 정보 
	String dest_name=request.getParameter("dest_name");
	String dest_tel1=request.getParameter("dest_tel1");
	String dest_tel2=request.getParameter("dest_tel2");
	String dest_tel3=request.getParameter("dest_tel3");
	String dest_zipcode1=request.getParameter("dest_zipcode1");
	String dest_zipcode2=request.getParameter("dest_zipcode2");
	String dest_addr1=request.getParameter("dest_addr1");
	String dest_addr2=request.getParameter("dest_addr2");
	String msg=request.getParameter("msg");
	
	Dest dest = new Dest();
	dest.setDest_name(dest_name);
	dest.setCell1(dest_tel1);
	dest.setCell2(dest_tel2);
	dest.setCell3(dest_tel3);
	dest.setZip1(dest_zipcode1);
	dest.setZip2(dest_zipcode2);
	dest.setHouse1(dest_addr1);
	dest.setHouse2(dest_addr2);
	dest.setMsg(msg);
	
	//결제 정보 
	String totalbuy=request.getParameter("totalbuy");
	String totalpay=request.getParameter("totalpay");
	String bank=request.getParameter("bank");
	String pay_name=request.getParameter("pay_name");
	
	Payment payment = new Payment();
	payment.setTotalbuy(Integer.parseInt(totalbuy));
	payment.setTotalpay(Integer.parseInt(totalpay));
	payment.setBank_id(Integer.parseInt(bank));
	payment.setPay_name(pay_name);	
	
	
	
	session.setAttribute("dest", dest);
	session.setAttribute("payment", payment);
	
	//지정한 url 로 브라우저가 다시 들어오도록 명령한다!!
	//아래의 코드가 동작하는 시점 - 클라이언트에게 응답시 
	//응답 결과를 받은 브라우저가 재접속시도!
	response.sendRedirect("/shopping/step2.jsp");
%>
























