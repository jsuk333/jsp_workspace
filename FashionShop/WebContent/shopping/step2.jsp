<%@page import="com.fashion.member.domain.Guest"%>
<%@page import="com.fashion.shopping.domain.Bank"%>
<%@page import="com.fashion.shopping.mybatis.dao.BankDAO"%>
<%@page import="com.fashion.shopping.domain.Payment"%>
<%@page import="com.fashion.shopping.domain.Dest"%>
<%@page import="com.fashion.member.domain.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%!
	BankDAO bankDAO = new BankDAO();
%>
<%
	String customer_name="";
	String tel1="",tel2="",tel3="";
	String email="";
	String zipcode1="",zipcode2="";
	String addr1="",addr2="";

	if(session.getAttribute("customer_type").equals("member")){
		Member customer = (Member) session.getAttribute("customer");
		customer_name=customer.getMember_name();
		tel1=customer.getPhone1();
		tel2=customer.getPhone2();
		tel3=customer.getPhone3();
		email=customer.getEmail();
		zipcode1=customer.getZipcode1();
		zipcode2=customer.getZipcode2();
		addr1=customer.getAddr1();
		addr2=customer.getAddr2();
		
	}else if(session.getAttribute("customer_type").equals("guest")){
		Guest customer = (Guest) session.getAttribute("customer");
		customer_name=customer.getGuest_name();
		tel1=customer.getTell1();
		tel2=customer.getTell2();
		tel3=customer.getTell3();
		email=customer.getMail();
		zipcode1=customer.getPost1();
		zipcode2=customer.getPost2();
		addr1=customer.getHome1();
		addr2=customer.getHome2();
	}

	Dest dest = (Dest) session.getAttribute("dest");
	Payment payment = (Payment) session.getAttribute("payment");

	Bank bank = bankDAO.select(payment.getBank_id());
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

#mainNavi {
	color: #FFFFFF;
	text-align: center;
	font-family: "굴림체", "돋움체", "Arial"
}

.style1 {
	color: #FF0000
}

.style4 {
	color: #FF0000;
	font-weight: bold;
}

.style2 {
	color: #132699;
	font-weight: bold;
}
-->
</style>
<script>



</script>
</head>
<body>
	<table align="center" width="970" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="722" height="60" valign="top"><table width="100%"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="60"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="224" rowspan="2"><img
										src="/images/common/logo.gif" width="224" height="64" /></td>
									<td height="30" align="right"><table height="20"
											border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="40"><img src="/images/main/btn_login.gif"
													width="40" height="18" /></td>
												<td width="64"><img src="/images/main/menu_join.gif"
													width="64" height="18" /></td>
												<td width="60"><img src="/images/main/menu_cart.gif"
													width="60" height="18" /></td>
												<td width="88"><img
													src="/images/main/menu_orderlist.gif" width="88"
													height="18" /></td>
												<td width="58"><img src="/images/main/menu_cs.gif"
													width="58" height="18" /></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="30"><table width="100%" height="30" border="0"
								cellpadding="0" cellspacing="0" bgcolor="#000000">
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
						<td height="100"><img src="/images/main/mainVisual.jpg"
							width="970" height="195" /></td>
					</tr>
					<tr>
						<td valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td height="30" valign="top"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="731" height="102" align="center" valign="top"
										background="images/main_bg05.gif" style="padding-top: 10px;">&nbsp;</td>
									<td width="731" align="center" valign="top"
										background="images/main_bg05.gif" style="padding-top: 10px;"><img
										src="/images/sanction/sanction_title.gif" width="731"
										height="67" /></td>
									<td width="731" align="center" valign="top"
										background="images/main_bg05.gif" style="padding-top: 10px;">&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><table width="100%" border="0" cellpadding="0"
											cellspacing="0" bgcolor="f6f5f5">
											<tr>
												<td><img src="/images/sanction/sanction_custinfo5.gif"
													width="58" height="17" /></td>
											</tr>
											<tr>
												<td height="1" bgcolor="d5d5d5"></td>
											</tr>
											<tr>
												<td height="13"></td>
											</tr>
											<tr>
												<td valign="top"><table width="100%" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<td width="4"></td>
															<td width="124" height="32" valign="middle">총금액</td>
															<td width="421" valign="middle"><span class="style1"><%=payment.getTotalbuy() %></span>원</td>
														</tr>
														<tr>
															<td height="1" colspan="3"
																background="images/sanction/sanction_bg04.gif"></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td height="29" valign="middle">배송비</td>
															<td valign="middle">2,500원</td>
														</tr>
														<tr>
															<td height="1" colspan="3"
																background="images/sanction/sanction_bg04.gif"></td>
														</tr>
														<tr>
															<td height="29">&nbsp;</td>
															<td valign="middle">적립금사용</td>
															<td valign="middle">0원</td>
														</tr>
														<tr>
															<td height="1" colspan="3"
																background="images/sanction/sanction_bg04.gif"></td>
														</tr>
														<tr>
															<td height="29">&nbsp;</td>
															<td valign="middle">입금계좌</td>
															<td valign="middle"><strong><%=bank.getBank_name() %>
																	<%=bank.getBank_num() %> [박지호]</strong></td>
														</tr>
														<tr>
															<td height="1" colspan="3"
																background="images/sanction/sanction_bg04.gif"></td>
														</tr>
														<tr>
															<td height="29">&nbsp;</td>
															<td valign="middle">입금자이름</td>
															<td valign="middle"><%=payment.getPay_name() %></td>
														</tr>
														<tr>
															<td height="1" colspan="3"
																background="images/sanction/sanction_bg04.gif"></td>
														</tr>
														<tr>
															<td height="29">&nbsp;</td>
															<td valign="middle">총결제금액</td>
															<td valign="middle"><span class="style4"><%=payment.getTotalpay() %>원</span></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td height="1" bgcolor="d5d5d5"></td>
											</tr>
										</table></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td><img src="/images/sanction/sanction_custinfo6.gif"
													width="93" height="17" /></td>
											</tr>
											<tr>
												<td height="1" bgcolor="d5d5d5"></td>
											</tr>
											<tr>
												<td height="13"></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="30" bgcolor="d6d5d5">주문자명</td>
															<td width="45"></td>
															<td><%=customer_name%></td>
														</tr>
														<tr>
															<td height="30" bgcolor="d6d5d5">핸드폰번호</td>
															<td width="45"></td>
															<td><%=tel1%>-<%=tel2 %>-<%=tel3%></td>
														</tr>
														<tr>
															<td height="30" bgcolor="d6d5d5">이메일</td>
															<td width="45"></td>
															<td><%=email %></td>
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
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td><img src="/images/sanction/sanction_custinfo7.gif"
													width="93" height="17" /></td>
											</tr>
											<tr>
												<td height="1" bgcolor="d5d5d5"></td>
											</tr>
											<tr>
												<td height="13"></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="17" rowspan="5" bgcolor="d6d5d5"></td>
															<td width="75" height="33" bgcolor="d6d5d5"
																style="padding-top: 3px;">받으실 분</td>
															<td width="45"></td>
															<td style="padding-top: 3px;"><%=dest.getDest_name() %></td>
														</tr>
													
														<tr>
															<td height="30" bgcolor="d6d5d5">핸드폰번호</td>
															<td>&nbsp;</td>
															<td><%=dest.getCell1() %>-<%=dest.getCell2() %>-<%=dest.getCell3() %></td>
														</tr>
														<tr>
															<td height="30" bgcolor="d6d5d5">받으실 곳</td>
															<td>&nbsp;</td>
															<td><%=dest.getHouse1() %> <%=dest.getHouse2() %></td>
														</tr>
														<tr>
															<td height="30" bgcolor="d6d5d5">배송메시지</td>
															<td>&nbsp;<%=dest.getMsg() %></td>
															<td>&nbsp;</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td height="24">&nbsp;</td>
									<td height="40" align="center"><img
										src="/images/sanction/checktext_img.gif" width="325"
										height="18" /></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td height="24">&nbsp;</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="300" align="center">
												<a href="step2_save.jsp">
													<img src="/images/sanction/btn_cash.gif" width="70" height="26" border="0"/>
												</a>
												
											   <a href="javascript:history.back()">이전으로</a>
											   
												</td>
											</tr>
										</table></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td height="15">&nbsp;</td>
									<td height="15">&nbsp;</td>
									<td height="15">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
