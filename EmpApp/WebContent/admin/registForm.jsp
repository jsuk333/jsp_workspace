<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function regist(){
	if(checkFile(form1.myfile)){
		alert("잘못된 파일입니다.");
		return;
	}
	form1.encoding="multipart/form_data";
	form1.action="/admin/regist.jsp";
	form1.submit();
}
//test.xls
function checkFile(obj){
	var lastindex=obj.value.lastIndexOf(".");
	var ext=obj.value.slice(lastindex+1,obj.value.length);
	var result=false;
	if(ext!="xls"&&ext!="xlsx"){
		
		obj.value=obj.defaultValue;
		result=true;
	}
	return false;
}
</script>
</head>
<body>
	<pre>
	<form name="form1" method="post">
		<input type="file" onChange="checkFile(this)" name="myfile"><input type="button" value="우편번호등록" onClick="regist()">
	</form>
	</pre>
</body>
</html>