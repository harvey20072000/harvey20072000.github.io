<!-- #include Virtual="DB.FUN" --->
<!-- #include file="include/init.asp" -->
<%
DNS = Request.ServerVariables("SERVER_NAME")

SQL = "Select * From tslation"
SQL = SQL & " Where domain_name = '" & LCase(DNS) & "'"
'Response.Write "DB:" & DB & "<BR>"
'Response.Write "pwd:" & DBPWD & "<BR>"
'Response.Write SQL & "<BR>"

Set rs = GetSecuredMdbRecordset(DB, SQL, DBPWD)

If rs Is Nothing Then
	Response.Write "無法開啟網址對應"
	Response.End
End If

'Response.Write DNS
'Response.End
'IF Not rs.EOF Then
'	HPage = rs("web_site_URL")
'	STitle = rs("site_title")
'Else
'	HPage = "index.asp"
'	STitle = "※網站空間租賃服務※《易尋網》web.ezfind.com.tw"
'End If

IF Not rs.EOF Then
	'Response.write "OK"
	'Response.End
	HPage = rs("web_site_URL")
	STitle = rs("site_title")
	If LCase(rs("jump_method")) = "redirect" Then
		'Response.Write HPage
		Response.Redirect HPage
		Response.End
	Else
		'Response.Write "OK"
		'Response.End
		'HPage = "index.asp"
		'STitle = "※網站空間租賃服務※《易尋網》web.ezfind.com.tw"
	End If
Else
	'Response.write "No"
	'Response.End	
	HPage = "index.asp"
	STitle = "擊石數位科技"
	Response.Redirect HPage
End If
%>
<head>
<title><%=STitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

  <frameset cols="1,*" frameborder="NO" border="0" framespacing="0">
    <frame src="space.htm" name="left" scrolling="NO" noresize>
    <frame src="<%=HPage%>" name="main">
  </frameset>
  <noframes>
  <body topmargin="0">
  <p>此網頁使用框架,但是您的瀏覽器並不支援.</p>
  </body>
  </noframes>
