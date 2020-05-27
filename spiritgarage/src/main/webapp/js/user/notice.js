$(document).ready(function(){
	
	fn.renderNoticeList();
	
	$("#notice_list").on("click","li",function(){
		fn.noticeContentView($(this).data('noticeSeq'));
	});
});

var fn = {
		
		blockPostCnt : '10',
		
		renderNoticeList : function(nowPageNumber){
			
			var param = {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt
			}
			
			$.ajax({
				url : '/notice/getNoticeList',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					$.each(res.list,function(i , item){
						item.content = item.content.replace(/(<([^>]+)>)/gi, "");
					});
					
					$("#notice_list").empty();
					$('#notice_list_template').tmpl(res).appendTo('#notice_list');
					fn.incPaging(res.paging);
				}
			});
			
		},
		
		incPaging : function(paging){
			$("#notice_paging").empty();
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li><a href="javascript:fn.renderNoticeList('+(paging.nowPageNumber - 1)+')">&laquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="current"><a href="javascript:fn.renderNoticeList('+i+')">'+i+'</a></li>');
				}else{
					html.push('<li><a href="javascript:fn.renderNoticeList('+i+')">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li><a href="javascript:fn.renderNoticeList('+(paging.nowPageNumber + 1)+')">&raquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&raquo;</a></li>');
			}		
			$("#notice_paging").html(html.join(''));
		},
		
		noticeContentView : function(noticeSeq){
			
			var noticeContentViewForm = $("#noticeContentViewForm");
			$("#noticeContentViewForm input").val(noticeSeq);
			noticeContentViewForm.attr('action','/noticeContentView');
			noticeContentViewForm.attr('method','post');
			noticeContentViewForm.submit();
			
		}
		
}