<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script>

</script>
</head>
<body bgcolor="yellow">
	<form name="form1" method="post">
		<div>
			<pre>
				EMPNO :    <input type="text" name="empno">
				ENAME :    <input type="text" name="ename">
				JOB :      <input type="text" name="job">
				MGR :      <input type="text" name="mgr">
				HIREDATE : <input type="text" name="hiredate">
				SAL :      <input type="text" name="sal">
				COMM :     <input type="text" name="comm">
				DEPTNO :   <input type="text" name="deptno">
				<input type="button" value="등록" onClick="regist()">
				<input type="button" value="뒤로가기" onClick="prev()">
			</pre>
		</div>
	</form>
</body>
</html>