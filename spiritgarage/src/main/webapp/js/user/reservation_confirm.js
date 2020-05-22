$(document).ready(function(){
	
	fn.init();
	
	$("#reservationConfirmBtn").on("click",function(){
		fn.reservationConfirm();
	});
	
	$("#reservation_phone").on("keypress",function(e){
		if(e.keyCode == 13){
			fn.reservationConfirm();
		}
	});
	
	$("#myReservation_list").on("click","input[name=myResContent]",function(){
		fn.renderMyResContent($(this).closest('tr').data('reservationSeq'));
	});
	
	$("#myReservation_list").on("click","input[name=myResCancel]",function(){
		fn.myResCancel($(this).closest('tr').data('reservationSeq'));
	});
	
});

var fn = {
		
		blockPostCnt : '4',
		reservationName : '',
		reservationPhone : '',
		
		init : function(){
			var resComplateName = $("#resComplateName").val();
			var resComplatePhone = $("#resComplatePhone").val();
			
			if(resComplateName != '' && resComplatePhone != ''){
				
				$("#reservation_name").val(resComplateName);
				$("#reservation_phone").val(resComplatePhone);
				
				fn.reservationName = resComplateName;
				fn.reservationPhone = resComplatePhone;
				
				fn.renderResList();
			}
		},
		
		reservationConfirm : function(){
			
			var reservationName = $("#reservation_name").val();
			var reservationPhone = $("#reservation_phone").val();
			
			if(reservationName == ''){
				alert('예약자 이름을 입력해주세요');
				return false;
			}
			
			if(reservationPhone == ''){
				alert('휴대폰번호를 입력해주세요');
				return false;
			}
			
			var phoneExp = /^\d{3}\d{3,4}\d{4}$/;
			if(!phoneExp.test(reservationPhone)){
				alert('휴대폰 번호를 올바르게 입력해주세요');
				return false;
			}
			
			fn.reservationName = reservationName;
			fn.reservationPhone = reservationPhone;
			
			fn.renderResList();
		},
		
		renderResList : function(nowPageNumber){
			
			var param = {
					nowPageNumber : nowPageNumber,
					reservationName : fn.reservationName,
					phone : fn.reservationPhone,
					blockPostCnt : fn.blockPostCnt
			}
			
			$.ajax({
				url : '/reservation/getMyResList',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					$("#myResList").show();
					$("#myReservation_list").empty();
					$('#myReservation_list_template').tmpl(res).appendTo('#myReservation_list');
					fn.incPaging(res.paging);
					fn.reservationCancelDisabled();
					
				}
			});
			
		},
		
		reservationCancelDisabled : function(){
			
			var cancelBtns = $("#myReservation_list").find('input[name=myResCancel]');
			$.each(cancelBtns,function(i,elem){
				var dt = $(elem).data('reservationDate');
				
				var nowDate = new Date();
				var resDate = fn.stringToDate(dt);
				if(nowDate > resDate){
					$(elem).hide();
				}
			});
			
		},
		
		stringToDate : function(dt){
			var resDate = new Date(Number(dt.substr(0,4)) , Number(dt.substr(5,2))-1 , Number(dt.substr(8,2)) , 
					Number(dt.substr(11,2)) , Number(dt.substr(14,2)));
			return resDate;
		},
		
		incPaging : function(paging){
			
			$("#myReservation_paging").empty();
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li><a href="javascript:fn.renderResList('+(paging.nowPageNumber - 1)+')">&laquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="current"><a href="javascript:fn.renderResList('+i+')">'+i+'</a></li>');
				}else{
					html.push('<li><a href="javascript:fn.renderResList('+i+')">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li><a href="javascript:fn.renderResList('+(paging.nowPageNumber + 1)+')">&raquo;</a></li>');
			}else{
				html.push('<li><a href="javascript:void(0);">&raquo;</a></li>');
			}		
			$("#myReservation_paging").html(html.join(''));
		},
		
		renderMyResContent : function(reservationSeq){
			
			$.ajax({
				url : '/reservation/getMyResContent',
				data : {reservationSeq : reservationSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.reservationContent == ''){
						alert('입력하신 예약내용이 없습니다');
						$("#myResContentDiv").hide();
						return false;
					}else{
						$("#myResContentDiv").show();
						$("#myResContent").html(res.reservationContent);
					}
				}
			});
			
		},
		
		myResCancel : function(reservationSeq){
			
			if(confirm('이 예약을 취소하시겠습니까?')){
				$.ajax({
					url : '/reservation/myResCancel',
					data : {reservationSeq : reservationSeq},
					dataType : 'json',
					type : 'post',
					success : function(res){
						if(res){
							alert('예약이 취소되었습니다');
							fn.renderResList();
						}else{
							alert('예약 취소에 실패하였습니다. 관리자에게 문의해주세요');
							return false;
						}
					}
				});
			}
			
		}
}