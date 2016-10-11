<%@page import="com.fashion.common.file.FileManager"%>
<%@page import="com.fashion.product.domain.Product"%>
<%@page import="com.fashion.product.mybatis.dao.ProductDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!ProductDAO productDAO = new ProductDAO(); %>
<%
	//유저가 선택한 product_id  파라미터 받기!
	
	String product_id=request.getParameter("product_id");
	Product product=productDAO.select(Integer.parseInt(product_id));
	String session_id=session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#mainNavi,#sub_category{color:#FFFFFF;text-align:center;font-family:"굴림체", "돋움체","Arial"}
.style3 {color: #FF0000}
.style1 {	font-size: 20px;
	font-weight: bold;
}
.style2 {color: #FF00FF}

#commentsArea{
	width:100%;
	background:yellow;
	height:300px;
	overflow:scroll;
}
-->
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
//서버측에 비동기방식으로 등록을 요청하자!!
function regist(){
	$.post("/comments/regist.jsp", {
		product_id:form2.product_id.value,		
		title:form2.title.value, 
		writer:form2.writer.value
	}, function(data , status){
		//서버에서 전송된, json 데이터를 분석하여  result가 1이면
		//게시물 출력!!
		if(data.result==1){
			printComments();
		}
	});
	
}
//코멘트 게시물 출력하기
function printComments(){
	//서버에 게시물을 요청하되, 비동기로 요청하자!
	$.get("/comments/list.jsp?product_id=<%=product_id%>", function(data,status){
		var commentsArea=document.getElementById("commentsArea");
		var tag="<table width=\"100%\" border=\"1px\">";
		tag+="<tr>";
		tag+="<td width=\"70%\">제목</td>";
		tag+="<td width=\"10%\">작성자</td>";
		tag+="<td width=\"20%\">작성날짜</td>";
		tag+="</tr>";
		var commentsList=data.commentsList;	
		for(var i=0;i<commentsList.length;i++){
			var comments=commentsList[i];
			tag+="<tr>";
			tag+="<td width=\"70%\">"+comments.title+"</td>";
			tag+="<td width=\"10%\">"+comments.writer+"</td>";
			tag+="<td width=\"20%\">"+comments.regdate+"</td>";
			tag+="</tr>";
		}
		tag+="</table>";
		commentsArea.innerHTML=tag;
		
	});
}
//window.load()를 표현한것
//jquery느;ㄴ 누구를 어떯게 할지
//(selectort)css특징을 따른다.
$(document).ready(function(){
	printComments();
});
//서버에 지금 보고 있는 상품을 장바구니에 넣도록 요청하자(비동기로)
function inputCart(){
	//색상이나 사이즈 선택하지 않으면 욕...
	if(form1.psize.value==""){
		alert("사이즈를 선택하세요");
		return;
	}
	if(form1.color.value==""){
		alert("색상을 선택하세요");
		return;
	}

	$.post("/shopping/inputCart.jsp",{
		product_id:<%=product.getProduct_id()%>,
		product_name:"<%=product.getProduct_name()%>",
		color:form1.color.value,
		psize:form1.psize.value,
		discount:<%=product.getDiscount()%>,
		stock:form1.ea.value,
		img:"<%=product.getImg()%>"
	},function(data,status){
		if(confirm(data+"\n"+"장바구니로 이동하시겠이요?")){
			location.href="/shopping/cart.jsp";
		}
	});
	
}

</script>
</head>
<body>
<table align="center" width="970" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="722" height="60" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="224" rowspan="2"><img src="/images/common/logo.gif" width="224" height="64" /></td>
            <td height="30" align="right"><table height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40"><img src="/images/main/btn_login.gif" width="40" height="18" /></td>
                <td width="64"><img src="/images/main/menu_join.gif" width="64" height="18" /></td>
                <td width="60"><img src="/images/main/menu_cart.gif" width="60" height="18" /></td>
                <td width="88"><img src="/images/main/menu_orderlist.gif" width="88" height="18" /></td>
                <td width="58"><img src="/images/main/menu_cs.gif" width="58" height="18" /></td>
              </tr>
            </table>			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
          <tr id="mainNavi" align="center">
            <td>메뉴1</td>
            <td>메뉴2</td>
            <td>메뉴3</td>
            <td>메뉴4</td>
            <td>메뉴5</td>
            <td>메뉴6</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100"><img src="/images/main/mainVisual.jpg" width="970" height="195" /></td>
      </tr>
      <tr>
        <td height="450" valign="top"><table width="100%" height="300" border="0" cellpadding="0" cellspacing="0">
          <tr height="50">
            <td width="150">&nbsp;</td>
            <td width="10">&nbsp;</td>
            <td width="810" height="30" >상위 카테고리&lt; 하위 카테고리 </td>
          </tr>
          <tr>
            <td width="150" valign="top"></td>
            <td width="10">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="731" height="102" valign="top"background="images/main_bg05.gif" style="padding-top:10px;"><img src="/images/detail/detail_tltle.gif" width="731" height="67" /></td>
              </tr>
              <tr>
                <td>
                 <!--상세보기 시작  -->
                 <form name="form1" method="post">
                <table width="100%" border="3" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="5" rowspan="2" valign="top"><img src="/images/detail/detail_bg01.gif" width="5" height="25" /></td>
                      <td width="690"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="300"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="300"><img src="/product/<%=product.getProduct_id() %>.<%=FileManager.getExt(product.getImg()) %>" width="300" height="300" border="1" /></td>
                                </tr>
                                <tr>
                                  <td height="36" align="center"><img src="/images/detail/detail_btn_view.gif" width="51" height="24" /></td>
                                </tr>
                            </table></td>
                            <td width="19"></td>
                            <td width="370" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="100" height="46" valign="top" style="padding-left:20px; padding-top:10px;"><span class="style1">빅포니</span></td>
                                  <td width="269" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_price.gif" width="62" height="12" /></td>
                                  <td valign="top"><span class="style2" style="text-decoration:line-through"><%=product.getPrice() %>원</span> ㅡ&gt; <span class="style2"><%=product.getDiscount() %>원</span></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_point.gif" width="50" height="12" /></td>
                                  <td valign="top"><%=product.getPoint() %>원</td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_brand.gif" width="51" height="12" /></td>
                                  <td valign="top"><%=product.getProduct_name() %></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_made.gif" width="49" height="12" /></td>
                                  <td valign="top">made in <%=product.getNation() %></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_code.gif" width="63" height="12" /></td>
                                  <td valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td width="82" valign="top"><%=product.getProduct_id() %></td>
                                        <td valign="top"><img src="/images/detail/detail_btn_size.gif" width="79" height="20" /></td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_size.gif" width="51" height="12" /></td>
                                  <td valign="top">
                                  <%String psize[]=product.getPsize().split(","); %>
                                  <select name="psize">
                                      <option value="">선택</option>
                                      <%for(int i=0;i<psize.length;i++){%>
                                      <option value="<%=psize[i]%>"><%=psize[i] %></option>
                                      <%} %>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_color.gif" width="40" height="13" /></td>
                                  <td valign="top">
                                  <%String color[]=product.getColor().split(","); %>
                                  <select name="color">
                                      <option value="">선택</option>
                                      <%for(int i=0;i<color.length;i++){%>
                                      <option value="<%=color[i]%>"><%=color[i] %></option>
                                      <%} %>
                                  </select></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_count.gif" width="39" height="13" /></td>
                                  <td valign="top">
                                  	<input type="text" name="ea" size="5" value="1">
                                  </td>
                                </tr>
                                <tr>
                                  <td height="33" colspan="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="24" colspan="2" valign="top">
                                  <a href="step1.html">
	                                  <img src="/images/detail/detail_btn_buy.gif" width="109" height="23" border="0" />
	                                  </a>&nbsp;
	                                  <img src="/images/detail/detail_btn_cart.gif" width="109" height="23" onClick="inputCart()"/>
	                                  &nbsp;
	                                  <img src="/images/detail/detail_btn_wish.gif" width="109" height="23" />
                                  </td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                      <td rowspan="2"></td>
                    </tr>
                    <tr>
                      <td height="23"></td>
                    </tr>
                </table>
                </form>
                <!-- 상세보기 끝 -->
                </td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="6"></td>
                      <td width="690"><img src="/images/detail/detailinfo_img.gif" width="70" height="25" /></td>
                      <td rowspan="6"></td>
                    </tr>
                    <tr>
                      <td height="3"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="../product_img/004060-000530_S[3].jpg" width="500" height="500" />
					  <p><img src="../product_img/004060-000562_S[2].jpg" width="500" height="500" />					  </td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/infotext_img.gif" width="690" height="478" /></td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/size_img.gif" width="690" height="255" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="4"></td>
                      <td width="690"><img src="/images/detail/detailinfo2_img.gif" width="110" height="25" /></td>
                      <td rowspan="4"></td>
                    </tr>
                    <tr>
                      <td height="3"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/text_img.gif" width="690" height="762" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="5"></td>
                      <td width="690"><img src="/images/detail/detailinfo3_img.gif" width="70" height="25" /></td>
                      <td rowspan="5"></td>
                    </tr>
                    <tr>
                      <td height="1"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="575"><img src="/images/detail/text02_img.gif" width="575" height="23" /></td>
                            <td><img src="/images/detail/question_btn.gif" width="72" height="23" /></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                    	<td>
                    		<form name="form2" method="post">
                    			<input type="hidden" name="product_id" value="<%=product_id%>">
                    			<input type="text" size="30" name="title">	
                    			<input type="text" size="7" name="writer">	
                    			<input type="button" value="댓글등록" onClick="regist()">	
                    		</form>
                    	</td>
                    </tr>
                    <tr>
                      <td><!-- 상품문의 테이블 시작 ======================================= -->
                          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><!-- 바깥테이블 시작-->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="3" bgcolor="#F2F2F2">
                                          <tr>
                                            <td bgcolor="#D9D9D9" valign="top"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                                                <tr>
                                                  <td bgcolor="#FFFFFF" valign="top" style="padding:10px;"><!-- 내용시작-->
                                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td valign="top"><!-- 입력테이블 시작-->
                                                                    <table
                                                id="__psn_QuestionDlg"
                                                style="display:none;"                                          
                                                width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                      <tr>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-1.gif" width="4" height="4" /></td>
                                                                        <td bgcolor="#EBEBEB"></td>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-2.gif" width="4" height="4" /></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="4" bgcolor="#EBEBEB"></td>
                                                                        <td bgcolor="#EBEBEB" valign="top" style="padding-top:5px;" align="center"><!--입력시작-->
                                                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                              <form method="post" name="__oFormGoodsQA" id="__oFormGoodsQA">
                                                                                <input type="hidden" name="iCmdObject" value='TGoodsQA' />
                                                                                <input type="hidden" name="iCmdExec" value='' />
                                                                                <input type="hidden" name="iCmdValue" value='' />
                                                                                <input type="hidden" name="iCategoryId" value='25' />
                                                                                <input type="hidden" name="iCategoryIdMain" value='' />
                                                                                <input type="hidden" name="iGoodsId" value='0025_00035' />
                                                                                <input type="hidden" name="iGoodsQAPage" value='' />
                                                                                <tr>
                                                                                  <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                                      <tr>
                                                                                        <td width="35" style="padding-left:10px;" >제목</td>
                                                                                        <td><input style="width:97%;"  class="input01" type="text" name="oSubject" size="15" />
                                                                                        </td>
                                                                                      </tr>
                                                                                      <tr>
                                                                                        <td width="35" style="padding-left:10px;">내용 </td>
                                                                                        <td><textarea style="width:97%;" name="oMemo"  rows="3"></textarea>
                                                                                        </td>
                                                                                      </tr>
                                                                                  </table></td>
                                                                                </tr>
                                                                                <tr>
                                                                                  <td align="right" style="padding-top:3px; padding-bottom:3px; padding-right:10px;"><!-- 작성자 입력 테이블-->
                                                                                      <table   border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                          <td>이름
                                                                                            <input type="text" size="10" name="oName" class="input01">
                                                                                            비밀번호
                                                                                            <input type="password" size="4" name="oPass" class="input01" />
                                                                                          </td>
                                                                                          <td  align="center" style="padding-left:7px;"><a href="javascript:onclick=__ps_GoodsQA_Submit( document.__oFormGoodsQA );">
                                                                                            <image border=0 style="cursor:hand;" SRC=http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_write.gif>
                                                                                          </a> </td>
                                                                                        </tr>
                                                                                      </table>
                                                                                    <!-- 작성자 입력 테이블 끝-->
                                                                                  </td>
                                                                                </tr>
                                                                              </form>
                                                                            </table>
                                                                          <!--입력끝-->
                                                                        </td>
                                                                        <td width="4" bgcolor="#EBEBEB"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-3.gif" width="4" height="4" /></td>
                                                                        <td bgcolor="#EBEBEB"></td>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-4.gif" width="4" height="4" /></td>
                                                                      </tr>
                                                                    </table>
                                                                  <!-- 입력테이블 끝-->
                                                                </td>
                                                              </tr>
                                                          </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td valign="top" style="padding-top:10px;">
                                                          <div id="commentsArea">
                                                          	
                                                          </div>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    <!-- 내용끝--></td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                        </table>
                                      <!-- 바깥테이블 끝-->
                                    </td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td height="5"></td>
                            </tr>
                            <tr>
                              <td ><table width="100%">
                                  <tr>
                                    <td style="font-family:Tahoma;font-size:9pt; padding-left:5px;" align="center"><a href="javascript:alert('여기가 처음입니다.')"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_pre.gif" width="36" height="18" border="0" align="absmiddle" /></a>&nbsp;&nbsp; <b>1</b> . <a href="javascript:__ps_OnMoveGoodsQAPage(2)">2</a> .
                                      &nbsp; <a href="javascript:alert('여기가 끝입니다.')"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_next.gif" width="36" height="18" border="0" align="absmiddle" /></a> </td>
                                  </tr>
                              </table></td>
                            </tr>
                          </table>
                        <!-- 상품문의 테이블 끝-->
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
