$(document).ready(function(){
	fn.getMaintenanceHistoryList();
	
	$("#maintenanceHistoryAdd").on("click",function(){
		document.location.href = "/admin/maintenanceHistoryReg";
	});
	
	$("#maintenance_history_list").on("click","tr",function(){
		fn.maintenanceHistoryModify($(this).data('maintenanceHistorySeq'));
	});
	
	$("#searchBtn").on("click",function(){
		fn.search();
	});
	
	$("#searchReset").on("click",function(){
		fn.searchReset();
	});
	
	$("#searchDiv").on("keypress","input",function(e){
		if(e.keyCode == 13){
			fn.search();
		}
	});
});

var fn = {
		
		blockPostCnt : '10',
		searchName : '',
		searchPhone : '',
		searchCarRegNum : '',
		
		getMaintenanceHistoryList : function(nowPageNumber){
			
			$.ajax({
				url : '/admin/getMaintenanceHistoryList',
				data : {
					blockPostCnt : fn.blockPostCnt,
					searchName : fn.searchName,
					searchPhone : fn.searchPhone,
					searchCarRegNum : fn.searchCarRegNum,
					nowPageNumber : nowPageNumber
				},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					$.each(res.list,function(i,item){
						if(item.dayOfDelivery == '0000-00-00'){
							item.dayOfDelivery = '';
						}
						
						if(item.maintenanceRequestDate == '0000-00-00'){
							item.maintenanceRequestDate = '';
						}
					});
					
					$("#maintenance_history_list").empty();
					$('#maintenance_history_list_template').tmpl(res).appendTo('#maintenance_history_list');
					fn.incPaging(res.paging);
				}
			});
			
		},
		
		search : function(){
			var searchName = $("#searchName").val();
			var searchPhone = $("#searchPhone").val();
			var searchCarRegNum = $("#searchCarRegNum").val();
			
			if(searchPhone == '' && searchCarRegNum == ''){
				alert('연락처 또는 차량등록번호를 입력하세요');
				return false;
			}
			
			fn.searchName = searchName;
			fn.searchPhone = searchPhone;
			fn.searchCarRegNum = searchCarRegNum;
				
			fn.getMaintenanceHistoryList();
		},
		
		searchReset : function(){
			
			$("#searchName").val('');
			$("#searchPhone").val('');
			$("#searchCarRegNum").val('');
			
			fn.searchName = '';
			fn.searchPhone = '';
			fn.searchCarRegNum = '';
				
			fn.getMaintenanceHistoryList();
		},
		
		incPaging : function(paging){
			
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceHistoryList('+(paging.nowPageNumber - 1)+')" class="page-link">&laquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="page-item active"><a href="javascript:fn.getMaintenanceHistoryList('+i+')" class="page-link">'+i+'</a></li>');
				}else{
					html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceHistoryList('+i+')" class="page-link">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceHistoryList('+(paging.nowPageNumber + 1)+')" class="page-link">&raquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&raquo;</a></li>');
			}		
			$("#maintenance_history_pagination").html(html.join(''));
		},
		
		maintenanceHistoryModify : function(maintenanceHistorySeq){
			$("#maintenanceHistroyModifyForm").attr('action','/admin/maintenanceHistoryModify');
			$("#maintenanceHistroyModifyForm").attr('method','post');
			$("#maintenanceHistroyModifyForm input").val(maintenanceHistorySeq);
			$("#maintenanceHistroyModifyForm").submit();
		}
		
}