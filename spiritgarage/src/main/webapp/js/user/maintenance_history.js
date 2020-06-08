$(document).ready(function(){
	
	fn.init();
	
	$("#maintenanceHistoryConfirm").on("click",function(){
		fn.getMyMaintenanceHistorySearch();
	});
	
	$("#myMaintenanceHistory_list").on("click","input[name=myMaintenanceHistoryDetail]",function(){
		fn.maintenanceHistoryDetail($(this).closest('tr').data('maintenanceHistorySeq'));
	});
	
	$("#maintenanceHistorySearchDiv").on("keypress","input",function(e){
		if(e.keyCode == 13){
			fn.getMyMaintenanceHistorySearch();
		}
	});
	
});

var fn = {
		
		blockPostCnt : '6',
		phone : '',
		carRegNum : '',
		
		init : function(){
			var phone = $("#detail_phone").val();
			var carRegNum = $("#detail_carRegNum").val();
			
			if(phone != ''){
				fn.phone = phone;
				fn.carRegNum = carRegNum;
				
				$("#phone").val(phone);
				$("#carRegNum").val(carRegNum);
				
				fn.getMyMaintenanceHistorySearch();
			}
		},
		
		getMaintenanceHistoryList : function(nowPageNumber){
			
			$.ajax({
				url : '/maintenanceHistory/getMaintenanceHistoryList',
				data : {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt,
					phone : fn.phone , 
					carRegNum : fn.carRegNum
				},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					if(res.list.length < 1){
						alert('검색 결과가 없습니다.');
						return false;
					}
					
					$("#myMaintenanceHistoryList").show();
					$("#myMaintenanceHistory_list").empty();
					$('#myMaintenanceHistory_list_template').tmpl(res).appendTo('#myMaintenanceHistory_list');
					fn.incPaging(res.paging);
				}
			});
		},
		
		incPaging : function(paging){
			
			$("#myMaintenanceHistory_paging").empty();
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li><a href="javascript:fn.getMaintenanceHistoryList('+(paging.nowPageNumber - 1)+')">&laquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="current"><a href="javascript:fn.getMaintenanceHistoryList('+i+')">'+i+'</a></li>');
				}else{
					html.push('<li><a href="javascript:fn.getMaintenanceHistoryList('+i+')">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li><a href="javascript:fn.getMaintenanceHistoryList('+(paging.nowPageNumber + 1)+')">&raquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&raquo;</a></li>');
			}		
			$("#myMaintenanceHistory_paging").html(html.join(''));
		},
		
		getMyMaintenanceHistorySearch : function(){
			
			var phone = $("#phone").val();
			var carRegNum = $("#carRegNum").val();
			
			if(phone == ''){
				alert('연락처를 입력하세요');
				return false;
			}
			
			var phoneExp = /^\d{3}\d{3,4}\d{4}$/;
			if(!phoneExp.test(phone)){
				alert('연락처를 올바르게 입력해주세요');
				return false;
			}
			
			if(carRegNum == ''){
				alert('차량등록번호를 입력하세요');
				return false;
			}
			
			fn.phone = phone;
			fn.carRegNum = carRegNum;
			
			fn.getMaintenanceHistoryList();
		},
		
		maintenanceHistoryDetail : function(maintenanceHistorySeq){
			$("#maintenanceHistoryDetailForm").attr('action',"/maintenanceHistoryDetail");
			$("#maintenanceHistoryDetailForm").attr('method',"post");
			$("#maintenanceHistoryDetailForm #form_maintenanceHistorySeq").val(maintenanceHistorySeq);
			$("#maintenanceHistoryDetailForm #form_phone").val(fn.phone);
			$("#maintenanceHistoryDetailForm #form_carRegNum").val(fn.carRegNum);
			$("#maintenanceHistoryDetailForm").submit();
		}
		
}