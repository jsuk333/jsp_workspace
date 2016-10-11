<%@ page contentType="text/html;charset=utf-8"%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
	#box{
		width:180px;
		height:150px;
		background:yellow;
	}
  </style>
  <script>
	window.addEventListener("load",function(){
		var btn=document.getElementById("btn");
		btn.addEventListener("click",function(){
			
			regist();		
		});
	});
	function regist(){// 오라클에 연동하지말고, server에 연동하라고 데이터를 보내 준다.
		form1.action="/member/regist.jsp";//이 요청을 처리할 서버의 url
		form1.submit();//전송이 일어나는 시점

	}
  </script>
 </head>
 <body>
	 <form name="form1" method="post">
		<div id="box">
			ID : <input type="text" name="id">
			Password : <input type="text" name="password">
			Name : <input type="text" name="name">
			<input type="button" value="등록" id="btn">
		</div>
	</form>
 </body>
</html>
