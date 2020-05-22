$(document).ready(function(){
	
	headerFn.init();
	
});

var headerFn = {
		
		init : function(){
			headerFn.highlightMenu();
			headerFn.getHeaderInfo();
		},
		
		highlightMenu : function(){
			var viewDivision = $("#viewDivition").val();
			
			$("#mainav .clear li").removeClass('active');
			
			if(viewDivision == 'mainPage'){
				$("#mainMove").addClass('active');
			}else if(viewDivision == 'reservationPage'){
				$("#reservationMove").addClass('active');
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
			}
		}
		
}