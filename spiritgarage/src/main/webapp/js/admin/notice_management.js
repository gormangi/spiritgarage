$(document).ready(function(){
	
	fn.getNoticeManagementList();
	
	$("#noticeAddBtn").on("click",function(){
		document.location.href = "/admin/noticeReg";
	});
	
	$("#notice_list").on("click","tr a",function(){
		fn.noticeModify($(this).closest('tr').data('noticeSeq'));
	});
	
});

var fn = {
		
		blockPostCnt : '10',
		
		getNoticeManagementList : function(nowPageNumber){
			
			$.ajax({
				url : '/admin/getNoticeManagementList',
				data : {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt
				},
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#notice_list").empty();
					$('#notice_list_template').tmpl(res).appendTo('#notice_list');
					fn.incPaging(res.paging);
				}
			});
			
		},
		
		incPaging : function(paging){
			
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li class="page-item"><a href="javascript:fn.getNoticeManagementList('+(paging.nowPageNumber - 1)+')" class="page-link">&laquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="page-item active"><a href="javascript:fn.getNoticeManagementList('+i+')" class="page-link">'+i+'</a></li>');
				}else{
					html.push('<li class="page-item"><a href="javascript:fn.getNoticeManagementList('+i+')" class="page-link">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li class="page-item"><a href="javascript:fn.getNoticeManagementList('+(paging.nowPageNumber + 1)+')" class="page-link">&raquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&raquo;</a></li>');
			}		
			$("#notice_pagination").html(html.join(''));
		},
		
		noticeModify : function(noticeSeq){

			$("#noticeModifyForm").attr('action','/admin/noticeModify');
			$("#noticeModifyForm").attr('method','post');
			$("#noticeModifyForm input").val(noticeSeq);
			$("#noticeModifyForm").submit();
			
		}
		
}