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
				}
				$("#breadcrumb").html(html.join(''));
			}
		}
		
}