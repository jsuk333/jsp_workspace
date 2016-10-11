<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style >
#area{
	background:yellow;
	width:100%;
	height:300px;
	overflow:scroll;
}
</style>
<script>
var xhttp;
function getXhttp(){
	var xhttp;
	if(xhttp==null){
	    xhttp = new XMLHttpRequest();
	}
	return xhttp;
}
function findZip(){
	var xhttp=getXhttp();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			var area=document.getElementById("area");
			var data=xhttp.responseText;
			var json=JSON.parse(data);
			var list=json.postlist;
			for(var i=0; i<list.length;i++){
				var obj=list[i];
				var zipcode=obj.zipcode.value;
				var sido=obj.sido.value;
				var gugun=obj.gugun.value;
				var dong=obj.dong.value;
				var bunji=obj.bunji.value;
				area.innerHTML="<a>"+zipcode+sido+gugun+dong+bunji+"</a>";
				
			}
		}
	}
	xhttp.open("post","/post/list.jsp",true);
	xhttp.send("dong="+form1.dong.value);
}
</script>
</head>
<body>
	<form name="form1">
	<input type="text" name="dong"><input type="button" value="검색" onClick="findZip()">
	
	</form>
	<div id="area">
	</div>
	
	
</body>
</html>