<%@ page contentType="text/html;charset=utf-8"%>
<%
	int total_record=181;//총 레코드 수
	int pageSize=10;
	int total_page=(int)Math.ceil(((double)total_record/pageSize));
	int curr_page=0;
	int blockSize=10;
	int total_block=(int)Math.ceil(((double)total_record/(blockSize*pageSize)));
	int curr_block=0;
	
	String p=request.getParameter("curr_page");
	String b=request.getParameter("curr_block");
	if(b!=null){
		curr_block=Integer.parseInt(b);
	}else{
		curr_block=1;
	}
	if(p!=null){
		curr_page=Integer.parseInt(p);
	}else{
		curr_page=1;
	}
	int firstPage=(int)Math.ceil(((double)curr_page/blockSize))*(blockSize)-(blockSize-1);
	int lastPage=curr_block*blockSize;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
#box{border:1px solid #CCCCCC}
#title{font-size:9pt;font-weight:bold;color:#7F7F7F;돋움}
#category{font-size:9pt;color:#7F7F7F;돋움}
#keyword{
	width:80px;
	height:17px;
	font-size:9pt;
	border-left:1px solid #333333;
	border-top:1px solid #333333;
	border-right:1px solid #333333;
	border-bottom:1px solid #333333;
	color:#7F7F7F;돋움
}
.pageNum{
	color:red;
	font-size:14pt;
	font-weight:bold;
}
#paging{font-size:9pt;color:#7F7F7F;돋움}
#list td{font-size:9pt;}
#copyright{font-size:9pt;}
a{text-decoration:none}
img{border:0px}
</style>
</head>
<body>
<table id="box" align="center" width="603" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5"><img src="/board/images/ceil.gif" width="603" height="25"></td>
  </tr>
  <tr>
    <td height="2" colspan="5" bgcolor="#6395FA"><img src="/board/images/line_01.gif"></td>
  </tr>
  <tr id="title" align="center">
    <td width="50" height="20">번호</td>
    <td width="303" height="20">제목</td>
    <td width="100" height="20">글쓴이</td>
    <td width="100" height="20">날짜</td>
    <td width="50" height="20">조회수</td>
  </tr>
  <tr>
    <td height="1" colspan="5" bgcolor="#CCCCCC"></td>
  </tr>
	<tr>	
		<td colspan="5" id="list">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <%for(int i=(curr_page-1)*10;i<curr_page*10;i++){
			if(i<(total_record)){
		  %>
		    <tr align="center" height="20px" onMouseOver="this.style.background='#FFFF99'" onMouseOut="this.style.background=''">
			  <td width="50"><%=i+1 %></td>
			  <td width="303"><a href="detail.jsp">제목입니다.</a></td>
			  <td width="100">관리자</td>
			  <td width="100">2008/02/10</td>
			  <td width="50">5</td>
		    </tr>
			<tr>
				<td height="1" colspan="5" background="/board/images/line_dot.gif"></td>
			</tr>
		   <% }}%>
		  </table>		</td>
	</tr>
  <tr>
    <td id="paging" height="20" colspan="5" align="center">
    <a href="<%="/board/list.jsp?curr_page="+(curr_block*10-9)+"&curr_block="+((curr_block==1)?1:curr_block-1)%>">◀</a>
		<%for(int i=firstPage;i<=lastPage;i++){ 
			if(i<=total_page){
		%>
			<a <%=(i==curr_page)?"class=pageNum":"" %> href="<%="/board/list.jsp?curr_page="+i+"&curr_block="+curr_block%>">[<%=i %>]</a>
		<% }}%>
	<a href="<%="/board/list.jsp?curr_page="+((total_block==curr_block)?total_page:lastPage+1)+"&curr_block="+((total_block==curr_block)?total_block:curr_block+1)%>">▶</a>
	</td>
  </tr>
  <tr>
    <td height="20" colspan="5" align="right" style="padding-right:2px;">
	<table width="160" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="70">
          <select name="select" id="category">
            <option>제목</option>
            <option>내용</option>
            <option>글쓴이</option>
          </select>        </td>
        <td width="80">
          <input name="textfield" id="keyword" type="text" size="15">        </td>
        <td><img src="/board/images/search_btn.gif" width="32" height="17"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" colspan="5" align="right" style="padding-right:2px;"><a href="write.jsp"><img src="/board/images/write_btin.gif" width="61" height="20" border="0"></a></td>
  </tr>
  <tr>
    <td height="1" colspan="5" bgcolor="#CCCCCC"></td>
  </tr>
  <tr>
    <td height="20" colspan="5" align="center" id="copyright">Copyright zino All Rights Reserved </td>
  </tr>
</table>
</body>
</html>
