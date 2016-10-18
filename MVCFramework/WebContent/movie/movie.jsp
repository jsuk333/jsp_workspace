<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	/* JavaEE는 Enterprise Edition으로서 , 기업용 어프리케이션 시장을 타겟으로 개발된 플랫폼이다.
	따라서 javaEE기반으로 어프리ㅔ이션을 개발하면, 그 규모는 언제나 거대하다.
	거대한 규모의 어플리 케이션을 개발하려면, 설계 이론에 근거하고 개발 패턴등이 적용되어야 하므로 javaEE에서는 MVC패턴을 적용한 
	모델2라 부리는 개발방법을 javaEE의 스펙에 포함시켰#따
	즉, 모델 2란 javaEE로 구현한 MVC패턴을 의미한다고 볼 수 있다.
	Model : 로직이므로 .java
	View : 웹기반의 디자인을 처리하기 위해 적절한 기술- jsp
	Controller : 클라이언트의 요청을 받을 수 있는 기술이어야 하기 때문에 서블릿
	*/
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getAdvice(){
	form1.action="/movie.do";
	form1.submit();
}
</script>
</head>
<body>
<div>
<form name="form1" method="post">
	<select name="movie">
		<option value="시빌워">시빌워</option>
		<option value="부산행">부산행</option>
		<option value="럭키">럭키</option>
		<option value="인페르노">인페르노</option>
	</select>
	<input type="button" onClick="getAdvice()">
	</form>
</div>
</body>
</html>