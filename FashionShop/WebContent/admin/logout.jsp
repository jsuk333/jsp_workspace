<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%
	//세션은 객체이므로, 개발자가 임의로 소멸시킬수 없다..
	//따라서 세션을 무효화 시켜야 한다..
	session.invalidate();
	out.print(showMsgURL("로그아웃 되었습니다.", "/admin/"));
%>