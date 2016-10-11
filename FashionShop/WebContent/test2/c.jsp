<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//웹기반은  (비상태)stateless 기반이므로, 상태를 유지할 수
	//없다 . 따라서 클라이언트의 브라우저가 요청을 시도하면
	//서버측에는 해당 클라이언트를 구분하기 위해 일련번호를
	//부여한다..
	String id=session.getId();
	out.print(id);
%>