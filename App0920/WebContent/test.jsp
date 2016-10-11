<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		jsp는 서블리이었다!!
		따라서 jsp내의 모든 코드는, 실행시 서블릿 코드로 변경되어 실행된다. 그리고 이 변경
		작업은 서버가 실시한다.
		그렇다면. jsp의 3가지 코드 영역은 서블릿으로 변경도리때 각각 어디에 위치할까??
				1. 지시 영역- servlet의 service메서드 영역으로..
				2. 선언부- 서블릿의 멤버 영역으로 자리잡는다..
				3. 스크립틀릿- 서블릿의 service메서드 영역으로 자리 잡는다.
				
	*/
	int x=3;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>