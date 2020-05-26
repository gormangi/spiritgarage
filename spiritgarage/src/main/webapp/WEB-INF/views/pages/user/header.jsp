<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/js/user/header.js"></script>
<div class="bgded overlay" style="background-image: url('images/common/engine-2682239_1920.jpg');">
	<div class="wrapper row1">
		<header id="header" class="hoc clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="/"><img src="images/user/spiritgarage.gif" style="width:40px;"/>&nbsp;&nbsp;&nbsp;SPIRIT GARAGE</a>
				</h1>
			</div>
			<nav id="mainav" class="fl_right">
				<ul class="clear">
					<li id="mainMove"><a href="/">Home</a></li>
					<li id="reservationMove"><a href="/reservation">예약</a></li>
					<li><a class="drop" href="#">카테고리</a>
						<ul>
							<li><a href="pages/gallery.html">Gallery</a></li>
							<li><a href="pages/full-width.html">Full Width</a></li>
							<li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
							<li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
							<li><a href="pages/basic-grid.html">Basic Grid</a></li>
						</ul></li>
					<li><a class="drop" href="#">Dropdown</a>
						<ul>
							<li><a href="#">Level 2</a></li>
							<li><a class="drop" href="#">Level 2 + Drop</a>
								<ul>
									<li><a href="#">Level 3</a></li>
									<li><a href="#">Level 3</a></li>
									<li><a href="#">Level 3</a></li>
								</ul></li>
							<li><a href="#">Level 2</a></li>
						</ul></li>
					<li><a href="#">Link Text</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div id="pageintro" class="hoc clear" style="display:none">
		<div class="flexslider basicslider">
			<ul class="slides" id="header_slide">
			</ul>
		</div>
	</div>
	<div id="breadcrumb" class="hoc clear" style="display:none">
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">Lorem</a></li>
			<li><a href="#">Ipsum</a></li>
			<li><a href="#">Dolor</a></li>
		</ul>
	</div>
	
</div>
<input type="hidden" id="viewDivition" value="${viewDivision }"/>

<script id="header_slide_template" type="text/x-jquery-tmpl">
	<li>
		<article>
			<p class="heading">\${title}</p>
			<h2 class="heading">프리미엄 카 케어센터 스피릿 개러지</h2>
			<p>\${description}</p>
		</article>
	</li>
	<li>
		<article>
			<p class="heading">TITLE TEST 입니다</p>
			<h2 class="heading">TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다</h2>
			<p>TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다</p>
			<footer>
				<ul class="nospace inline pushright">
					<li><a class="btn" href="#">TEST 버튼 1</a></li>
					<li><a class="btn inverse" href="#">TEST 버튼 2</a></li>
				</ul>
			</footer>
		</article>
	</li>
	<li>
		<article>
			<p class="heading">TITLE TEST 입니다</p>
			<h2 class="heading">TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다</h2>
			<p>TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다 TITLE TEST 입니다</p>
			<footer>
				<ul class="nospace inline pushright">
					<li><a class="btn" href="#">DUMY 버튼 1</a></li>
					<li><a class="btn inverse" href="#">DUMY 버튼 2</a></li>
				</ul>
			</footer>
		</article>
	</li>
</script>