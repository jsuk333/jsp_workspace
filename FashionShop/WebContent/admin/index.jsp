<%@ page contentType="text/html;charset=utf-8"%>
<HTML>
<HEAD>
<title>JAVA 2Model Fashion</title>
<META http-equiv=Content-Type
	content="text/html; charset=ks_c_5601-1987">
<LINK href="images/body.css" type=text/css rel=stylesheet>
<script>
	function loginCheck() {
		if (form1.id.value == "") {
			alert("아이디를 입력하세요");
			form1.id.focus();
			return;
		}
		if (form1.password.value == "") {
			alert("비밀번호를 입력하세요");
			form1.password.focus();
			return;
		}
		form1.action = "/admin/loginCheck.jsp";
		form1.submit();
	}
</script>
<STYLE type=text/css>
.form_login {
	BACKGROUND-COLOR: #f4f1f7;
	COLOR: #555555;
	font-family: "Arial", "Verdana", "sans-serif", "µ¸¿ò";
	font-size: 9pt;
	padding-top: 2px;
	padding-left: 2px;
	BORDER-BOTTOM: #d2cdd5 1px solid;
	BORDER-LEFT: #a79bb1 1px solid;
	BORDER-RIGHT: #d2cdd5 1px solid;
	BORDER-TOP: #a79bb1 1px solid;
	margin: 1px;
}
</STYLE>
</HEAD>
<BODY bgColor=#ffffff onLoad="form1.id.focus()"
	background="images/login_background.gif">
	<form name="form1" method="post">
		<TABLE height="100%" width="100%" align="center" border=0 valign="top">
			<TR>
				<TD align="center" valign="top">

					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" valign="top">
						<tr>
							<td colspan="7" height="50">&nbsp;</td>
						</tr>
					</table>
					<table width="475" border="0" cellspacing="0" cellpadding="0"
						align="center" valign="top">
						<tr>
							<td colspan="7" align="center" valign="bottom" height="140"><img
								src="/admin/images/login_text.gif"></td>
						</tr>
						<tr>
							<td>
							<td width="160" height="45" valign="top">&nbsp;</td>
							<td width="46" height="45" valign="top"><img
								src="images/adminid.gif" width="46" height="45"></td>
							<td width="103" valign="middle"><input name="id" type="text"
								class="form_login" style="width: 100;"></td>
							<td width="25" valign="top"><img src="images/adminpwd.gif"
								width="25" height="45"></td>
							<td width="103" valign="middle"><input name="password"
								type="password" class="form_login" style="width: 100;">
							</td>
							<td width="110" align="left" valign="top"><img
								src="images/login_go.gif" width="43" height="45"
								style="cursor: hand" onClick="loginCheck()"></td>
						</tr>
					</table>
				</TD>
			</TR>
		</TABLE>
	</FORM>
</BODY>
</HTML>