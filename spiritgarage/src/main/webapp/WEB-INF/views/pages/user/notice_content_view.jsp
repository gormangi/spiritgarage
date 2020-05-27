<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/notice_content_view.js"></script>

<style type="text/css">
.btn{margin-top:20px;}
</style>

<input type="hidden" value="${noticeSeq }" id="noticeSeq"/>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			<div class="center btmspace-30">
				<h2 class="heading nospace" id="title"></h2>
				<p class="nospace" id="reg"></p>
			</div>
			<div id="content"></div>
			<a class="btn" href="javascript:location.href='/notice'">목록으로</a>
		</div>
		<div class="clear"></div>
	</main>
</div>