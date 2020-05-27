$(document).ready(function(){
	fn.init();
	
	$("#notice_area").on("click","a",function(){
		fn.noticeContentView($(this).closest('li').data('noticeSeq'));
	});
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
					$.each(res.res,function(i , item){
						item.content = item.content.replace(/(<([^>]+)>)/gi, "");
					});
					
					if(res.res.length > 0){
						$("#notice_area").empty();
						$("#notice_area_template").tmpl(res).appendTo("#notice_area");
					}else{
						$("#notice_area").hide();
					}
				}
			});
			
		},
		
		noticeContentView : function(noticeSeq){
			
			var noticeContentViewForm = $("#noticeContentViewForm");
			$("#noticeContentViewForm input").val(noticeSeq);
			noticeContentViewForm.attr('action','/noticeContentView');
			noticeContentViewForm.attr('method','post');
			noticeContentViewForm.submit();
			
		}
}