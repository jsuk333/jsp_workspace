<%@page import="java.io.PrintWriter"%>
<%@page import="com.sds.mvc.controller.MovieController"%>
<%@page import="com.sds.mvc.model.MovieAdvice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//요청을 받는 열할- 컨트롤러의 역할
	//Controller는 디자인과 로직을 분리 시키기 위해서 , 디자인과 로직의 중간에서 요청을 받고
	//처리된 요청에 의해 반환된 결과를 디자인 에 다시 전달하는 역할을 수행하는 업무 파트
	//음식점 : 입구에서 주문받는 알바생(콘트롤러)
	//request.setCharacterEncoding("utf-8");
	//String movie=request.getParameter("movie");
	//MovieAdvice movieAdvice=new MovieAdvice();
	//String msg=movieAdvice.getAdvice(movie);
	String msg=(String)request.getAttribute("msg");
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
판단결과 <%=msg%>
</body>
</html>