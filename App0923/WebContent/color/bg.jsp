<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String color=request.getParameter("color");
	if(color==null){
		color="pink";
	}
	out.print("넘겨받은 색"+color);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function setBg(){
		var c=document.getElementById("color");
		location.href="/color/bg.jsp?color="+c.value;
	}
</script>
</head>
<body bgcolor="<%=color%>">
<pre>
	<select id="color" name="color">
		<option value="yellow">yellow</option>
		<option value="red">red</option>
		<option value="blue">blue</option>
		<option value="green">green</option>
		<option value="navy">navy</option>
	</select>
	<input type="button" value="배경색 설정하기" onClick="setBg()">
</pre>
</body>
</html>