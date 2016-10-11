<%@page import="com.fashion.product.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.mybatis.dao.TopCategoryDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!TopCategoryDAO topCategoryDAO = new TopCategoryDAO();%>
<%
	//모든 상위 카테고리 가져오기 
	List<TopCategory> topList = topCategoryDAO.selectAll();

	//현재 선택한 상위 카테고리 받기!
	int top_id = 0; //아무것도 선택하지 않게 하기 위해... 

	if (request.getParameter("top_id") != null) {
		top_id = Integer.parseInt(request.getParameter("top_id"));
	}
%>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
</style>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<!--상단 로고 및 부메뉴 begin  -->
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="224px">
						<a href="/"><img src="/images/common/logo.gif"></a>
					</td>
					<td>
						<!-- 상단 부메뉴 begin-->
						<table align="right" width="310px" cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="/images/main/btn_login.gif"></td>
								<td><img src="/images/main/menu_join.gif"></td>
								<td><img src="/images/main/menu_cart.gif"></td>
								<td><img src="/images/main/menu_orderlist.gif"></td>
								<td><img src="/images/main/menu_cs.gif"></td>
							</tr>
						</table> <!-- 상단 부메뉴 end-->
					</td>
				</tr>
			</table> <!--상단 로고 및 부메뉴 end  -->
		</td>
	</tr>
	<tr>
		<td>
			<!--메인 네비게이션 begin  -->
			<ul>
				<%
					for (int i = 0; i < topList.size(); i++) {
				%>
				<%
					TopCategory topDTO = topList.get(i);
				%>
				<li><a <%if (top_id == topDTO.getTop_id()) {%> class="active" <%}%>
					href="/shopping/list.jsp?top_id=<%=topDTO.getTop_id()%>"><%=topDTO.getTitle()%></a></li>
				<%
					}
				%>
			</ul> <!--메인 네비게이션 end -->
		</td>
	</tr>
	<tr>
		<td><img src="/images/main/mainVisual.jpg"></td>
	</tr>
</table>
