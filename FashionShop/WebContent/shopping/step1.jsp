<%@page import="com.fashion.common.format.MoneyFormat"%>
<%@page import="com.fashion.common.file.FileManager"%>
<%@page import="com.fashion.product.domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion.shopping.domain.Bank"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.shopping.mybatis.dao.BankDAO"%>
<%@page import="com.fashion.member.domain.Guest"%>
<%@page import="com.fashion.member.domain.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	BankDAO bankDAO = new BankDAO();
%>
<%
	List<Bank> bankList=bankDAO.selectAll();
	
	ArrayList<Product> cart=(ArrayList)session.getAttribute("cart");
	
	// 회원이던, 비회원이던, 인증을 거치지 않으면 이 페이지를
	//볼 수 없다!!
	if(session.getAttribute("customer_type")==null){
		out.print(showMsgURL("로그인이 필요한 서비스입니다.", "/shopping/loginForm.jsp"));
	}else{
%>
<%
	//로그인 하지 않거나, 비회원인경우 정보가 없다면..
	//경우엔, 인증 페이지로 보내야 함..
	String customer_name="";
	String tel1="",tel2="",tel3="";
	String email="";
	String zipcode1="",zipcode2="";
	String addr1="",addr2="";

	if(session.getAttribute("customer_type").equals("member")){ //회원인 경우...	
		Member member=(Member)session.getAttribute("member");
		customer_name=member.getMember_name();
		tel1=member.getPhone1();
		tel2=member.getPhone2();
		tel3=member.getPhone3();
		email=member.getEmail();
		zipcode1=member.getZipcode1();
		zipcode2=member.getZipcode2();
		addr1=member.getAddr1();
		addr2=member.getAddr2();
	
	}else if(session.getAttribute("customer_type").equals("guest")){//guest 인 경우..
		Guest guest=(Guest)session.getAttribute("guest");
		customer_name=guest.getGuest_name();
		tel1=guest.getTell1();
		tel2=guest.getTell2();
		tel3=guest.getTell3();
	}
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
#mainNavi{color:#FFFFFF;text-align:center;font-family:"굴림체", "돋움체","Arial"}
.style1 {color: #FF0000}
-->
</style>
<script>
function setForm(obj){
	if(obj.value=="yes"){//받으실분 폼양식 그대로 옮겨 기재하기
		form1.dest_name.value=form1.customer_name.value;
		
		form1.dest_tel1.value=form1.customer_tel1.value;
		form1.dest_tel2.value=form1.customer_tel2.value;
		form1.dest_tel3.value=form1.customer_tel3.value;
		
		form1.dest_zipcode1.value=form1.customer_zipcode1.value;
		form1.dest_zipcode2.value=form1.customer_zipcode2.value;
		form1.dest_addr1.value=form1.customer_addr1.value;
		form1.dest_addr2.value=form1.customer_addr2.value;
		
	}else{//받으실분 다시 초기화...
		form1.dest_name.value="";
	
		form1.dest_tel1.value="";
		form1.dest_tel2.value="";
		form1.dest_tel3.value="";
		
		form1.dest_zipcode1.value="";
		form1.dest_zipcode2.value="";
		form1.dest_addr1.value="";
		form1.dest_addr2.value="";
	}
}
function goStep2(){
	form1.action="/shopping/step1_save.jsp";
	form1.submit();
}
</script>
</head>
<body>
<form name="form1" method="post">
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
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="731" height="102" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;">&nbsp;</td>
            <td width="731" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;"><img src="/images/sanction/sanction_title.gif" width="731" height="67" /></td>
            <td width="731" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td width="64" height="28" align="center"><img src="/images/sanction/pdcode_img.gif" width="49" height="12" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="303" height="28" align="center"><img src="/images/sanction/pdprice_img.gif" width="86" height="12" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="76" height="28" align="center"><img src="/images/sanction/count_img.gif" width="25" height="13" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="76" height="28" align="center"><img src="/images/sanction/total_img.gif" width="24" height="12" /></td>
              </tr>
              <tr>
                <td height="3" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <%int deliver_price=2500; %>
              <%int total=0;//총 합계 %>
              <%for(int i=0;i<cart.size();i++){%>
              <%Product product=cart.get(i); %>
              <%
              	int sum=product.getDiscount()*product.getStock(); //갯수 * 가격 = 소계
              	total+=sum;
              %>
              <tr>
                <td height="87"><%=product.getProduct_id() %></td>
                <td height="87"></td>
                <td height="87"><table width="100%" height="87" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="115" align="center">
                      <img src="/product/<%=product.getProduct_id()%>.<%=FileManager.getExt(product.getImg()) %>" width="87" height="87" />
                      </td>
                      <td width="188"><%=product.getProduct_name() %><br />
                        옵션 : 색상→ <%=product.getColor() %>
                        , 사이즈→ <%=product.getPsize() %><br />
                        <strong><%=product.getDiscount()%>원</strong> </td>
                    </tr>
                </table></td>
                <td height="87"></td>
                <td height="87" align="center">
                	<input name="text" type="text" style="width:21px;" value="<%=product.getStock() %>" />
                  개 </td>
                <td height="87"></td>
                <td height="87" align="center"><%=MoneyFormat.getResult(sum)%>원</td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <%} %>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="36" colspan="7" align="center">━ <strong>총 주문금액 <span class="style1"><%=MoneyFormat.getResult(total) %></span>원</strong> </td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="25"></td>
            <td height="25"></td>
            <td height="25"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo1.gif" width="85" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="13" colspan="4"></td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">주문하시는 분 </td>
                <td width="9">:</td>
                <td width="462"><input type="text" name="customer_name" style="width:70px;" value="<%=customer_name %>" /></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">전화번호</td>
                <td>:</td>
                <td><input type="text" name="customer_tel1" style="width:34px;" maxlength="4" value="<%=tel1%>"/>
                  -
                  <input type="text" name="customer_tel2" style="width:34px;" maxlength="4"  value="<%=tel2%>"/>
                  -
                  <input type="text" name="customer_tel3" style="width:34px;" maxlength="4"  value="<%=tel3%>"/></td>
              </tr>
              
              <tr>
                <td height="26"></td>
                <td height="26">이메일</td>
                <td>:</td>
                <td><input name="customer_email" type="text" style="width:178px;" value="<%=email %>" /></td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td valign="top"  style="padding-top:3px">주소</td>
                <td valign="top"  style="padding-top:3px">:</td>
                <td><table width="100%" height="60" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="90">
                      <input name="customer_zipcode1" type="text" style="width:28px;" value="<%=zipcode1%>"/>
                        -
                        <input name="customer_zipcode2" type="text" style="width:28px;"  value="<%=zipcode2%>"/></td>
                      <td width="430"><img src="/images/memberjoin/memberjoin_addrseh.gif" width="79" height="17" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="customer_addr1" type="text" style="width:310px;"  value="<%=addr1%>"/></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="customer_addr2" type="text" style="width:310px;" value="<%=addr2%>"/></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td height="24"></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo2.gif" width="73" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="13" colspan="4"></td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">정보동일 확인 </td>
                <td width="9">:</td>
                <td width="462"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="180">주문고객 정보와 동일하십니까? </td>
                      <td><label>
                        <input type="radio" name="isSame"  value="yes" id="radiobutton" class="radio" onClick="setForm(this)"/>
                        예 &nbsp;
                        <input type="radio" name="isSame"  value="no" id="radio" class="radio" onClick="setForm(this)"/>
                        아니오</label>
                          </label></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">받으실 분</td>
                <td>:</td>
                <td width="462"><input type="text" name="dest_name" style="width:70px;" value="" /></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">전화번호</td>
                <td>:</td>
                <td><label>
                  <input type="text" name="dest_tel1" style="width:34px;" maxlength="4" />
                  -
                  <input type="text" name="dest_tel2" style="width:34px;" maxlength="4" />
                  -
                  <input type="text" name="dest_tel3" style="width:34px;" maxlength="4" />
                </label></td>
              </tr>
              
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td valign="top"  style="padding-top:3px">주소</td>
                <td valign="top"  style="padding-top:3px">:</td>
                <td><table width="100%" height="60" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="90"><input name="dest_zipcode1" type="text" style="width:28px;" />
                        -
                        <input name="dest_zipcode2" type="text" style="width:28px;" /></td>
                      <td width="430"><img src="/images/memberjoin/memberjoin_addrseh.gif" width="79" height="17" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="dest_addr1" type="text" style="width:310px;" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="dest_addr2" type="text" style="width:310px;" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">배송시 메시지 </td>
                <td>:</td>
                <td><input name="msg" type="text" style="width:278px;" value="" />
                  &nbsp;<strong>[30자이내]</strong></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo4.gif" width="60" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="13" colspan="4"></td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">결제 방법선택 </td>
                <td width="9">:</td>
                <td width="462"><label>
                  <input type="radio" name="check"  value="radiobutton" id="radio2" class="radio" />
                  카드결제
                  &nbsp;
                                <input type="radio" name="check"  value="radiobutton" id="radio3" class="radio" />
                  무통장입금 </label>
                    </label></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">총 구매금액 </td>
                <td>:</td>
                <td><input name="totalbuy" type="text" style="width:58px;" value="<%=total %>" />
                  원</td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">배송비</td>
                <td>:</td>
                <td><label>
                  <input name="text32" type="text" style="width:58px;" value="<%=deliver_price %>" />
                  원</label></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">적립금사용</td>
                <td>:</td>
                <td><input name="point" type="text" style="width:58px;" value="0" />
                  사용할 포인트를 입력해 주세요. </td>
              </tr>
              <tr>
                <td ></td>
                <td height="26">결제금액</td>
                <td >:</td>
                <td><input name="totalpay" type="text" style="width:58px;" value="<%=total+deliver_price %>" />
                  원</td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td height="26" valign="top"  style="padding-top:3px">입금은행</td>
                <td valign="top"  style="padding-top:3px">&nbsp;</td>
                <td>
					<select name="bank">
					<%for(int i=0;i<bankList.size();i++){%>
					<%Bank bank=bankList.get(i); %>
					<option value="<%=bank.getBank_id()%>"><%=bank.getBank_name()%><%=bank.getBank_num() %></option>
					<%} %>
					</select>
                </td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td height="26" valign="top"  style="padding-top:3px">입금자이름</td>
                <td valign="top"  style="padding-top:3px">&nbsp;</td>
                <td><input name="pay_name" type="text" style="width:58px;" value="" /></td>
              </tr>
              <tr>
                <td height="26" colspan="4"></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="300" align="right">
                <img src="../images/cart/btn_cash.gif" width="70" height="26" border="0" onClick="goStep2()"/>
                </td>
                <td width="20">&nbsp;</td>
                <td width="411"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image20','','images/sanction/btn_back_over.gif',1)"><img src="/images/sanction/btn_back.gif" name="Image20" width="70" height="26" border="0" id="Image20" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image18','','images/sanction/btn_back_over.gif',1)"></a></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="31">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
<%} %>








