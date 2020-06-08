$(document).ready(function(){
	
	fn.init();
	
	$("#goReservation").on("click",function(){
		fn.reservation();
	});
	
	$("#goReservationConfirm").on('click',function(){
		document.location.href = "/reservationConfirm";
	});
});

var fn = {
		
		init : function(){
			
			$.datetimepicker.setLocale('ko');
			$("#reservation_date").datetimepicker({
				format:'Y-m-d H:i',
				ignoreReadonly:true,
				minDate:0,
				step:30
			});
			
			fn.getMaintenanceAreaList();
			
			fn.createEditor();
			
		},
		
		reservation : function(){
			
			var reservationDate = $("#reservation_date").val();
			
			if(reservationDate == ''){
				alert('예약 희망 날짜를 선택해주세요');
				return false;
			}
			
			var reservationName = $("#reservation_name").val();
			
			if(reservationName == ''){
				alert('예약자 이름을 입력해주세요');
				return false;
			}
			
			var reservationPhone = $("#reservation_phone").val();
			
			if(reservationPhone == ''){
				alert('휴대폰번호를 입력해주세요');
				return false;
			}
			
			var phoneExp = /^\d{3}\d{3,4}\d{4}$/;
			if(!phoneExp.test(reservationPhone)){
				alert('휴대폰 번호를 올바르게 입력해주세요');
				return false;
			}
			
			if($("input[name=choose_area]:checked").length < 1){
				alert('정비영역을 1개이상 선택해주세요');
				return false;
			}
			
			var area = [];
			$.each($("input[name=choose_area]:checked"),function(i,elem){
				area.push($(elem).val());
			});
			
			var chooseArea = area.join('\|');
			var reservationContent = CKEDITOR.instances.reservation_content.getData();
			
			var resParam = {
					reservationDate : reservationDate,
					reservationName : reservationName,
					phone : reservationPhone,
					chooseArea : chooseArea,
					reservationContent : reservationContent
			};
			
			$.ajax({
				url : '/reservation/doReservation',
				data : resParam,
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.state == 'success'){
						alert('예약이 완료되었습니다.');
						$("#reservationComplateForm").attr('action','/reservationConfirm');
						$("#reservationComplateForm").attr('method','post');
						$("#p_reservation_name").val(reservationName);
						$("#p_reservation_phone").val(reservationPhone);
						$("#reservationComplateForm").submit();
					}else if(res.state = 'notPossibleFail'){
						alert(res.startDate + ' 부터 ' + res.endDate + ' 까지는\n[' + res.reason + '] \n 의 사유로 예약할수 없습니다 \n 다른날짜를 선택해주세요');
						return false;
					}else if(res.state == 'fail'){
						alert("예약에 실패하였습니다 관리자에게 문의해주세요");
						return false;
						
					}
				}
			});
			
		},
		
		getMaintenanceAreaList : function(){
			
			$.ajax({
				url : '/reservation/getMaintenanceAreaList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					var html = [];
					$.each(res,function(i,item){
						html.push('<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value='+item.maintenanceName+' style="display:inline-block"/>'+item.maintenanceName+'</label>')
					});
					$("#maintenanceAreaTd").html(html.join(''));
				}
			});
			
		},
		
		createEditor : function(){
			CKEDITOR.replace('reservation_content',{
				uploadUrl : '/reservation/reservationImageUpload',
				filebrowserImageUploadUrl : '/reservation/reservationImageUpload',
				height : 300,
				toolbar : [
					['Source'],
					['Bold','Italic','Underline','Strike','-','Subscript','Superscript'], 
					['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'], 
					['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'], 
					['Link','Unlink','Anchor'], 
					['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'], '/', 
					['Styles','Format','Font','FontSize'], 
					['TextColor','BGColor'], 
					['Maximize', 'ShowBlocks','-','About']
				]
			});
			
			CKEDITOR.on('dialogDefinition', function(ev){
				var dialogName = ev.data.name;
				var dialogDefinition = ev.data.definition;
				
				switch (dialogName) {
					case 'image':
						dialogDefinition.removeContents('Link');
						dialogDefinition.removeContents('advanced');
						break;
					case 'link' :
						dialogDefinition.removeContents('upload');
						dialogDefinition.removeContents('advanced');
				}
			});
		}
}