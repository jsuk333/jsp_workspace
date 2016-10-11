<%@page import="com.sds.board.domain.Board"%>
<%@page import="com.sds.board.domain.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%!
	BoardDAO dao=new BoardDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	//검색일 경우 파라미터값 받기
	String category=request.getParameter("category");
	String keyword=request.getParameter("keyword");
	List<Board> list=null;
	if(keyword!=null){

		list=dao.selectAll(keyword, category);
	}else{
		list=dao.selectAll();
	}
	int currentPage=1;
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size();
	int pageSize=10;
	int blockSize=10;
	int firstPage=currentPage-(currentPage-1)%blockSize;
	int totalPage=(int)Math.ceil((float)totalRecord/blockSize);
	int lastPage=firstPage+blockSize-1;
	int curPos=(currentPage-1)*blockSize;
	int num=totalRecord-curPos;
	
	out.print(list.size());
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
#paging{font-size:9pt;color:#7F7F7F;돋움}
#list td{font-size:9pt;}
#copyright{font-size:9pt;}
a{text-decoration:none}
img{border:0px}
</style>
<script>
function search_board(){
	form1.action="/board/list.jsp";
	form1.submit();
}
</script>
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
  <%for(int i=1;i<=pageSize;i++){

	  %>
  	<%if(num<1){
	  	break;
	  }
	  
  	 Board dto=(Board)list.get(curPos++);
	  %>
	<tr>	
		<td colspan="5" id="list">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		    <tr align="center" height="20px" onMouseOver="this.style.background='#FFFF99'" onMouseOut="this.style.background=''">
			  <td width="50"><%=num-- %></td>
			  <td width="303"><a href="detail.jsp?board_id=<%=dto.getBoard_id() %>"><%=dto.getTitle()%>
			  <%if(dto.getCommentsList()!=null){%>
				  [<%=dto.getCommentsList().size() %>]
			  <% }%>			  
			  </a></td>
			  <td width="100"><%=dto.getWriter()%></td>
			  <td width="100"><%=dto.getRegdate()%></td>
			  <td width="50"><%=dto.getHit()%></td>
		    </tr>
			<tr>
				<td height="1" colspan="5" background="/board/images/line_dot.gif"></td>
			</tr>
		  </table>		</td>
	</tr>
	<%} %>
  <tr>
    <td id="paging" height="20" colspan="5" align="center">
	<%for(int i=firstPage;i<=lastPage;i++){ %>
	<%if(i>totalPage){
		break;
	}
	%>

		<a href="/board/list.jsp?currentPage=<%=i%>">[<%=i%>]</a>
	<%} %>
	</td>
  </tr>
  <tr>
    <td height="20" colspan="5" align="right" style="padding-right:2px;">
    <form name="form1" method="post">
	<table width="160" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="70">
          <select name="category" id="category">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="writer">글쓴이</option>
          </select>        </td>
     
        <td width="80">
          <input name="keyword" id="keyword" type="text" size="15">        </td>
        <td><img src="/board/images/search_btn.gif" width="32" height="17" onClick="search_board()"></td>
      </tr>
    </table>
    </form>
    </td>
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
