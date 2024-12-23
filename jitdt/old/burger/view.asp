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
<title>產品說明</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.main_title {
	font-family:"微軟正黑體", Verdana, Arial, ;
	font-size: 40px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.sub_title {
	font-family:"微軟正黑體", Verdana, Arial, ;
	font-size: 36px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.couple {
	font-family:"微軟正黑體", Verdana, Arial, ;
	font-size: 36px;
	color: #000000;
	letter-spacing: 1px;
	font-weight: bold;
}

.gold {
	font-family: Verdana, Arial, "新細明體";
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
								
				<td width="100%"> <span class="main_title"><img src="./images/<%=ch%>_<%=no%>.gif" style="float:left;margin-right:10px;margin-bottom:10px;height:390px;">產品說明</span><br />
				  <br />
				  <span class="gold"> 所有產品沒有使用任何香精原料。<br />
				  伯爵茶香就是添加英國唐寧茶葉冷泡後的湯水，<br />
				  蒜香也是新鮮蒜粒研磨後加在麵包裡，<br />
				  九層塔更是耗時費功截芽後夾拌使用。<br />
				  <br />
				  鮮奶與豆漿的產品，甚至連降溫的冰塊都是鮮奶與豆漿製作，<br />
				  紅酒就是紅酒、抹茶就是抹茶，<br />
				  不會使用任何香精化物來影響「樂檸」的名聲與您的信心。<br />
				  （樂檸用心，僅只為您。） </span></td>
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
