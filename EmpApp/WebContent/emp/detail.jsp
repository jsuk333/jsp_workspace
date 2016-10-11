<%@page import="com.sds.pool.PoolManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function edit(){
	form1.action="/emp/Edit.jsp";
	form1.submit();
}
function remove(){
	form1.action="/emp/Remove.jsp";
	form1.submit();
}
function list(){
	location.href="/list";
}
</script>
</head>
<body bgcolor="pink">
	<form name="form1" method="post">
		<div>
			<pre>
				EMPNO :    <input type="text" name="empno" value="<%=request.getParameter("empno") %>">
				ENAME :    <input type="text" name="ename" value="<%=request.getParameter("ename") %>">
				JOB :      <input type="text" name="job" value="<%=request.getParameter("job") %>">
				MGR :      <input type="text" name="mgr" value="<%=request.getParameter("mgr") %>">
				HIREDATE : <input type="text" name="hiredate" value="<%=request.getParameter("hiredate") %>">
				SAL :      <input type="text" name="sal" value="<%=request.getParameter("sal") %>">
				COMM :     <input type="text" name="comm" value="<%=request.getParameter("comm") %>">
				DEPTNO :   <input type="text" name="deptno" value="<%=request.getParameter("deptno") %>">
				<input type="button" value="수정" onClick="edit()" >
				<input type="button" value="삭제" onClick="remove()">
				<input type="button" value="목록" onClick="list()">
				
			</pre>
		</div>
	</form>
</body>
</html>