<%
Function GetDB_old(Computer, UserID, Password, Db, source)
	Dim rs
	'Set rs = Server.CreateObject("ADODB.Recordset")
	On Error Resume Next
	rs = GetMdbRecordset(Db, source)
	If rs.EOF Then
		Response.Write "EMPTY"
	Else
		Response.Write "DB"
	End If
	set GetDB = rs
End Function

Function WeekDayColor(tDate)
	WeekgColor = "#000099"
	WeekHColor = "#FF0000"
	WeekNColor = "#FF0000"
	WeekEColor = "#009900"
	wn = weekday(tDate)
	select case wn
		case 1
			return_name = "<font color='" & WeekNColor & "'>(" & Right(WeekdayName(wn),1) & ")</font>"
		case 7
			return_name = "<font color='" & WeekEColor & "'>(" & Right(WeekdayName(wn),1) & ")</font>"
		case else
			return_name = "<font color='" & WeekgColor & "'>(" & Right(WeekdayName(wn),1) & ")</font>"
	end select
	'Response.Write return_name
	'Response.End
	WeekDayColor = return_name
End Function
'---------------------------------------------------
function Encoder(PWD)
	Serial = ""
	codeserial = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	For j = 1 to Len(PWD)
		C = Mid(PWD,j,1)
		k = inStr(codeserial,C)
		'Response.Write k & "<BR>"
		If k < 10 Then Serial = Serial & "0"
		Serial = Serial & cstr(k)
		'Response.Write Serial & "<BR>"	
	Next
	Encoder = Serial
end function
'---------------------------------------------------
function Decoder(OPWD)
	Dim Ws
	Serial = ""
	Old = -1
	codeserial = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	For j = 1 to Len(OPWD)\2
		Ws = (Mid(OPWD, 2*j-1, 1)-"0")* 10 + (Mid(OPWD, 2*j, 1)-"0")
		Serial = Serial & Mid(codeserial, Ws, 1)
	Next
	Decoder = Serial
end function
'---------------------------------------------------
function ENCO(OPWD)
	NPWD = ""
	For j = 1 to Len(OPWD)
		inc = 128 - ASC(Mid(OPWD, j, 1))
		NPWD = NPWD & cstr(inc \ 10) & cstr(inc mod 10)	
	Next
	ENCO = NPWD
end function
'---------------------------------------------------
function LIFELEVEL(STATUS)
	Select Case trim(STATUS)
		Case "ADMIN"
			STS = "系統管理員"
		Case "SALES"
			STS = "業務員"
		Case "USER"
			STS = "一般會員"
		Case "FOREVER"
			STS = "VIP會員"
		Case Else
			STS = "未知"
	End Select
	LIFELEVEL= STS
end function
'---------------------------------------------------
Function HEXTODEC(DIGIT)
	Num = 0
	For j = 1 to Len(DIGIT)
		W = Mid(DIGIT, j, 1)
		If ASC(W) > 64 Then
			dig = ASC(W) - 64 + 10
		Else
			dig = Cint(W)
		End If
		Num = Num * 16 + dig
	Next
	HEXTODEC = Num
End Function
'---------------------------------------------------
Function date24(NDate)
	If Ndate <> "" then
		temp = Year(NDate) & "/"
		If month(NDate) < 10 Then temp = temp & "0"
		temp = temp & Month(NDate) & "/"
		If day(NDate) < 10 Then temp = temp & "0"
		temp = temp & Day(NDate) & " "
		If hour(NDate) < 10 Then temp = temp & "0"
		temp = temp & hour(NDate) & ":"
		If minute(NDate) < 10 Then temp = temp & "0"
		temp = temp & Minute(NDate) & ":"
		If second(NDate) < 10 Then temp = temp & "0"
		temp = temp & second(NDate)
		'Response.Write temp
		If temp = "// ::" Then
			Date24 = "????"
		Else
			date24 = temp
		End If
	End If
End Function
'---------------------------------------------------
Function GetMdbConnection( FileName )
   Dim Provider, DBPath

   Provider = "Provider=Microsoft.Jet.OLEDB.4.0;"
   DBPath = "Data Source=" & Server.MapPath(FileName)
   Set GetMdbConnection = GetConnection( Provider & DBPath )
End Function

'---------------------------------------------------
Function GetSecuredMdbConnection( FileName, Password )
   Dim Provider, DBPath

   Provider = "Provider=Microsoft.Jet.OLEDB.4.0;"
   DBPath = "Data Source=" & Server.MapPath(FileName)
   Set GetSecuredMdbConnection = GetConnection( Provider & DBPath & ";Jet OLEDB:Database Password=" & Password )
End Function

'---------------------------------------------------
Function GetDbcConnection( FileName )
   Dim Driver, SourceType, DBPath

   Driver = "Driver={Microsoft Visual FoxPro Driver};"
   SourceType = "SourceType=DBC;"
   DBPath = "SourceDB=" & Server.MapPath( FileName )
   Set GetDbcConnection = GetConnection( Driver & SourceType & DBPath )
End Function

'---------------------------------------------------
Function GetDbfConnection( Directory )
   Dim Driver, SourceType, DBPath

   Driver = "Driver={Microsoft Visual FoxPro Driver};"
   SourceType = "SourceType=DBF;"
   DBPath = "SourceDB=" & Server.MapPath( Directory )
   Set GetDbfConnection = GetConnection( Driver & SourceType & DBPath )
End Function

'---------------------------------------------------
Function GetExcelConnection( FileName )
   Dim Driver, DBPath

   Driver = "Driver={Microsoft Excel Driver (*.xls)};"
   DBPath = "DBQ=" & FileName
   Set GetExcelConnection = GetConnection( Driver & "ReadOnly=0;" & DBPath )
End Function

'---------------------------------------------------
Function GetTextConnection( Directory )
   Dim Driver, DBPath

   Driver = "Driver={Microsoft Text Driver (*.txt; *.csv)};"
   DBPath = "DBQ=" & Server.MapPath( Directory )
   Set GetTextConnection = GetConnection( Driver & DBPath )
End Function

'---------------------------------------------------
Function GetSQLServerConnection( Computer, UserID, Password, Db )
   Dim Params, conn
   
	Set GetSQLServerConnection = Nothing
	'Params = "data source=" & Computer
	'Params = Params & ";initial catalog=" & Db
	'Params = params & ";integrated security=SSPI"
	'Params = params & ";persist security info=False"
	'Params = Params & ";workstation id=NBW2000;packet size=4096"
	'Response.End
 	Params = "Provider=SQLOLEDB.1"
 	Params = Params & ";Data Source=" & Computer
 	Params = Params & ";User ID=" & UserID
 	Params = Params & ";Password=" & Password
	Params = Params & ";Initial Catalog=" & Db
	'Response.Write Params
	 
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Params
	Set GetSQLServerConnection = conn
End Function

Function GetDB(Computer, UserID, Password, Db, source)
	set GetDB = GetMdbRecordset(Db, source)
End Function

'---------------------------------------------------
Function GetMdbRecordset( FileName, Source )
   Set GetMdbRecordset = GetMdbRs( FileName, Source, 2, "" )
End Function

'---------------------------------------------------
Function GetMdbStaticRecordset( FileName, Source )
   Set GetMdbStaticRecordset = GetMdbRs( FileName, Source, 3, "" )
End Function

'---------------------------------------------------
Function GetSecuredMdbRecordset( FileName, Source, Password )
   Set GetSecuredMdbRecordset = GetMdbRs( FileName, Source, 2, Password )
End Function

'---------------------------------------------------
Function GetSecuredMdbStaticRecordset( FileName, Source, Password )
   Set GetSecuredMdbStaticRecordset = GetMdbRs( FileName, Source, 3, Password )
End Function

'---------------------------------------------------
Function GetDbfRecordset( Directory, SQL )
   Set GetDbfRecordset = GetOtherRs( "Dbf", Directory, SQL, 2 )
End Function

'---------------------------------------------------
Function GetDbfStaticRecordset( Directory, SQL )
   Set GetDbfStaticRecordset = GetOtherRs( "Dbf", Directory, SQL, 3 )
End Function

'---------------------------------------------------
Function GetDbcRecordset( FileName, SQL )
   Set GetDbcRecordset = GetOtherRs( "Dbc", FileName, SQL, 2 )
End Function

'---------------------------------------------------
Function GetDbcStaticRecordset( FileName, SQL )
   Set GetDbcStaticRecordset = GetOtherRs( "Dbc", FileName, SQL, 3 )
End Function

'---------------------------------------------------
Function GetExcelRecordset( FileName, SQL )
   Set GetExcelRecordset = GetOtherRs( "Excel", FileName, SQL, 2 )
End Function

'---------------------------------------------------
Function GetExcelStaticRecordset( FileName, SQL )
   Set GetExcelStaticRecordset = GetOtherRs( "Excel", FileName, SQL, 3 )
End Function

'---------------------------------------------------
Function GetTextRecordset( Directory, SQL )
   Set GetTextRecordset = GetOtherRs( "Text", Directory, SQL, 2 )
End Function

'---------------------------------------------------
Function GetTextStaticRecordset( Directory, SQL )
   Set GetTextStaticRecordset = GetOtherRs( "Text", Directory, SQL, 3 )
End Function

'---------------------------------------------------
Function GetSQLServerRecordset( conn, source )
   Dim rs

   Set rs = Server.CreateObject("ADODB.Recordset")
   rs.Open source, conn, 2, 2
   Set GetSQLServerRecordset = rs
End Function

'---------------------------------------------------
Function GetSQLServerStaticRecordset( conn, source )
   Dim rs

   Set rs = Server.CreateObject("ADODB.Recordset")
   rs.Open source, conn, 3, 2
   Set GetSQLServerStaticRecordset = rs
End Function

'---------------------------------------------------
Function GetConnection( Param )
   Dim conn 

   On Error Resume Next
   Set GetConnection = Nothing
   Set conn = Server.CreateObject("ADODB.Connection")
   If Err.Number <> 0 Then Exit Function

   conn.Open Param
   If Err.Number <> 0 Then Exit Function
   Set GetConnection = conn
End Function

'---------------------------------------------------
Function GetMdbRs( FileName, Source, Cursor, Password )
   Dim conn, rs

   On Error Resume Next
   Set GetMdbRs = Nothing
   If Len(Password) = 0 Then
       Set conn = GetMdbConnection( FileName )
   Else
       Set conn = GetSecuredMdbConnection( FileName, Password )
   End If
   If conn Is Nothing Then Exit Function

   Set rs = Server.CreateObject("ADODB.Recordset")
   If Err.Number <> 0 Then Exit Function

   rs.Open source, conn, Cursor, 2
   If Err.Number <> 0 Then Exit Function
   Set GetMdbRs = rs
End Function

'---------------------------------------------------
Function GetOtherRs( DataType, Path, SQL, Cursor )
   Dim conn, rs
   On Error Resume Next
   Set GetOtherRs = Nothing

   Select Case DataType
      Case "Dbf"
         Set conn = GetDbfConnection( Path )
      Case "Dbc"
         Set conn = GetDbcConnection( Path )
      Case "Excel"
         Set conn = GetExcelConnection( Path )
      Case "Text"
         Set conn = GetTextConnection( Path )
   End Select
   If conn Is Nothing Then Exit Function

   Set rs = Server.CreateObject("ADODB.Recordset")
   If Err.Number <> 0 Then Exit Function

   rs.Open SQL, conn, Cursor, 2
   If Err.Number <> 0 Then Exit Function
   Set GetOtherRs = rs
End Function

'---------------------------------------------------
Function GetSQLServerRs( Computer, UserID, Password, Db, source, Cursor )
   Dim conn, rs

   On Error Resume Next
   Set GetSQLServerRs = Nothing
   Set conn = GetSQLServerConnection( Computer, UserID, Password, Db )
   If conn Is Nothing Then Exit Function

   Set rs = Server.CreateObject("ADODB.Recordset")
   If Err.Number <> 0 Then Exit Function

   rs.Open source, conn, Cursor, 2
   If Err.Number <> 0 Then Exit Function
   Set GetSQLServerRs = rs
End Function

'---------------------------------------------------
Function GetOraServerRecordset( Service, UserID, Password, source)
   Dim Params, conn
   Dim rs
   
   Params = Service
   Params = Params & "," & UserID
   Params = Params & "," & Password
   Set conn = Server.CreateObject("ADODB.Connection")
   conn.Open Params
   Set rs = Server.CreateObject("ADODB.Recordset")
   rs.Open source, conn, 2, 2
   Set GetOraServerRecordset = rs
End Function

'---------------------------------------------------
Function datestamp(NDate)
	If Ndate <> "" then
		temp = Year(NDate) & "-"
		If month(NDate) < 10 Then temp = temp & "0"
		temp = temp & Month(NDate) & "-"
		If day(NDate) < 10 Then temp = temp & "0"
		temp = temp & Day(NDate)
		datestamp = temp
	End If
End Function
%>