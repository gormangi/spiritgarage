$(document).ready(function(){
	footerFn.getMainFooter();
});

var footerFn = {
		
		getMainFooter : function(){
			
			$.ajax({
				url : '/main/getMainFooter',
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
					
					if(res.openhour){
						$("#main_footer_openhour").html('<pre>'+res.openhour.content+'</pre>');
					}else{
						$("#main_footer_openhour").html('월 ~ 토 09:30 - 20:00<br/>일요일은 예약 고객에 한하여 작업합니다');
					}
					
					if(res.mainfield){
						$("#main_footer_mainfield").html('<pre>'+res.mainfield.content+'</pre>');
					}else{
						$("#main_footer_mainfield").html('경정비 | 합성오일 | 휠타이어<br/>블랙박스 | 썬팅 | 네비게이션 | 옵션설치');
					}
					
				}
			});
			
		}
		
}