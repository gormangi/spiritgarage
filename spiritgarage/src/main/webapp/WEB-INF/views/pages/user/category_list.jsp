<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/category_list.js"></script>

<style type="text/css">
#category_list li{cursor:pointer;}
</style>

<input type="hidden" id="category" value="${category }" />

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			<div id="comments">
				<h2><i class="fa fa-car"></i>&nbsp;&nbsp;${category }</h2>
				<ul id="category_list">
				</ul>
			</div>
			<nav class="pagination">
				<ul id="category_paging">
				</ul>
			</nav>
		</div>
		<div class="clear"></div>
	</main>
</div>

<script id="category_list_template" type="text/x-jquery-tmpl">
{{each(i,item) list}}
<li data-link="\${item.link}">
	<article>
		<header>
			<address>\${item.title}</address>
			<time>\${pubDate}</time>
		</header>
		<div class="comcont">
			<p>\${item.description}</p>
		</div>
	</article>
</li>
{{/each}}
</script>