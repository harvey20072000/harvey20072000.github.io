<%
If Request("ch")<>"" Then
	ch=Request("ch")
Else
	ch="lu"
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>觸控首頁</title>
</head>
<style type='text/css'>
td{
text-align:center;
z-index:1;
}
img{
cursor: pointer;
}
#ba{
cursor:default;
}
</style>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1400" height="1000" border="0" cellpadding="0" cellspacing="0" style="z-index:1;">
	<tr>
		<td align="center" valign="top" height="100"><!-- #include file="menu.asp" -->
	</tr>
	<tr>
		<td height="780" valign="top" align="center">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<%if ch="lu" then%>
				<tr>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=1'"><img src="images/<%=ch%>_1.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=2'"><img src="images/<%=ch%>_2.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=3'"><img src="images/<%=ch%>_3.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=4'"><img src="images/<%=ch%>_4.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=5'"><img src="images/<%=ch%>_5.gif" width="280" height="390"></td>
				</tr>
				<tr>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=7'"><img src="images/<%=ch%>_7.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=8'"><img src="images/<%=ch%>_8.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=9'"><img src="images/<%=ch%>_9.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=12'"><img src="images/<%=ch%>_12.gif" width="280" height="390"></td>
					<td width="280" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=13'"><img src="images/<%=ch%>_13.gif" width="280" height="390"></td>
				</tr>
				<%elseif ch="br" then%>
				<tr>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=1'"><img src="images/<%=ch%>_1.gif" width="315" height="405"></td>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=2'"><img src="images/<%=ch%>_2.gif" width="315" height="405"></td>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=3'"><img src="images/<%=ch%>_3.gif" width="315" height="405"></td>
				</tr>
				<tr>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=4'"><img src="images/<%=ch%>_4.gif" width="315" height="405"></td>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=5'"><img src="images/<%=ch%>_5.gif" width="315" height="405"></td>
					<td width="467" onClick="javascript:location.href='view.asp?ch=<%=ch%>&no=6'"><img src="images/<%=ch%>_5.gif" width="315" height="405"></td>
				</tr>
				<%elseif ch="ba" then%>
				<tr>
					<td width="1440"><img id="ba" src="images/<%=ch%>_1.gif"></td>
				</tr>
				<%end if%>
			</table>
		<%
		dis="none"
		If Request("root")<>"" Then
			dis="block"
		End if
		%>
		<div style="display:<%=dis%>;font-size:48px;font-weight:bold;z-index: 2; position: fixed; bottom:0px;width:1400;text-align:center;background-color:#CCC">
		<%
			If Request("root")<>""then
				If Request("root")="lu" then
					Response.Write "午餐 10：30～22：00"
				Else
					Response.Write "早餐 8:00~10:30"
				End if
			End if
		%>
		</div>
		</td>
	</tr>
</table>
</body>
</html>
