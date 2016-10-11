<%@page import="com.fashion.common.file.FileManager"%>
<%@page import="com.fashion.product.domain.Product"%>
<%@page import="com.fashion.common.board.PagingManager"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.mybatis.dao.ProductDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!ProductDAO productDAO = new ProductDAO();
	PagingManager pm = new PagingManager();%>
<%
	List list = productDAO.selectAll();
	request.setAttribute("list", list);

	pm.init(request);
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/admin/css/intranet.css" type="text/css">
<style>
td {
	font-size: 9pt
}

ul.pagination {
	display: inline-block;
	padding: 0;
	margin: 0;
}

ul.pagination li {
	display: inline;
}

ul.pagination li a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

ul.pagination li a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

ul.pagination li a:hover:not (.active ) {
	background-color: #ddd;
}

div.center {
	text-align: center;
}
</style>
<script language="javascript">
	
</script>
</head>
<body leftmargin="10" topmargin="0" marginwidth="0" marginheight="0">
	<table width="900" border="0" cellpadding="0" cellspacing="0">
		<form name="form1" method="post" action="/admin/food_deal/list.asp">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr valign="middle">
				<td height="30" align="right"><select name="sellType"
					style="width: 170px">
						<option value="">▼ 상품검색</option>
						<option value="new">기획상품</option>
				</select> <img src="/admin/images/bt_search.gif"
					onClick="sendEventProduct();" style="cursor: hand"></td>
			</tr>
			<tr>
				<td>

					<table width="900" border="0" cellspacing="0" cellpadding="0"
						class="default" id="intranet_board1">
						<tr height="27">
							<td colspan="11"></td>
						</tr>
						<tr>
							<td colspan="12" height="5" bgcolor="#BBBBBB"></td>
						</tr>
						<tr height="35" align="center">
							<td width="38" bgcolor="#EFEFEF" class="top_bg"><input
								type="checkbox" style="background: yellow" name="chAll"
								onClick="checkAll()"></td>
							<td width="38" bgcolor="#EFEFEF" class="top_bg"><strong>No</strong></td>
							<td width="161" bgcolor="#EFEFEF" class="top_bg"><strong>이미지</strong></td>
							<td width="130" bgcolor="#EFEFEF" class="top_bg"><strong>상품명</strong></td>
							<td width="106" bgcolor="#EFEFEF" class="top_bg"><strong>가격</strong></td>
							<td width="85" bgcolor="#EFEFEF" class="top_bg"><strong>할인가</strong></td>
							<td width="77" bgcolor="#EFEFEF" class="top_bg"><strong>색상</strong></td>
							<td width="65" bgcolor="#EFEFEF" class="top_bg"><strong>사이즈</strong></td>
							<td width="69" bgcolor="#EFEFEF" class="top_bg"><strong>제조사</strong></td>
							<td width="120" bgcolor="#EFEFEF" class="top_bg"><strong>브랜드</strong></td>
							<td width="99" bgcolor="#EFEFEF" class="top_bg"><strong>재고량</strong></td>
							<td width="95" bgcolor="#EFEFEF" class="top_bg"><strong>적립율</strong></td>
						</tr>
						<tr>
							<td colspan="12" height="1" bgcolor="#CCCCCC"></td>
						</tr>
						<%
							int num = pm.getNum();
							int curPos = pm.getCurPos();
						%>
						<%
							for (int i = 1; i <= pm.getPageSize(); i++) {
						%>
						<%
							if (num < 1)
									break;
						%>
						<%
							Product dto = (Product)list.get(curPos++);
						%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=num--%></td>
							<td><img
								src="/product/<%=dto.getProduct_id()%>.<%=FileManager.getExt(dto.getImg())%>"
								width="40px"></td>
							<td><%=dto.getProduct_name()%></td>
							<td><%=dto.getPrice()%></td>
							<td><%=dto.getDiscount()%></td>
							<td><%=dto.getColor()%></td>
							<td><%=dto.getPsize()%></td>
							<td><%=dto.getNation()%></td>
							<td><%=dto.getBrand()%></td>
							<td><%=dto.getStock()%></td>
							<td><%=dto.getPoint()%></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="12" height="5" bgcolor="#BBBBBB"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="50" colspan="2" valign="top">
					<!--Paging Start-->

					<table width="900" cellspacing="2" cellpadding="2"
						style="font-size: 9pt">
						<tr>
							<td width="100"><a href="regist.asp?busi_type=" class="but"></a></td>
							<td width="170" align="right"></td>
							<td width="170" align="right">&nbsp;</td>
							<td width="198" height="15" align="right" id="form_page"></td>
						</tr>
					</table> <!--Paging End-->
			<tr>
				<td id="paging" height="20" colspan="5" align="center"></td>
			</tr>
			</td>
			</tr>
			<tr>
				<td><table width="590" border="0" cellpadding="0"
						cellspacing="0" align="center" class="copyright">
						<tr>
							<td height="43">
								<div class="center">
									<ul class="pagination">
										<li><a href="#">«</a></li>
										
										<%for(int i=pm.getFirstPage();i<=pm.getLastPage();i++){ %>
										<%if(i > pm.getTotalPage())break; %>
										<li><a <%if(i==pm.getCurrentPage()){%>class="active"<%}%> href="/admin/product/list.jsp?currentPage=<%=i%>"><%=i%></a></li>
										<%} %>
										<li><a href="#">»</a></li>
									</ul>
								</div>

							</td>
						</tr>
						<tr>
							<td class="schedule">COPYRIGHT(C) 2007 BY JavaFashion ALL
								RIGHTS RESERVED.</td>
						</tr>
					</table></td>
			</tr>
		</form>
	</table>

</body>
</html>










