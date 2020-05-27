$(document).ready(function(){
	fn.noticeContentView();
});

var fn = {
		
		noticeContentView : function(){
			
			var noticeSeq = $("#noticeSeq").val();
			
			$.ajax({
				url : '/notice/getNoticeInfo',
				data : {noticeSeq : noticeSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#title").text(res.title);
					$("#reg").text(res.regDate + ' ' + res.regMngrId);
					$("#content").html(res.content);
				}
			});
			
		}
		
}