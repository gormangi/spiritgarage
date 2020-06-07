$(document).ready(function(){
	fn.init();
	
	$("#maintenanceHistoryDetailModalOpen").on("click",function(){
		$("#maintenanceHistoryDetailAdd-modal form")[0].reset();
		$("#maintenanceHistoryDetailAdd-modal .modal-title").text('정비내역 추가');
		$("#maintenanceHistoryDetailModify").hide();
		$("#maintenanceHistoryDetailAdd").show();
		$("#maintenanceHistoryDetailAdd-modal").modal('show');
	});
	
	$("#maintenanceHistoryDetailAdd").on("click",function(){
		fn.maintenanceHistoryDetailAdd();
	});
	
	$("#maintenance_history_detail_list").on("click","button[name=maintenanceHistoryDetailModifyBtn]",function(){
		fn.maintenanceHistoryDetailModifyModalOpen($(this));
	});
	
	$("#maintenance_history_detail_list").on("click","button[name=maintenanceHistoryDetailDelBtn]",function(){
		fn.maintenanceHistoryDetailDel($(this));
	});
	
	$("#maintenanceHistoryDetailModify").on("click",function(){
		fn.maintenanceHistoryDetailModify($(this));
	});
	
	$("#maintenanceHistoryWrite").on("click",function(){
		fn.saveMaintenanceHistory();
	});
	
	$("#maintenanceHistoryCancel").on("click",function(){
		document.location.href = "/admin/maintenanceHistoryManagement";
	});
	
	$("#maintenanceHistoryModify").on("click",function(){
		fn.maintenanceHistoryModify();
	});
	
	$("#maintenanceHistoryDelete").on("click",function(){
		fn.maintenanceHistoryDelete();
	});
});

var fn = {
		
		init : function(){
			
			$('#carRegDate').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' });
			$('#maintenanceRequestDate').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' });
			$('#dayOfDelivery').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' });
		
			$("#distanceDriven").inputmask("numeric", {
				autoGroup: true,
				groupSeparator: ",",
				digits: 0,
				allowMinus: false,
				repeat: 12
			});
			
			$("#payment").inputmask("numeric", {
				autoGroup: true,
				groupSeparator: ",",
				digits: 0,
				allowMinus: false,
				repeat: 12
			});
			
			var rMod = $("#rMod").val();
			if(rMod == 'N'){
				$("#maintenanceHistoryWrite").show();
				$(".card-title").text('정비이력 등록');
			}else{
				$("#maintenanceHistoryModify").show();
				$("#maintenanceHistoryDelete").show();
				$(".card-title").text('정비이력 수정');
				var maintenanceHistorySeq = $("#maintenanceHistorySeq").val();
				fn.getMaintenanceHistoryInfo(maintenanceHistorySeq);
			}
			
		},
		
		maintenanceHistoryDetailAdd : function(){
			
			var maintenanceDv = $("#maintenanceHistoryDetail_maintenanceDv").val();
			var partsClass = $("#maintenanceHistoryDetail_partsClass").val();
			var workContent = $("#maintenanceHistoryDetail_workContent").val();
			
			if(maintenanceDv == ''){
				alert('정비구분을 입력하세요');
				return false;
			}
			
			if(workContent == ''){
				alert('정비내용을 입력하세요');
				return false;
			}
			
			var maxTrLength = $("#maintenance_history_detail_list tr").length;
			
			var html = [];
			html.push('<tr data-maintenance-history-detail-order='+(maxTrLength+1)+'>');
			html.push('<td data-maintenance-history-detail-maintenance-dv='+maintenanceDv+'><span>'+maintenanceDv+'</span></td>');
			html.push('<td data-maintenance-history-detail-work-content='+workContent+'><span>'+workContent+'</span></td>');
			if(partsClass == 'N'){
				html.push('<td data-maintenance-history-detail-parts-class='+partsClass+'>신품</td>');
			}else if(partsClass == 'R'){
				html.push('<td data-maintenance-history-detail-parts-class='+partsClass+'>중고</td>');
			}else if(partsClass == 'X'){
				html.push('<td data-maintenance-history-detail-parts-class='+partsClass+'>해당없음</td>');
			}
			html.push('<td><button type="button" name="maintenanceHistoryDetailModifyBtn" class="btn btn-block btn-outline-info btn-xs">수정</button></td>');
			html.push('<td><button type="button" name="maintenanceHistoryDetailDelBtn" class="btn btn-block btn-outline-danger btn-xs">삭제</button></td>');
			html.push('</tr>');
			
			$("#maintenance_history_detail_list").append(html.join(''));
			
			$("#maintenanceHistoryDetailAdd-modal").modal('hide');
		},
		
		maintenanceHistoryDetailModifyModalOpen : function(me){
			
			$("#maintenanceHistoryDetailAdd-modal .modal-title").text('정비내역 수정');
			$("#maintenanceHistoryDetailModify").show();
			$("#maintenanceHistoryDetailAdd").hide();
			
			$("#detailOrder").val($(me).closest('tr').data('maintenanceHistoryDetailOrder'));
			var maintenanceDv = $(me).closest('tr').children().eq(0).find('span').text();
			var workContent = $(me).closest('tr').children().eq(1).find('span').text();
			var partsClass = $(me).closest('tr').children().eq(2).data('maintenanceHistoryDetailPartsClass');
			
			$("#maintenanceHistoryDetail_maintenanceDv").val(maintenanceDv);
			$("#maintenanceHistoryDetail_partsClass").val(partsClass);
			$("#maintenanceHistoryDetail_workContent").val(workContent);
			
			$("#maintenanceHistoryDetailAdd-modal").modal('show');
		},
		
		maintenanceHistoryDetailModify : function(me){
			
			var maintenanceDv = $("#maintenanceHistoryDetail_maintenanceDv").val();
			var partsClass = $("#maintenanceHistoryDetail_partsClass").val();
			var workContent = $("#maintenanceHistoryDetail_workContent").val();
			
			var detailOrder = $("#detailOrder").val();
			
			var modifyTr = $("#maintenance_history_detail_list").find('tr[data-maintenance-history-detail-order="'+detailOrder+'"]');
			
			$(modifyTr).children().eq(0).data('maintenanceHistoryDetailMaintenanceDv',maintenanceDv).find('span').text(maintenanceDv);
			$(modifyTr).children().eq(1).data('maintenanceHistoryDetailWorkContent',workContent).find('span').text(workContent);
			$(modifyTr).children().eq(2).data('maintenanceHistoryDetailPartsClass',partsClass);
			if(partsClass == 'N'){
				$(modifyTr).children().eq(2).text('신품');
			}else if(partsClass == 'R'){
				$(modifyTr).children().eq(2).text('중고');
			}else if(partsClass == 'X'){
				$(modifyTr).children().eq(2).text('해당없음');
			}
			
			$("#maintenanceHistoryDetailAdd-modal").modal('hide');
		},
		
		maintenanceHistoryDetailDel : function(me){
			if(confirm('해당 정비내역을 삭제하시겠습니까?')){
				$(me).closest('tr').remove();
			}
		},
		
		saveMaintenanceHistory : function(){
			
			var phone = $("#phone").val();
			var carRegNum = $("#carRegNum").val();
			var name = $("#name").val();
			var carRegDate = $("#carRegDate").val();
			var maintenanceRequestDate = $("#maintenanceRequestDate").val();
			var dayOfDelivery = $("#dayOfDelivery").val();
			var distanceDriven = $("#distanceDriven").val();
			var payment = $("#payment").val();
			
			if(phone == ''){
				alert('연락처를 입력하세요');
				return false;
			}
			
			if(carRegNum == ''){
				alert('차량등록번호를 입력하세요');
				return false;
			}
			
			if(maintenanceRequestDate == ''){
				alert('정비의뢰일을 입력하세요');
				return false;
			}
			
			if(dayOfDelivery == ''){
				alert('출고일을 입력하세요');
				return false;
			}
			
			var trList = $("#maintenance_history_detail_list tr");
			if(trList.length < 1){
				alert('정비내역을 추가해주세요');
				return false;
			}
			
			var param = {
					phone : phone,
					carRegNum : carRegNum,
					name : name,
					carRegDate : carRegDate,
					maintenanceRequestDate : maintenanceRequestDate,
					dayOfDelivery : dayOfDelivery,
					distanceDriven : distanceDriven,
					payment : payment
			}
			
			$.ajax({
				url : '/admin/saveMaintenanceHistory',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.state == 'success'){
						fn.saveMaintenanceHistoryDetail(res.maintenanceHistorySeq);
					}
				}
			});
		},
		
		saveMaintenanceHistoryDetail : function(maintenanceHistorySeq){
			
			var trList = $("#maintenance_history_detail_list tr");
			
			$.each(trList,function(i,elem){
				
				var detail = {};
				
				var maintenanceDv = $(elem).children().eq(0).find('span').text();
				var workContent = $(elem).children().eq(1).find('span').text();
				var partsClass = $(elem).children().eq(2).data('maintenanceHistoryDetailPartsClass');
				
				$.ajax({
					url : '/admin/saveMaintenanceHistoryDetail',
					data : {
						maintenanceHistorySeq : maintenanceHistorySeq,
						maintenanceDv : maintenanceDv,
						workContent : workContent,
						partsClass : partsClass
					},
					dataType : 'json',
					type : 'post',
					success : function(res){}
				});
			});
			
			var rMod = $("#rMod").val();
			if(rMod == 'N'){
				alert('등록되었습니다.');
				document.location.href = "/admin/maintenanceHistoryManagement";
			}else{
				alert('수정되었습니다.');
				window.location.reload();
			}
			
		},
		
		getMaintenanceHistoryInfo : function(maintenanceHistorySeq){
			
			$.ajax({
				url : '/admin/getMaintenanceHistoryInfo',
				data : {maintenanceHistorySeq : maintenanceHistorySeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					if(res.maintenanceHistoryinfo.carRegDate == '0000-00-00'){
						res.maintenanceHistoryinfo.carRegDate = '';
					}
					
					if(res.maintenanceHistoryinfo.dayOfDelivery == '0000-00-00'){
						res.maintenanceHistoryinfo.dayOfDelivery = '';
					}
					
					if(res.maintenanceHistoryinfo.maintenanceRequestDate == '0000-00-00'){
						res.maintenanceHistoryinfo.maintenanceRequestDate = '';
					}
					
					$("#phone").val(res.maintenanceHistoryinfo.phone);
					$("#carRegNum").val(res.maintenanceHistoryinfo.carRegNum);
					$("#name").val(res.maintenanceHistoryinfo.name);
					$("#carRegDate").val(res.maintenanceHistoryinfo.carRegDate);
					$("#maintenanceRequestDate").val(res.maintenanceHistoryinfo.maintenanceRequestDate);
					$("#dayOfDelivery").val(res.maintenanceHistoryinfo.dayOfDelivery);
					$("#distanceDriven").val(res.maintenanceHistoryinfo.distanceDriven);
					$("#payment").val(res.maintenanceHistoryinfo.payment);
					
					$.each(res.maintenanceHistoryDetailList,function(i,item){
						
						var maxTrLength = $("#maintenance_history_detail_list tr").length;
						
						var html = [];
						html.push('<tr data-maintenance-history-detail-order='+(maxTrLength+1)+'>');
						html.push('<td data-maintenance-history-detail-maintenance-dv='+item.maintenanceDv+'><span>'+item.maintenanceDv+'</span></td>');
						html.push('<td data-maintenance-history-detail-work-content='+item.workContent+'><span>'+item.workContent+'</span></td>');
						if(item.partsClass == 'N'){
							html.push('<td data-maintenance-history-detail-parts-class='+item.partsClass+'>신품</td>');
						}else if(item.partsClass == 'R'){
							html.push('<td data-maintenance-history-detail-parts-class='+item.partsClass+'>중고</td>');
						}else if(item.partsClass == 'X'){
							html.push('<td data-maintenance-history-detail-parts-class='+item.partsClass+'>해당없음</td>');
						}
						html.push('<td><button type="button" name="maintenanceHistoryDetailModifyBtn" class="btn btn-block btn-outline-info btn-xs">수정</button></td>');
						html.push('<td><button type="button" name="maintenanceHistoryDetailDelBtn" class="btn btn-block btn-outline-danger btn-xs">삭제</button></td>');
						html.push('</tr>');
						
						$("#maintenance_history_detail_list").append(html.join(''));
						
					});
					
				}
			});
			
		},
		
		maintenanceHistoryModify : function(){
			
			var maintenanceHistorySeq = $("#maintenanceHistorySeq").val();
			
			var phone = $("#phone").val();
			var carRegNum = $("#carRegNum").val();
			var name = $("#name").val();
			var carRegDate = $("#carRegDate").val();
			var maintenanceRequestDate = $("#maintenanceRequestDate").val();
			var dayOfDelivery = $("#dayOfDelivery").val();
			var distanceDriven = $("#distanceDriven").val();
			var payment = $("#payment").val();
			
			if(phone == ''){
				alert('연락처를 입력하세요');
				return false;
			}
			
			if(carRegNum == ''){
				alert('차량등록번호를 입력하세요');
				return false;
			}
			
			if(maintenanceRequestDate == ''){
				alert('정비의뢰일을 입력하세요');
				return false;
			}
			
			if(dayOfDelivery == ''){
				alert('출고일을 입력하세요');
				return false;
			}
			
			var trList = $("#maintenance_history_detail_list tr");
			if(trList.length < 1){
				alert('정비내역을 추가해주세요');
				return false;
			}
			
			var param = {
					maintenanceHistorySeq : maintenanceHistorySeq,
					phone : phone,
					carRegNum : carRegNum,
					name : name,
					carRegDate : carRegDate,
					maintenanceRequestDate : maintenanceRequestDate,
					dayOfDelivery : dayOfDelivery,
					distanceDriven : distanceDriven,
					payment : payment
			}
			
			$.ajax({
				url : '/admin/maintenanceHistoryModifyDo',
				data : param,
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.state == 'success'){
						var result = fn.delMaintenanceHistoryDetail(maintenanceHistorySeq);
						if(result){
							fn.saveMaintenanceHistoryDetail(maintenanceHistorySeq);
						}
						
					}
				}
			});
			
		},
		
		delMaintenanceHistoryDetail : function(maintenanceHistorySeq){
			var result = false;
			
			$.ajax({
				url : '/admin/delMaintenanceHistoryDetail',
				data : {maintenanceHistorySeq : maintenanceHistorySeq},
				dataType : 'json',
				type : 'post',
				async : false,
				success : function(res){
					if(res.state == 'success'){
						result = true;
					}else{
						alert('수정에 실패하였습니다 관리자에게 문의해주세요');
						return false;
						result = false;
					}
				}
			});
			
			return result;
		},
		
		maintenanceHistoryDelete : function(){
			
			if(confirm('삭제하시겠습니까?')){
				var maintenanceHistorySeq = $("#maintenanceHistorySeq").val();
				
				$.ajax({
					url : '/admin/maintenanceHistoryDelete',
					data : {maintenanceHistorySeq : maintenanceHistorySeq},
					dataType : 'json',
					type : 'post',
					success : function(res){
						if(res.state == 'success'){
							alert('삭제되었습니다.');
							document.location.href = "/admin/maintenanceHistoryManagement";
						}else{
							alert('삭제에 실패하였습니다 관리자에게 문의하세요');
							return false;
						}
					}
				});
			}
			
		}
		
}