<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<div id="head">
  <table width="1000" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="200" valign="top"> 
        <div class="logo"> <a href="default.asp"><img src="images/logo.gif" alt="擊石數位科技" width="300" height="72" border="0" /></a> 
        </div>
	  </td>
      <td valign="bottom"> 
        <div class="wrap">
			<ul id="nav">	
			<li><a href="about.asp"><img src="images/btn/about-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/about-2.png'" onmouseout="this.src='images/btn/about-1.png'" border="0" /></a></li>
			<li><a href="#"><img src="images/btn/sol-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/sol-2.png'" onmouseout="this.src='images/btn/sol-1.png'" border="0" /></a> 
              <ul>
                <li><a href="app.asp">APP應用軟體</a></li>
                <li><a href="signage.asp">數位電子看板</a></li>
                <li><a href="callno.asp">雲端叫號系統</a></li>
                <li><a href="interfloor.asp">互動投影系統</a></li>
              </ul>
            </li>
			<li><a href="#"><img src="images/btn/case-1.png" alt="" width="110" height="39" onmouseover="this.src='images/btn/case-2.png'" onmouseout="this.src='images/btn/case-1.png'" border="0" /></a> 
              <ul>
                <li><a href="case1.asp">餐飲業顯示系統</a></li>
                <li><a href="case2.asp">博物館APP導覽</a></li>
                <li><a href="case3.asp">互動投影放映</a></li>
                <li><a href="case4.asp">醫療健康管理系統</a></li>
                <li><a href="case5.asp">雲端資訊整合</a></li>
              </ul>
            </li>
				
			<li><a href="service.asp"><img src="images/btn/serve-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/serve-2.png'" onmouseout="this.src='images/btn/serve-1.png'" border="0" /></a></li>
		
			<li><a href="default.asp"><img src="images/btn/home-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/home-2.png'" onmouseout="this.src='images/btn/home-1.png'" border="0" /></a></li>
			</ul>
		</div>
	  </td>
    </tr>
  </table>
</div> 

<script type="text/javascript"> 
$(document).ready(function() {	
	$('#nav li').hover(function() {
		$('ul', this).slideDown(200);
		$(this).children('a:first').addClass("hov");
	}, function() {
		$('ul', this).slideUp(100);
		$(this).children('a:first').removeClass("hov");		
	});
});
</script>