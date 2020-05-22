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

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="center btmspace-80">
			<h2 class="heading nospace">Pellentesque mattis euismod</h2>
			<p class="nospace">Semper donec commodo est at risus bibendum id
				hendrerit erat rhoncus duis varius</p>
		</div>
		<ul class="nospace group">
			<li class="one_half first btmspace-30">
				<article class="group">
					<div class="one_half first">
						<a href="#"><img src="images/demo/320x240.png" alt=""></a>
					</div>
					<div class="one_half">
						<h3 class="heading font-x1">Vestibulum risus donec</h3>
						<p>Dapibus curabitur consectetur sapien eget porttitor
							accumsan turpis dui commodo metus in tristique odio sem
							eu&hellip;</p>
						<footer>
							<a href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_half btmspace-30">
				<article class="group">
					<div class="one_half first">
						<a href="#"><img src="images/demo/320x240.png" alt=""></a>
					</div>
					<div class="one_half">
						<h3 class="heading font-x1">Varius ac felis eget</h3>
						<p>Sociosqu litora torquent per conubia nostra per inceptos
							himenaeos curabitur non libero quis ligula congue quis&hellip;</p>
						<footer>
							<a href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_half first btmspace-30">
				<article class="group">
					<div class="one_half first">
						<a href="#"><img src="images/demo/320x240.png" alt=""></a>
					</div>
					<div class="one_half">
						<h3 class="heading font-x1">Quam proin nisl magna</h3>
						<p>Dignissim id leo quis tempor sollicitudin purus proin sed
							sem ex morbi consequat ipsum eu justo porttitor aliquam&hellip;</p>
						<footer>
							<a href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
			<li class="one_half btmspace-30">
				<article class="group">
					<div class="one_half first">
						<a href="#"><img src="images/demo/320x240.png" alt=""></a>
					</div>
					<div class="one_half">
						<h3 class="heading font-x1">Sollicitudin aptent</h3>
						<p>Taciti sociosqu ad litora torquent per conubia nostra per
							inceptos himenaeos proin nulla nisi id pharetra nec
							ornare&hellip;</p>
						<footer>
							<a href="#">Read More &raquo;</a>
						</footer>
					</div>
				</article>
			</li>
		</ul>
		<!-- / main body -->
		<div class="clear"></div>
	</main>
</div>

<div class="wrapper bgded overlay" style="background-image: url('images/common/auto-repair-1954636_1920.jpg');">
	<section class="hoc container clear">
		<div class="btmspace-80 center">
			<h2 class="heading nospace">Semper turpis eget</h2>
			<p class="nospace">Maximus arcu dictum a nunc molestie odio sit
				amet ipsum</p>
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