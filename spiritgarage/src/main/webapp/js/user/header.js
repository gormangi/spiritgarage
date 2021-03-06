$(document).ready(function(){
	
	headerFn.init();
	
	$("#categoryMenuList").on("click","li a",function(){
		headerFn.categoryListView($(this).data('category'));
	});
	
});

var headerFn = {
		
		init : function(){
			headerFn.highlightMenu();
			headerFn.getHeaderInfo();
			headerFn.getCategoryMenuList();
		},
		
		categoryListView : function(category){
			
			$("#categoryMoveForm").attr('action','/category');
			$("#categoryMoveForm").attr('method','post');
			$("#categoryMoveForm input").val(category);
			$("#categoryMoveForm").submit();
			
		},
		
		getCategoryMenuList : function(){
			
			$.ajax({
				url : '/category/getCategoryMenuList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#categoryMenuList").empty();
					var html = [];
					$.each(res,function(i,item){
						html.push('<li><a href="javascript:void(0);" data-category="'+item+'">'+item+'</a></li>');
					});
					$("#categoryMenuList").html(html.join(''));
					
					headerFn.appendMobileMenu();
				}
			});
			
		},
		
		highlightMenu : function(){
			var viewDivision = $("#viewDivition").val();
			$("#mainav .clear li").removeClass('active');
			
			if(viewDivision == 'mainPage'){
				$("#mainMove").addClass('active');
			}else if(viewDivision == 'reservationPage'){
				$("#reservationMove").addClass('active');
			}else if(viewDivision == 'categoryPage'){
				$("#categoryMove").addClass('active');
			}else if(viewDivision == 'noticePage'){
				$("#noticeMove").addClass('active');
			}else if(viewDivision == 'maintenanceHistoryPage'){
				$("#maintenanceHistoryMove").addClass('active');
			}else if(viewDivision == 'wayToComePage'){
				$("#wayToComeMove").addClass('active');
			}
			
		},
		
		getHeaderInfo : function(){
			
			var viewDivision = $("#viewDivition").val();
			
			if(viewDivision == 'mainPage'){
				$("#pageintro").show();
				$.ajax({
					url : '/main/headerInfo',
					dataType : 'json',
					type : 'post',
					success : function(res){
						$("#header_slide").empty();
						$("#header_slide_template").tmpl(res).appendTo("#header_slide");
						
						$('.basicslider').flexslider({
							animation: "slide",
							pauseOnHover: true,
							controlNav: true,
							directionNav: false,
							smoothHeight: true,
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					}
				});
			}else{
				$("#breadcrumb").show();
				
				var html = [];
				if(viewDivision == 'reservationPage'){
					html.push('<ul>');
					html.push('<li><a href="javascript:void(0);">Spiritgarage</a></li>');
					html.push('<li><a href="javascript:void(0);">예약</a></li>');
					html.push('</ui>');
				}else if(viewDivision == 'categoryPage'){
					html.push('<ul>');
					html.push('<li><a href="javascript:void(0);">Spiritgarage</a></li>');
					html.push('<li><a href="javascript:void(0);">'+$("#category").val()+'</a></li>');
					html.push('</ui>');
				}else if(viewDivision == 'noticePage'){
					html.push('<ul>');
					html.push('<li><a href="javascript:void(0);">Spiritgarage</a></li>');
					html.push('<li><a href="javascript:void(0);">공지</a></li>');
					html.push('</ui>');
				}else if(viewDivision == 'maintenanceHistoryPage'){
					html.push('<ul>');
					html.push('<li><a href="javascript:void(0);">Spiritgarage</a></li>');
					html.push('<li><a href="javascript:void(0);">정비이력</a></li>');
					html.push('</ui>');
				}else if(viewDivision == 'wayToComePage'){
					html.push('<ul>');
					html.push('<li><a href="javascript:void(0);">Spiritgarage</a></li>');
					html.push('<li><a href="javascript:void(0);">오시는길</a></li>');
					html.push('</ui>');
				}
				$("#breadcrumb").html(html.join(''));
			}
		},
		
		appendMobileMenu : function(){
			$('<form action="#"><select /></form>').appendTo("#mainav");
			$("<option />", {
				selected : "selected",
				value : "",
				text : "MENU"
			}).appendTo("#mainav select");
			$("#mainav a").each(function() {
				var e = $(this);
				if ($(e).parents("ul ul ul").length >= 1) {
					$("<option />", {
						value : e.attr("href"),
						text : "- - - " + e.text()
					}).appendTo("#mainav select")
				} else if ($(e).parents("ul ul").length >= 1) {
					$("<option />", {
						value : '/category?category='+e.text(),
						text : "- - " + e.text()
					}).appendTo("#mainav select")
				} else if ($(e).parents("ul").length >= 1) {
					$("<option />", {
						value : e.attr("href"),
						text : "" + e.text()
					}).appendTo("#mainav select")
				} else {
					$("<option />", {
						value : e.attr("href"),
						text : e.text()
					}).appendTo("#mainav select")
				}
			});
			$("#mainav select").change(function() {
				if ($(this).find("option:selected").val() !== "#") {
					window.location = $(this).find("option:selected").val()
				}
			});
		}
		
}