<%
If Request("ch")<>"" Then
	ch=Request("ch")
Else
	ch="lu"
End If
If Request("no")<>"" Then
	no=Request("no")
Else
	no=1
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>���~����</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.main_title {
	font-family:"�L�n������", Verdana, Arial, ;
	font-size: 40px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.sub_title {
	font-family:"�L�n������", Verdana, Arial, ;
	font-size: 36px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.couple {
	font-family:"�L�n������", Verdana, Arial, ;
	font-size: 36px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.gold {
	font-family: Verdana, Arial, "�s�ө���";
	font-size: 26px;
	color: #81582F;
	letter-spacing: 1px;
	font-weight: bold;
}

hr {
	border:0; 
	height:1px; 
	background-color:#C79F62;
	color:#C79F62	/* IE6 */
}
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1400" height="1000" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><!-- #include file="menu.asp" --></td>
				</tr>
				<tr>
					<td height="50">&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								
				<td width="100%"> <span class="main_title"><img src="./images/<%=ch%>_<%=no%>.gif" style="float:left;margin-right:10px;margin-bottom:10px;height:390px;">���~����</span><br />
				  <br />
				  <span class="gold"> �Ҧ����~�S���ϥΥ��󭻺��ơC<br />
				  �B������N�O�K�[�^��������N�w�᪺�����A<br />
				  �[���]�O�s�A�[�ɬ�i��[�b�ѥ]�̡A<br />
				  �E�h���O�ӮɶO�\�I�ޫ᧨�ըϥΡC<br />
				  <br />
				  �A���P���ߪ����~�A�Ʀܳs���Ū��B�����O�A���P���߻s�@�A<br />
				  ���s�N�O���s�B�ٯ��N�O�ٯ��A<br />
				  ���|�ϥΥ��󭻺�ƪ��Ӽv�T�u���f�v���W�n�P�z���H�ߡC<br />
				  �]���f�ΤߡA�ȥu���z�C�^ </span></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr valign="bottom">
		<td><img id="ba" src="images/<%=ch%>_foot.gif"></td>
	</tr>
</table>
</body>
</html>
