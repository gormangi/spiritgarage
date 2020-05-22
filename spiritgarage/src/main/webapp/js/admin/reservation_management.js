$(document).ready(function(){
	
	fn.onValidation();
	
	fn.getMaintenanceAreaList();
	
	fn.getReservationList();
	
	fn.getLoadCalendar();
	
	$("#maintenanceAreaAddBtn").on("click",function(){
		$("#maintenanceAreaAdd-modal form")[0].reset();
		$("#maintenanceAreaAdd-modal").modal('show');
	});
	
	$("#maintenanceAreaAdd").on("click",function(){
		$("#maintenanceAreaAddForm").submit();
	});
	
	$("#maintenance_area_list").on("click","input[name=maintenanceAreaDel]",function(){
		fn.maintenanceAreaDel($(this).closest('tr').data('maintenanceAreaSeq'));
	});
	
	$("#reservation_list").on("click","tr",function(){
		$(this).closest('tbody').find('tr').css('background','white');
		$(this).closest('tbody').find('tr').css('color','black');
		$(this).css('background','#28a745');
		$(this).css('color','white');
		var reservationSeq = $(this).data('reservationSeq');
		fn.reservationInfo(reservationSeq);
	});
	
	$("#reservationInfoDivHideBtn").on("click",function(){
		$("#reservationInfoDiv").hide();
	});
	
	$("#reservationInfo").on("click","#reservationCancelBtn",function(){
		fn.reservationCancel($(this).data('reservationSeq'));
	});
	
	$("#reservationInfo").on("click","#reservationRepBtn",function(){
		fn.reservationRep($(this).data('reservationSeq'));
	});
	
	$("#reservationSearchBtn").on("click",function(){
		fn.reservationSearch();
	});
	
	$("#reservationSearchWord").on("keypress",function(e){
		if(e.keyCode == 13){
			fn.reservationSearch();
		}
	});
});

var fn = {
		blockPostCnt : '5',
		reservationSearchWord : '',
		
		getReservationList : function(nowPageNumber){
			
			var param = {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt,
					searchWord : fn.reservationSearchWord
			}
			
			$.ajax({
				url : '/admin/getReservationList',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#reservation_list").empty();
					$("#reservation_list_template").tmpl(res).appendTo("#reservation_list");
					fn.reservationIncPaging(res.paging);
				}
			});
			
		},
		
		reservationIncPaging : function(paging){
			
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li class="page-item"><a href="javascript:fn.getReservationList('+(paging.nowPageNumber - 1)+')" class="page-link">&laquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="page-item active"><a href="javascript:fn.getReservationList('+i+')" class="page-link">'+i+'</a></li>');
				}else{
					html.push('<li class="page-item"><a href="javascript:fn.getReservationList('+i+')" class="page-link">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li class="page-item"><a href="javascript:fn.getReservationList('+(paging.nowPageNumber + 1)+')" class="page-link">&raquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&raquo;</a></li>');
			}		
			$("#reservation_pagination").html(html.join(''));
			
		},
		
		getMaintenanceAreaList : function(nowPageNumber){
			
			var param = {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt
			}
			
			$.ajax({
				url : '/admin/getMaintenanceAreaList',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#maintenance_area_list").empty();
					$('#maintenance_area_list_template').tmpl(res).appendTo('#maintenance_area_list');
					fn.maintenanceAreaIncPaging(res.paging);
				}
			});
			
		},
		
		maintenanceAreaIncPaging : function(paging){
			
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceAreaList('+(paging.nowPageNumber - 1)+')" class="page-link">&laquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="page-item active"><a href="javascript:fn.getMaintenanceAreaList('+i+')" class="page-link">'+i+'</a></li>');
				}else{
					html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceAreaList('+i+')" class="page-link">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li class="page-item"><a href="javascript:fn.getMaintenanceAreaList('+(paging.nowPageNumber + 1)+')" class="page-link">&raquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&raquo;</a></li>');
			}		
			$("#maintenance_area_pagination").html(html.join(''));
		},
		
		maintenanceAreaAdd : function(){
			
			var param = {
					maintenanceName : $("#add_maintenanceName").val()
			}
			
			$.ajax({
				url : '/admin/maintenanceAreaAdd',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.result == 'fail'){
						alert(res.resultString);
						return false;
					}else{
						alert(res.resultString);
						$("#maintenanceAreaAdd-modal").modal('hide');
						fn.getMaintenanceAreaList();
					}
				}
			});
			
		},
		
		maintenanceAreaDel : function(maintenanceAreaSeq){
			if(confirm('해당 정비영역을 삭제하시겠습니까?')){
				$.ajax({
					url : '/admin/maintenanceAreaDel',
					data : {maintenanceAreaSeq : maintenanceAreaSeq},
					dataType : 'json',
					type : 'post',
					success : function(res){
						if(res){
							alert('정비영역이 삭제되었습니다');
							fn.getMaintenanceAreaList();
						}
					}
				});
			}
		},
		
		onValidation : function(){
			
			$.validator.addMethod("userIdCheck",function(value,element){
				return this.optional(element) || /^[a-z]+[a-z0-9]$/.test(value);
			});
			
			$.validator.addMethod("userNameCheck",function(value,element){
				return this.optional(element) || /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/.test(value);
			});
			
			$.validator.addMethod("passwordCheck",function(value,element){
				return this.optional(element) || /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
			});
			
			$("#maintenanceAreaAddForm").validate({
				rules: {
					add_maintenanceName : {
						required : true,
						minlength : 1,
						maxlength : 100
					}
				},
				messages: {
					add_maintenanceName : {
						required : "정비영역을 입력해주세요",
						minlength : "정비영역은 1~100자리로 입력하세요",
						maxlength : "정비영역은 1~100자리로 입력하세요"
					}
				},
				onkeyup : false,
				onclick : false,
				onfocusout : false,
				showErrors : function(errorMap, errorList){
					if(errorList.length){
						alert(errorList[0].message);
					}
				},
				submitHandler : function(){
					fn.maintenanceAreaAdd();
				}
			});
		},
		
		reservationInfo : function(reservationSeq){
			$.ajax({
				url : '/admin/getReservationInfo',
				data : {reservationSeq : reservationSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#reservationInfoDiv").show();
					$("#reservationInfo").empty();
					$('#reservationInfo_template').tmpl(res).appendTo('#reservationInfo');
					
					var offset = $("#reservationInfoDiv").offset();
					$('html, body').animate({scrollTop : offset.top}, 300);
				}
			});
		},
		
		reservationCancel : function(reservationSeq){
			
			if(confirm('해당 예약을 취소 처리하시겠습니까?')){
				$.ajax({
					url : '/admin/reservationCancel',
					data : {reservationSeq , reservationSeq},
					dataType : 'json',
					type : 'post',
					success : function(res){
						if(res){
							alert('예약이 취소처리되었습니다');
							$("#reservationInfoDiv").hide();
							fn.getReservationList();
							fn.getLoadCalendar();
							$("#calendar").fullCalendar('refetchEvents');
						}
					}
				});
			}
			
		},
		
		reservationRep : function(reservationSeq){
			$.ajax({
				url : '/admin/reservationRep',
				data : {reservationSeq , reservationSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res){
						alert('예약이 복구처리되었습니다');
						$("#reservationInfoDiv").hide();
						fn.getReservationList();
						$("#calendar").fullCalendar('refetchEvents');
					}
				}
			});
		},
		
		getLoadCalendar : function(){
			
			$("#calendar").fullCalendar({
				eventSources : [{
					url : '/admin/getCalendarReservationList',
					data: function(){
						return {searchWord : fn.reservationSearchWord};
					},
					dataType : 'json',
					type : 'post',
					cache:false
				}],
				editable: true,
				eventClick : function(calEvent , jsEvent , view){
					fn.reservationInfo(calEvent.id);
				}
			});
		},
		
		reservationSearch : function(){
			fn.reservationSearchWord = $("#reservationSearchWord").val();
			fn.getReservationList();
			$("#calendar").fullCalendar('refetchEvents');
		}
}