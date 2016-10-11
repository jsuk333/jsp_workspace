<%@ page contentType="text/html;charset=utf-8"%>
<%!
	int x=1;
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
  <table width="200px" border="1px">
	<%for(int i=1;i<=10;i++){%>
		<tr>
			<td>a</td>
			<td>b</td>
		</tr>
	<%}%>
  </table>
 </body>
</html>
