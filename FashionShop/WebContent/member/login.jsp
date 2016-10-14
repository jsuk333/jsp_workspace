<%@page import="com.fashion.member.domain.Member"%>
<%@page import="com.fashion.member.mybatis.dao.MemberDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/inc/message.jsp" %>
<%!
	MemberDAO memberDAO=new MemberDAO();
%>
<%
	//넘겨받은 아이디와 패스워드 파라미터를 이용하여,
	//db조회후, 존재하면 세션에 회원정보를 보관하고,
	//회원이 아니면 욕해주고 뒤로 보내자
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	Member dto=new Member();
	dto.setId(id);
	dto.setPassword(password);
	Member member=memberDAO.select(dto);
	if(member==null){
		//회원이 아니므로 욕
		System.out.println("인증 실패");
		out.print(showMsgBack("로그인 정보가 올바르지 않습니다."));
	}else{
		//회원이기 때문에 session 처리
		System.out.println("인증 성공");
		session.setAttribute("member", member);
		session.setAttribute("customer_type", "member");
		out.print(showMsgURL("로그인성공", "/shopping/step1.jsp"));
	}
%>