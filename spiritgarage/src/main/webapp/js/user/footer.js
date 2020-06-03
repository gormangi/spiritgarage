$(document).ready(function(){
	footerFn.getMainFooterContact();
});

var footerFn = {
		
		getMainFooterContact : function(){
			
			$.ajax({
				url : '/main/getMainFooterContact',
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					if(res.location){
						$("#main_footer_location").text(res.location.content);
					}else{
						$("#main_footer_location").text('(14961)경기도 시흥시 포동 20-19 스피릿개러지');
					}
					
					if(res.mobile){
						$("#main_footer_mobile").text(res.mobile.content);
						$("#main_footer_mobile").attr('href','tel:'+res.mobile.content);
					}else{
						$("#main_footer_mobile").text('010-7476-7884');
						$("#main_footer_mobile").attr('href','tel:010-7476-7884');
					}
					
					if(res.phone){
						$("#main_footer_phone").text(res.phone.content);
						$("#main_footer_phone").attr('href','tel:'+res.phone.content);
					}else{
						$("#main_footer_phone").text('031-314-8884');
						$("#main_footer_phone").attr('href','tel:031-314-8884');
					}
					
				}
			});
			
		}
		
}