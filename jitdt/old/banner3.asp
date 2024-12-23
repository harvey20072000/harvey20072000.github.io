<%
Set fso = CreateObject("Scripting.FileSystemObject")
dmpath = WEBPATH & "\banner\"

Set f = fso.GetFolder(dmpath)
Set fc = f.Files
For Each f1 in fc
  	If Lcase(fso.GetExtensionName(dmpath & f1.name)) = "jpg" Or Lcase(fso.GetExtensionName(dmpath & f1.name)) = "gif" Or Lcase(fso.GetExtensionName(dmpath & f1.name)) = "bmp" Then
    	s = s & f1.name 
   		s = s &  "<BR>"
		initpic = f1.name
	End If
Next
'Response.Write "圖片<BR>" & s
'Response.End

sl = split(s,"<BR>",-1,1)
%> 
<style type="text/css">
 
#slideshow { margin: 0px; left: 0px }
.slideshow img { padding: 0px; border: 1px solid #ccc; background-color: #eee; }

#nav a:focus { outline: none; }
#nav img { border: none; display: block }
</style>
<!-- include jQuery library -->
<script type="text/javascript" src="./js/jquery-1.5.1.min.js"></script>
<!-- include Cycle plugin -->
<script type="text/javascript" src="./js/jquery.cycle.all.latest.js"></script>
<script type="text/javascript"> 
$(function() {
    $('#slideshow').cycle({
        fx:     'fade',
        speed:  2000,
        timeout: 2000,
        pager:  '#nav',
        pagerAnchorBuilder: function(idx, slide) {
            // return sel string for existing anchor
            return '#nav span:eq(' + (idx) + ') a';
        }
    });
 
    $('#direct').click(function() {
        $('#nav span:eq(2) a').triggerHandler('click');
        return false;
    });
    
});
 
</script> 
      <div id="slideshow" class="pics">			   
<%
If UBound(sl) > 0 Then
	nEnd = UBound(sl)
	For n = 0 To nEnd - 1
%>				  
				  <img src="banner/<%=Trim(sl(n))%>" width="999" height="426" border="0"/>
					
<%
	Next
Else
%>
				  <img src="images/default.jpg" width="999" height="426" border="0"/>
<%
End If
%>
	      </div>
        
      <div id="banner" style="position:absolute; width:770px; height:36px; z-index:8; left: 298px; top: 480px; visibility: hidden;"> 
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
<%
If UBound(sl) > 0 Then
	nEnd = UBound(sl)
	For k = nEnd to 9
		Response.Write "<td width='10%'>&nbsp;</td>"
	Next
	For n = 0 To nEnd - 1
%>
					
            <td width="10%" align="right"> <span><a href="#"><img src="banner/<%=Trim(sl(n))%>" width="61" height="27" border="0"/></a></span>	
            </td>
<%
	Next
End If
%>
                  </tr>
                </table>		
		
      </div>