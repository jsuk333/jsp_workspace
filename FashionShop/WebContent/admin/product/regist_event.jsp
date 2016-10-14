<%@page import="com.fashion.product.mybatis.dao.EventProductDAO"%>
<%@page import="com.fashion.product.domain.EventProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>

<%@ page contentType="text/html;charset=utf-8"%>
<%!
	EventProductDAO eventProductDAO=new EventProductDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	
	String eventInfo_id=request.getParameter("eventInfo_id");
	String product_id=request.getParameter("product_id");
	JSONParser parser=new JSONParser();
	JSONArray jsonArray=(JSONArray)parser.parse(product_id);
	ArrayList<EventProduct> list=new ArrayList<EventProduct>();
	for(int i=0;i<jsonArray.size();i++){
		EventProduct eventProduct=new EventProduct();
		eventProduct.setEventinfo_id(Integer.parseInt(eventInfo_id));
		eventProduct.setProduct_id(Integer.parseInt(jsonArray.get(i).toString()));
		list.add(eventProduct);
	}
	int result=eventProductDAO.insert(list);
	out.print(result);
%>
