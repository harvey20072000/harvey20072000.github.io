<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="zh-tw">
<head>
<meta name="Generator" content="EditPlus" />
<meta name="Author" content="男丁格爾's 脫殼玩" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>彩色動態伸縮子選單</title>
<style type="text/css"> 
	body {
		margin: 0;
	}
	#menu-wrapper .main-menu , #menu-wrapper .sub-menu {
		margin: 0 auto;
		width: 980px;
	}
	#menu-wrapper ul, #menu-wrapper ul li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	.main-menu ul li, .sub-menu ul li {
		float: left;
	}
	.main-menu ul li a {
		color: #000;
		display: block;
		margin-right: 50px;
		padding: 5px 5px 5px 0;
		text-decoration: none;
	}
	.sub-menu-wrapper {
		height: 28px;
		clear: left;
		background-color: #f90;
		border-top: 5px solid #f90;	/* 預設使用跟 .c1 一樣的顏色 */
	}
	.sub-menu {
		height: 28px;
		position: relative;
		overflow: hidden;
	}
	.sub-menu ul {
		position: absolute;
	}
	.sub-menu ul li a {
		color: #fff;
		display: block;
		margin-right: 20px;
		padding-top: 2px;
		text-decoration: none;
	}
	/* 自訂子選單的位置 */
	.sub-menu .sub-memu-1 { left: 50px; }
	.sub-menu .sub-memu-2 { left: 170px; }
	.sub-menu .sub-memu-3 { left: 265px; }
	/* 自訂每一個選單的顏色 */
	.main-menu ul li.m1 span, .main-menu ul li.m1 a.selected { color: #f90; }
	.main-menu ul li.m2 span, .main-menu ul li.m2 a.selected { color: #09c; }
	.main-menu ul li.m3 span, .main-menu ul li.m3 a.selected { color: #3c0; }
	.main-menu ul li.m4 span, .main-menu ul li.m4 a.selected { color: #f6f; }
</style>
<script type="text/javascript"> 
	$(function(){
		// 先取得相關選單元素及高度
		var $menuWrapper = $('#menu-wrapper'), 
			$subMenuWwrapper = $menuWrapper.find('.sub-menu-wrapper').add($menuWrapper.find('.sub-menu')), 
			_height = $subMenuWwrapper.height(), 
			_animateSpeed = 200;
		
		// 先把 $subMenuWwrapper 的高度歸 0
		// 並把 .sub-menu ul 先往上移動隱藏
		var $subMenu = $subMenuWwrapper.height(0).find('.sub-menu ul').css({
			top: _height * -1
		});
		
		// 當滑鼠移入到 .main-menu ul li a 上時
		$('.main-menu ul li a').mouseover(function(){
			// 先取出被滑鼠移入的選單
			// 並取得該選單中第一個 span 的文字顏色
			var $this = $(this), 
				$color = $this.find('span').css('color'), 
				_no = $this.parent().index();
			
			// 改變 $subMenuWwrapper 的顏色為 $color 並展開高度
			$subMenuWwrapper.css({
				backgroundColor: $color, 
				borderTopColor: $color
			}).stop().animate({
				height: _height
			}, _animateSpeed);
			
			// 移動相對應的子選單
			$subMenu.eq(_no).stop().animate({
				top: 0
			}, _animateSpeed).siblings().stop().animate({
				top: _height * -1
			}, _animateSpeed);
			
			// 讓被滑鼠移入的選單加上指定的效果
			$this.addClass('selected').parent().siblings().find('a.selected').removeClass('selected');
 
			return false;
		});
		
		// 當滑鼠移出 $menuWrapper 後把 $subMenuWwrapper 的高度歸 0
		$menuWrapper.mouseleave(function(){
			$subMenuWwrapper.stop().animate({
				height: 0
			}, _animateSpeed);
		});
	});
</script>
</head>
 
<body>
	<div id="menu-wrapper">
		<div class="main-menu-wrapper">
			<div class="main-menu">
				<ul>
					<li><a href="#"><span>j</span>Query</a></li>
					<li><a href="#"><span>A</span>ndroid</a></li>
					<li class="m1"><a href="#"><span>W</span>ordPress</a></li>
					<li class="m2"><a href="#"><span>O</span>penCart</a></li>
				</ul>
			</div>
		</div>
		<div class="sub-menu-wrapper">
			
    <div class="sub-menu"> 
      <ul class="sub-memu-0">
        <li><a href="#">jQuery 應用</a></li>
        <li><a href="#">jQuery 外掛</a></li>
        <li><a href="#">jQuery 技巧</a></li>
        <li><a href="#">jQuery 資源</a></li>
      </ul>
      <ul class="sub-memu-1">
        <li><a href="#">Android 程式片段</a></li>
        <li><a href="#">推薦 APP</a></li>
        <li><a href="#">新機介紹</a></li>
      </ul>
    </div>
		</div>
	</div>
</body>
</html>
