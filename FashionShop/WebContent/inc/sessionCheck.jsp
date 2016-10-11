<%@ page import="com.fashion.admin.domain.Admin"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%
	//로그인 상태가 아니라면...즉 세션에 들어있는 객체가 없다면..접근을 막아야 한다..
	Admin admin=(Admin)session.getAttribute("admin");

	if(admin == null){
		out.print(showMsgBack("올바르지 않은 경로의 접근이네요"));
	}
%>