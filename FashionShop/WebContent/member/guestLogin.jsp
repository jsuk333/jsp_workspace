<%@ page contentType="text/html; charset=utf-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.fashion.member.domain.Guest"/>
<jsp:setProperty property="*" name="dto"/>
<%
	session.setAttribute("guest", dto);
	session.setAttribute("customer_type", "guest");
//응답을 받은 클라이언트가 지정한 url로 접속하라!
	response.sendRedirect("/shopping/step1.jsp");
%>