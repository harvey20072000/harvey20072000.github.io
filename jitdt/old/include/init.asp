<%
'$$$$$$$$$$$$$$$$$$$
'$$ 配色定義
'$$$$$$$$$$$$$$$$$$$
Main_Color = "#CCCC99"
Sub_Color = "#F5F1C5"
Main_Font = "#9A9A56"
Sub_Font = "#336699"
'###################
'## 資料庫初始設定
'###################
WEBPATH = Request.ServerVariables("APPL_PHYSICAL_PATH")
HOMEPATH = Server.MapPath("/")
Myself = Request.ServerVariables("PATH_INFO")
RemoteIP = Request.ServerVariables("REMOTE_ADDR")
Params = Request.ServerVariables("QUERY_STRING")
HOST = Request.ServerVariables("Http_Host")

MYWEB = ""
MYHOST = Request.ServerVariables("HOST_ADDR")
HOSTID = ""
PWD = ""

'### 2015/9/10 新增墨比亞 ####
DB = MYWEB & "/webhome2013.mdb"
DBPWD = "ezfind"

'------------------------------
SLDB = MYWEB & "/mydb/#sales.mdb"
EDB = MYWEB & "/mydb/#ihealth.mdb"
NEWSDB = MYWEB & "/mydb/#news.mdb"
FLOWDB = MYWEB & "/mydb/#flow.mdb"
ZONE = MYWEB & "/mydb/#zone.mdb"
FBDB = MYWEB & "/mydb/#board.mdb"

'#### 購物車資料庫 ####
HRDB = MYWEB & "/mydb/#hypertensive.mdb"
WRDB = MYWEB & "/mydb/#weight.mdb"
HIDB = MYWEB & "/mydb/#history.mdb"
'########################
'## 查詢區域
'########################
Dim QueryArea(2)
QueryArea(0) = "最新消息"
QueryArea(1) = "健康知識"

'########################
'## 跑馬燈文字
'########################
StatusWord = "歡迎光臨◎◎◎Chi-Link個人健康管理系統◎◎◎"
'########################
'## 郵件處理預設值
'########################
'systemMailer = "expoy042@ms11.hinet.net"
'SMTPServer = "ms11.hinet.net"
systemMailer = "health@chi-link.com.tw"
MailPassword = "23868668"
SMTPServer = "chi-link.com.tw"

SystemManagerMail = "almustafawork@gmail.com;inger1023@gmail.com"
'RepairMailList = "tonchin@ms.usi.com.tw;yk_ho@ms.usi.com.tw"
'FoodMailList = "seven@ms.usi.com.tw;yk_ho@ms.usi.com.tw"
'MemberMailList = "joycelai@ms.usi.com.tw"

ReplyAccountPassword = "[國信保全健康自主系統] 帳號密碼寄發"
MemberRegister = "[國信保全健康自主系統] 帳號審核通知書"
MemberMoreRegister = "[國信保全健康自主系統] 帳號補送審核通知書"
MemberReply = "[國信保全健康自主系統] 帳號審核通過"
MemberReason = "[國信保全健康自主系統] 帳號審核未通過"
ContactUs = "[國信保全健康自主系統] 聯絡我們通知"

Function dateStamp(NDate)
	If Ndate <> "" then
		temp = Year(NDate) & "-"
		If month(NDate) < 10 Then temp = temp & "0"
		temp = temp & Month(NDate) & "-"
		If day(NDate) < 10 Then temp = temp & "0"
		temp = temp & Day(NDate)
		'Response.Write temp
		If temp = "--" Then
			dateStamp = "????"
		Else
			dateStamp = temp
		End If
	End If
End Function

Function MyCom(comName)
	Select Case comName
	Case "USI"
		MyCom = "環電"
	Case "UG"
		MyCom = "環鴻"
	Case Else
		MyCom = "----"
	End Select
End Function

Function ShowPD(MYID)
	'Response.Write "PID=" & MYID
	If MYID <> "" Then
		If Cint(Session("HLevel")) >= 90 Then
			If MYID = "11010101010101010101" Then
				ShowPD = "未建立"
			Else
				tempPD = Decoder(MYID)
				ShowPD = Left(tempPD,2) & "****" & Right(tempPD,4)
				'ShowPD = Base64decode(MYID)
			End If
		Else
			If MYID = "11010101010101010101" Then
				ShowPD = "未建立"
			Else
				ShowPD = "----------"
			End If
		End If
	Else 
		ShowPD = "??????????"
	End If
End Function
%>