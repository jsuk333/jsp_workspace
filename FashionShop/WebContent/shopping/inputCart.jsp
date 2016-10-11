<%@page import="com.fashion.product.domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.fashion.product.domain.Product"/>
<jsp:setProperty property="*" name="dto"/>
<%
	/*디비가 아닌 메모리상의 저장 공간에 임시적으로, 고객의 구매 정보를 담아 놓자(단, session이 유효할 때까지)
		1.브라우저를 닫기전
		2.서버에서 지정한 시간을 경과 할때까지 요청이 없으면 세션은 자동 끊긴다. session timeout이라 한다.
	*/
	//ArrayList에 장바구니 상품을 담아서, 이 리스트를 세션에 심자
	response.setCharacterEncoding("utf-8");
	ArrayList<Product> cart=null;
	if(session.getAttribute("cart")==null){
		cart=new ArrayList<Product>();
		session.setAttribute("cart", cart);
	}else{
		cart=(ArrayList)session.getAttribute("cart");
	}
	
	cart.add(dto);
	out.print("장바구니에 상품이 담겼습니다.");
%>