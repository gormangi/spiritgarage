<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/main.js"></script>

<style type="text/css">
.wrapper .container ul li p{
	height:130px; 
	text-overflow:ellipsis; 
	overflow:hidden; 
	white-space:nomal; 
	word-break:break-word; 
	display:-webkit-box; 
	-webkit-line-clamp:6; 
	-webkit-box-orient:vertical;
}
</style>

<div id="blog_area">
</div>

<div class="wrapper bgded overlay" id="notice_area" style="background-image: url('images/common/auto-repair-1954636_1920.jpg');">
</div>

<form id="noticeContentViewForm">
	<input type="hidden" name="noticeSeq"/>
</form>

<script id="blog_area_template" type="text/x-jquery-tmpl">
{{if res.length > 0}}
	{{each(i,item) res}}
		<div class="wrapper {{if i % 2 == 0}}row4{{else}}row3{{/if}}">
			<section class="hoc container clear">
				<div class="center btmspace-80">
					<h2 class="heading nospace">\${categoryNm}</h2>
				</div>
				<ul class="nospace group services">
					{{each(j,itm) categoryList}}
						<li class="one_third{{if j % 3 == 0}} first{{/if}}">
							<article>
								<a href="\${link}" target="_blank"><i {{if i % 2 != 0}}style="color:#222222"{{/if}} class="fa fa-share-alt"></i></a>
								<h6 class="heading">\${title}</h6>
								<p>\${description}</p>
								<footer>
									<a href="\${link}" target="_blank">Read More &raquo;</a>
								</footer>
							</article>
						</li>
					{{/each}}
				</ul>
				<div class="clear"></div>
			</section>
		</div>
	{{/each}}
{{/if}}
</script>

<script id="notice_area_template" type="text/x-jquery-tmpl">
<section class="hoc container clear">
	<div class="btmspace-80 center">
		<h2 class="heading nospace">공지사항</h2>
	</div>
	<ul class="nospace group">
		{{each(i,item) res}}
			<li class="one_quarter {{if i == 0}}first{{/if}}" data-notice-seq="\${item.noticeSeq}">
				<article class="excerpt">
					<a href="javascript:void(0);"><img src="\${item.fileUrl}" alt=""></a>
					<div class="excerpttxt">
						<h6 class="heading font-x1">\${item.title}</h6>
						<p>\${item.content}</p>
						<footer>
							<a class="btn" href="javascript:void(0);">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
		{{/each}}
	</ul>
</section>
</script>