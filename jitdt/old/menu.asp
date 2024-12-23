<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<div id="head">
  <table width="1000" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="200" valign="top"> 
        <div class="logo"><img src="images/menu_logo.jpg" width="301" height="72" /></div>
	  </td>
      <td valign="bottom"> 
        <div class="wrap">
			<ul id="nav">	
			<li><a href="default.asp"><img src="images/btn/home-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/home-2.png'" onmouseout="this.src='images/btn/home-1.png'" border="0" /></a></li>
			<li><a href="#"><img src="images/btn/sol-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/sol-2.png'" onmouseout="this.src='images/btn/sol-1.png'" border="0" /></a> 
			  <ul>
				<li><a href="app.asp">APP應用軟體</a></li>
				<li><a href="signage.asp">數位電子看板</a></li>
				<li><a href="signage2.asp">直立式廣告機</a></li>
				<li><a href="tv.asp">拼接電視牆</a></li>
				<li><a href="player.asp">智慧型放映系統</a></li>
				<li><a href="callno.asp">叫號系統</a></li>
				<li><a href="Arack.asp">移動式數位看板</a></li>
			  </ul>
			</li>
			<li><a href="#"><img src="images/btn/case-1.png" alt="" width="110" height="39" onmouseover="this.src='images/btn/case-2.png'" onmouseout="this.src='images/btn/case-1.png'" border="0" /></a> 
			  <ul>
				<li><a href="case1.asp">餐飲業顯示系統</a></li>
				<li><a href="case2.asp">移動式數位看板</a></li>
				<li><a href="case3.asp">互動投影放映</a></li>
				<li><a href="case4.asp">拼接電視系統</a></li>
				<li><a href="case5.asp">電子白板</a></li>
				<li><a href="case6.asp">互動導覽</a></li>
			  </ul>
			</li>
				
			<li><a href="service.asp"><img src="images/btn/serve-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/serve-2.png'" onmouseout="this.src='images/btn/serve-1.png'" border="0" /></a></li>
		
			<li><a href="about.asp"><img src="images/btn/about-1.png" alt="" width="110" height="39" id="menu_news" onmouseover="this.src='images/btn/about-2.png'" onmouseout="this.src='images/btn/about-1.png'" border="0" /></a></li>
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