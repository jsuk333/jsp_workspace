<%@page import="com.fashion.admin.domain.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
<%
	Admin admin = new Admin();
	admin.setId("xman");
	admin.setPassword("9999");
	admin.setName("엑스맨");
	
	String name="tiger";

	//현재 요청에 의해 생성된  request 객체에 데이터를 심는다!
	//request는 dto 처럼 무언가를 심거나, 추출할 수 있다..
	request.setAttribute("admin", admin);
	
	//서버의 자원중 b.jsp 에게 이 요청에 대한 응답을 하지말고,
	//b.jsp로 전달하자!
	RequestDispatcher dis=request.getRequestDispatcher("/test2/b.jsp");
	dis.forward(request, response);//포워딩이 발생!!
%>
<script>
location.href="/test2/b.jsp";
</script>
</body>
</html>








