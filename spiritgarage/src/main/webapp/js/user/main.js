$(document).ready(function(){
	fn.init();
});

var fn = {
		init : function(){
			fn.getBlogInfoList();
			fn.getMainNoticeList();
		},
		
		getBlogInfoList : function(){
			
			$.ajax({
				url : '/main/getBlogInfoList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#blog_area").empty();
					$("#blog_area_template").tmpl(res).appendTo("#blog_area");
				}
			});
			
		},
		
		getMainNoticeList : function(){
			
			$.ajax({
				url : '/main/getMainNoticeList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.res.length > 0){
						$("#notice_area").empty();
						$("#notice_area_template").tmpl(res).appendTo("#notice_area");
					}else{
						$("#notice_area").hide();
					}
				}
			});
			
		}
}