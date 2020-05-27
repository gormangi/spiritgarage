$(document).ready(function(){
	
	fn.renderCategoryList();
	
	$("#category_list").on("click","li",function(){
		window.open($(this).data('link'), '_blank');
	});
});

var fn = {
		
		blockPostCnt : '3',
		
		renderCategoryList : function(nowPageNumber){
			
			var param = {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt,
					category : $("#category").val()
			}
			
			$.ajax({
				url : '/category/getCategoryList',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#category_list").empty();
					$('#category_list_template').tmpl(res).appendTo('#category_list');
					fn.incPaging(res.paging);
				}
			});
			
		},
		
		incPaging : function(paging){
			$("#category_paging").empty();
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li><a href="javascript:fn.renderCategoryList('+(paging.nowPageNumber - 1)+')">&laquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="current"><a href="javascript:fn.renderCategoryList('+i+')">'+i+'</a></li>');
				}else{
					html.push('<li><a href="javascript:fn.renderCategoryList('+i+')">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li><a href="javascript:fn.renderCategoryList('+(paging.nowPageNumber + 1)+')">&raquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&raquo;</a></li>');
			}		
			$("#category_paging").html(html.join(''));
		}
		
}