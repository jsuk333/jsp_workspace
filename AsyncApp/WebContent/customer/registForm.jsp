<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function regist(){
	xhttp=getHTTP();
	xhttp.onreadystatechange=function(){
		
		if(xhttp.readyState==4 && xhttp.status==200){
			
			getList();
		}
	}
	xhttp.open("POST", "/customer/regist.jsp", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("id="+form1.id.value+"&password="+form1.password.value+"&zipcode1="+form1.zipcode1.value+
			"&zipcode2="+form1.zipcode2.value+"&addr1="+form1.addr1.value+"&addr2="+form1.addr2.value);
}
/*동기 방식으로 아이디 중복 조회를 요청할 경우, 서버의 응답이 오기 전까지  메인 실행부는 아무거도 하지 못하며 메인 실행부가 요청을 하러가기 때문에 하면은 새로고침이 일어난다..
즉 웹의 단점
해결책) 요청시 비동기 방식으로 처리하자
비동기 방식이란 서버의 응답이 올때까지 기다릴 필요 없는 요청 방식이다.
예) 검색, 지도 , 웹을 마치 응용 프로그램 처럼 상태를 유지하는 것철머 보이려고 할때
참고 x-internet 솔루션에는 miplatform 이란게 있따(국내 업체)*/

function getHTTP(){
	var xhttp;
	if(xhttp==undefined){
		if (window.XMLHttpRequest) {
		    xhttp = new XMLHttpRequest();//모든 브라우저 공통
		}else{
			xhttp=new ActiveXObject("Microsoft.XMLHTTP");
			
		}
	}
	return xhttp;
}
function idCheck(){
	var xhttp=new getHTTP();
	//서버로 부터 응답 받은 데이터를 처리해 보자
	/*
	0: request not initialized 
	1: server connection established
	2: request received 
	3: processing request 
	4: request finished and response is ready
	*/
	//서버의 상황에 따라 아래의 콜백 함수가 호출된다.
	//서버의 상태는 총 0~4까지 5단계가 있다.
	//비동ㅇ기 방식을 처리할때 서버의 응답타이미을 
	//알 수 있는 유일 한 단서
	xhttp.onreadystatechange=function(){
		
		if(xhttp.readyState==0){
			console.log("요청할 준비가 되었습니다."+xhttp.status);
		}else if(xhttp.readyState==1){
			console.log("서버와 연결 되었습니다."+xhttp.status);
		}else if(xhttp.readyState==2){
			console.log("서버에 요청이 전달 되었습니다."+xhttp.status);
		}else if(xhttp.readyState==3){
			console.log("요청을 처리하고 있씁니다."+xhttp.status);
		}else if(xhttp.readyState==4){
			console.log("요청에 대해 응답할 준비가 되었습니다."+xhttp.status);
		}
		//개발자는 제 4단계와 서버에서 아무런 문제가 없당는 http 
		//응답코드를 200으로 받았을 때 , 원하는 처리를 해야 한다.
		if(xhttp.readyState==4 && xhttp.status==200){
			//스팬에 알맞는 메시지를 출력 해보자
			var data=xhttp.responseText;
			var msg=document.getElementById("msg");
			msg.innerHTML=data;
		}
	}
	//비동기 요청
	xhttp.open("get","/customer/id_check.jsp?id="+form1.id.value,true);
	xhttp.send();//요청이 일어남
	
}
function getList(){
	xhttp=getHTTP();
	
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4&&xhttp.status==200){
			var json=JSON.parse(xhttp.responseText);
			var jsonarray=json.customerList;
			var addr1=document.getElementById("addr1");
			var tag="<table>";
			if(jsonarray.length>0){
				tag+="<td>번호</td><td>아이디</td><td>비밀번호</td><td>우편번호</td><td>주소1</td><td>주소2</td>";
			}
			for(var i=0;i<jsonarray.length;i++){
				var obj=jsonarray[i];
				tag+="<tr>";
				tag+="<td>"+obj.customer_id+"</td>";
				tag+="<td>"+obj.id+"</td>";
				tag+="<td>"+obj.password+"</td>";
				tag+="<td>"+obj.zipcode1+"-"+obj.zipcode2+"</td>";
				tag+="<td>"+obj.addr1+"</td>";
				tag+="<td>"+obj.addr2+"</td>";
				tag+="</tr>";
			}
			tag+="</table>";
			customerList.innerHTML=tag;
		}
		
	}
	xhttp.open("get","/customer/list.jsp",true);
	xhttp.send();
	
}
function search_zip(){
	
    var myWindow = window.open("", "우편검색", "width=300,height=500");

   
    myWindow.document.write(tag);
	    
	

}

</script>
</head>
<body>
	<form name="form1" method="post">
		<pre>
			ID       : <input type="text" name="id"><input type="button" value="중복확인" onClick="idCheck()">
					   <span id="msg"></span>
			Password : <input type="password" name="password">
			우편번호 : <input type="text" name="zipcode1"><input type="text" name="zipcode2">
			<input type="button" value="우편번호검색" onClick="search_zip()">
			주소 1   : <input type="text" name="addr1">
			주소 2   : <input type="text" name="addr2">
			<input type="button" value="가입" onClick="regist()">
			<div id="customerList"></div>
		</pre>
	</form>
	
	
</body>
</html>