<%@page import="com.fashion.product.domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int product_id=Integer.parseInt(request.getParameter("product_id"));
	ArrayList<Product> list=(ArrayList)session.getAttribute("cart");
	int result=0;
	for(int i=0;i<list.size();i++){
		if(((Product)list.get(i)).getProduct_id()==product_id){
			list.remove(i);
			result=product_id;
			break;
		}
	}
	
	out.print(result);
	

%>