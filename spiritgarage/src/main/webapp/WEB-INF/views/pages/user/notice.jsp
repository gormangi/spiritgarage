<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/notice.js"></script>

<style type="text/css">
#notice_list .comcont{
	height:75px; 
	text-overflow:ellipsis; 
	overflow:hidden; 
	white-space:nomal; 
	word-break:break-word; 
	display:-webkit-box; 
	-webkit-line-clamp:6; 
	-webkit-box-orient:vertical;
}
#notice_list li{cursor:pointer;}
</style>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			<div id="comments">
				<h2><i class="fa fa-exclamation-circle"></i>&nbsp;&nbsp;공지사항</h2>
				<ul id="notice_list">
				</ul>
			</div>
			<nav class="pagination">
				<ul id="notice_paging">
				</ul>
			</nav>
		</div>
		<div class="clear"></div>
	</main>
</div>

<form id="noticeContentViewForm">
	<input type="hidden" name="noticeSeq"/>
</form>

<script id="notice_list_template" type="text/x-jquery-tmpl">
{{each(i,item) list}}
<li data-notice-seq="\${item.noticeSeq}">
	<article>
		<header>
			<figure class="avatar"><img src="\${fileUrl}" style="width:100px;"></figure>
			<address>\${item.title} By <a href="javascript:void(0);">\${item.regMngrId}</a></address>
			<time>\${regDate}</time>
		</header>
		<div class="comcont">
			<p>\${item.content}</p>
		</div>
	</article>
</li>
{{/each}}
</script>