<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getAdvice(){
	form1.action="/blood.do";
	
	form1.submit();
}
</script>
</head>
<body>
<div>
<form name="form1" method="post">
	<select name="blood">
		<option value="A">A형</option>
		<option value="B">B형</option>
		<option value="O">O형</option>
		<option value="AB">AB형</option>
	</select>
	<input type="button" onClick="getAdvice()">
	</form>
</div>
</body>
</html>