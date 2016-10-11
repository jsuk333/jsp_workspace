<%@page import="com.fashion.common.file.FileManager"%>
<%@page import="com.fashion.product.mybatis.dao.ProductDAO"%>
<%@page import="com.fashion.product.domain.Product"%>
<%@page import="com.fashion.product.domain.SubCategory"%>
<%@page import="com.fashion.product.mybatis.dao.SubCategoryDAO"%>
<%@page import="com.fashion.product.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.mybatis.dao.TopCategoryDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!
	SubCategoryDAO subCategoryDAO=new SubCategoryDAO();
	ProductDAO productDAO=new ProductDAO();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#mainNavi{
	color:#FFFFFF;
	font-weight:bold;
	text-align:center;
	height:25px;
}
#bestProduct,#newProduct,#eventProduct{font-size:9pt;}

#content{
	width:100%;
}
#left{
	width:200px;
	float:left;
}
#section{
	width:750px;
	float:left;
}
#productBox{
	float:left;
}
</style>

</head>

<body leftmargin="0" topmargin="0">

<table width="1070px" cellpadding="0" cellspacing="0">
	<!--Top begin -->
	<tr>
		<td width="970px">
			<!--top content begin -->
			<%@ include file="/inc/header.jsp" %>
			<%
				List<SubCategory> subList=subCategoryDAO.selectAll(top_id);
			%>			
			<!--top content end -->
		</td>
		<td rowspan="3" align="right" valign="top">
		<!-- Sky Banner begin -->
		<table id="skybanner" width="88" height="422" border="0" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="46" colspan="3"><img src="images/sky/sky_title.gif" width="88" height="46" /></td>
		      </tr>
		      <tr>
		        <td width="8" bgcolor="e6e6e6"></td>
		        <!-- 최근 본 상품 위로 버튼 -->
		        <td width="71" height="21" align="center"><img src="images/sky/btn_up.gif" width="45" height="18" /></td>
		        <td width="8" bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <td bgcolor="e6e6e6"></td>
		        <td align="center"><!-- 최근 본 상품 출력 -->
		            <table width="60" height="306" border="0" cellpadding="0" cellspacing="0">
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample01.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample02.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample03.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample04.gif" width="60" height="75" /></td>
		              </tr>
		          </table></td>
		        <td bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <td bgcolor="e6e6e6"></td>
		        <!-- 최근 본 상품 아래로 버튼 -->
		        <td height="22" align="center"><img src="images/sky/btn_down.gif" width="45" height="18" /></td>
		        <td bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <!-- 즐겨찾기 버튼 -->
		        <td height="24" colspan="3" background="images/sky/sky_bg01.gif" style="padding-left:27px; padding-top:4px;"><img src="images/sky/btn_favorite.gif" width="38" height="19" /></td>
		      </tr>
		    </table>		
		<!-- Sky Banner end-->
		</td>
	</tr>
	<!--Top End -->
	<!--Middle begin -->
	<tr>
		<td>
		<div id="content">
			<div id="left">
				<table border="1px" width="200px">
					<%
					int sub_id=0;
					
					if(request.getParameter("sub_id")!=null){
						sub_id=Integer.parseInt(request.getParameter("sub_id"));	
					}
					%>
					<%for(int i=0;i<subList.size();i++){%>
					<%SubCategory subDTO = subList.get(i); %>
				  <tr>
					  <td>
					  	<a <%if(sub_id == subDTO.getSub_id()){%>class="active"<%}%>  href="list.jsp?top_id=<%=top_id%>&sub_id=<%=subDTO.getSub_id()%>"><%=subDTO.getTitle() %></a>
					  </td>
				  </tr>
				  <%}%>
				</table>			
			</div>
			<div id="section">
			<%List subItemList=productDAO.selectBySubId(sub_id);%>
					<%for(int i=0;i<subItemList.size();i++){
						Product dto=(Product)subItemList.get(i);
					%>
					<div id="productBox">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td><a href="/shopping/detail.jsp?product_id=<%=dto.getProduct_id()%>"><img src="/product/<%=dto.getProduct_id()%>.<%=FileManager.getExt(dto.getImg())%>" width="120" height="120" /></a></td>
	                        </tr>
	                        <tr>
	                          <td>&nbsp;</td>
	                        </tr>
	                        <tr>
	                          <td><img src="/images/logo.jpg" width="28" height="11" /><%=dto.getBrand()%>&nbsp<%=dto.getProduct_name()%><br />
	                            &lt;<%=dto.getGender() %>&gt;<%=dto.getColor() %><br />
	                            <strong><%=dto.getDiscount() %> 원</strong></td>
	                        </tr>
	                    </table>
	                    </div>
                    <%} %>
                    
			</div>
		</div>
		
		<!--전체 컨텐츠 묶음 테이블  begin-->
						
		<!--전체 컨텐츠 묶음 테이블  end-->
		</td>
	</tr>
	<!--Middle End -->
	<!--bottom begin -->
	<tr>
		<td>
			<table width="970px" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/logo_bottom.gif"></td>
					<td align="right"><img src="/images/footer.gif"></td>
				</tr>
			</table>
		</td>
	</tr>
	<!--bottom end -->
</table>
</body>
</html>