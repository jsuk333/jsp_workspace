<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#wrapper{
	width:90%;
	height:300px;
	border:1px solid black;
	
}
#left{
	width:50%;
	height:300px;
	background:yellow;
	float:left;
	

}
#right{
	width:50%;
	height:300px;
	background:pink;
	float:left;

}

</style>
<script>
function memberLogin(){
	//로그인을 인증을 서버에 요청하자
	form1.action="/member/login.jsp";
	form1.submit();
}
function guestLogin(){
	form2.action="/member/guestLogin.jsp";
	form2.submit();
}
</script>
</head>
<body>
<div id="wrapper">
	<div id="left">
		<form name="form1" method="post">
		<pre>
			회원 구매
			ID      <input type="text" name="id">
			Password<input type="password" name="password">
			<input type="button" value="로그인" onClick="memberLogin()">
			<input type="button" value="회원가입">
		</pre>
		</form>
	</div>
	<div id="right">
		<form name="form2" method="post">
		<pre>
			비회원 구매
			이름           <input type="text" name="guest_name">
			연락처        <input type="text" name="tell1">
				   -<input type="text" name="tell2">
				   -<input type="text" name="tell3">
			<input type="button" value="구매하기" onClick="guestLogin()">
		</pre>
		</form>
	</div>
</div>
</body>
</html>