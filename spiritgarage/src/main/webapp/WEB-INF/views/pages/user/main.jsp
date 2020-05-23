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

<div class="wrapper bgded overlay" style="background-image: url('images/common/auto-repair-1954636_1920.jpg');">
	<section class="hoc container clear">
		<div class="btmspace-80 center">
			<h2 class="heading nospace">공지사항</h2>
		</div>
		<ul class="nospace group">
			<li class="one_quarter first">
				<article class="excerpt">
					<a href="#"><img src="images/demo/320x320.png" alt=""></a>
					<div class="excerpttxt">
						<h6 class="heading font-x1">Egestas consectetur</h6>
						<p>Rhoncus lectus sed sagittis dictum phasellus
							tristique&hellip;</p>
						<footer>
							<a class="btn" href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_quarter">
				<article class="excerpt">
					<a href="#"><img src="images/demo/320x320.png" alt=""></a>
					<div class="excerpttxt">
						<h6 class="heading font-x1">Aenean efficitur</h6>
						<p>Eu fringilla maximus purus orci faucibus metus
							faucibus&hellip;</p>
						<footer>
							<a class="btn" href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_quarter">
				<article class="excerpt">
					<a href="#"><img src="images/demo/320x320.png" alt=""></a>
					<div class="excerpttxt">
						<h6 class="heading font-x1">Blandit massa</h6>
						<p>Lectus eu varius curabitur vestibulum vehicula
							massa&hellip;</p>
						<footer>
							<a class="btn" href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_quarter">
				<article class="excerpt">
					<a href="#"><img src="images/demo/320x320.png" alt=""></a>
					<div class="excerpttxt">
						<h6 class="heading font-x1">Sagittis curabitur</h6>
						<p>Et eros eget ligula efficitur pulvinar et tortor
							morbi&hellip;</p>
						<footer>
							<a class="btn" href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
		</ul>
	</section>
</div>

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