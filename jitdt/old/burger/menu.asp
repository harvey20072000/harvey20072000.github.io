<style type='text/css'>
img #item{
cursor: pointer;
text-align:center;
}
td #item{
text-align:center;
}
</style>
<table width="1400" height="100" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<%
					mch="br"
					root="br"
					If (Hour(Now)=10 & Minute(Now)>30)or Hour(Now)<8 or Hour(Now)>11 Then
						mch="lu"
						root="lu"
					End if
					%>
					<td width="280" id="item" onClick="javascript:location.href='touch.asp?ch=br'"><img id="item" src="images/menu/bk.gif" width="200" height="80"></td>
					<td width="280" id="item" onClick="javascript:location.href='touch.asp?ch=lu'"><img id="item" src="images/menu/lunch.gif" width="200" height="80"></td>
					<td width="280" id="item" onClick="javascript:location.href='touch.asp?ch=ba'"><img id="item" src="images/menu/bake.gif" width="200" height="80"></td>
					<td width="280" id="item" onClick="javascript:location.href='touch.asp?ch=<%=mch%>&root=<%=root%>'"><img id="item" src="images/menu/root.gif" width="200" height="80"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>