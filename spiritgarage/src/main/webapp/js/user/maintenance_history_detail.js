$(document).ready(function(){
	
	fn.getMaintenanceHistoryInfo();
	
	$("#goMyMaintenanceHistoryList").on("click",function(){
		fn.goBack();
	});
});

var fn = {
		
		getMaintenanceHistoryInfo : function(){
			
			var maintenanceHistorySeq = $("#maintenanceHistorySeq").val();
			
			$.ajax({
				url : '/maintenanceHistory/getMaintenanceHistoryInfo',
				data : {maintenanceHistorySeq : maintenanceHistorySeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					if(res.maintenanceHistoryInfo.carRegDate == '0000-00-00'){
						res.maintenanceHistoryInfo.carRegDate = '';
					}
					
					if(res.maintenanceHistoryInfo.name == ''){
						res.maintenanceHistoryInfo.name = '-';
					}
					
					if(res.maintenanceHistoryInfo.carRegDate == ''){
						res.maintenanceHistoryInfo.carRegDate = '-';
					}
					
					if(res.maintenanceHistoryInfo.maintenanceRequestDate == ''){
						res.maintenanceHistoryInfo.maintenanceRequestDate = '-';
					}
					
					if(res.maintenanceHistoryInfo.dayOfDelivery == ''){
						res.maintenanceHistoryInfo.dayOfDelivery = '-';
					}
					
					$("#carRegNum").text(res.maintenanceHistoryInfo.carRegNum);
					$("#phone").text(res.maintenanceHistoryInfo.phone);
					$("#name").text(res.maintenanceHistoryInfo.name);
					$("#carRegDate").text(res.maintenanceHistoryInfo.carRegDate);
					$("#maintenanceRequestDate").text(res.maintenanceHistoryInfo.maintenanceRequestDate);
					$("#distanceDriven").text(res.maintenanceHistoryInfo.distanceDriven + " km");
					$("#dayOfDelivery").text(res.maintenanceHistoryInfo.dayOfDelivery);
					
					var html = [];
					$.each(res.maintenanceHistoryDetailList,function(i,item){
						html.push('<tr>');
						html.push('<td>'+item.maintenanceDv+'</td>');
						html.push('<td><pre>'+item.workContent+'</pre></td>');
						if(item.partsClass == 'N'){
							html.push('<td>신품</td>');
						}else if(item.partsClass == 'R'){
							html.push('<td>중고</td>');
						}else if(item.partsClass == 'X'){
							html.push('<td>해당없음</td>');
						}
						html.push('</tr>');
					});
					$("#maintenanceHistoryDetailList").html(html.join(''));
					
					$("#payment").text(res.maintenanceHistoryInfo.payment + " 원");
				}
			});
			
		},
		
		goBack : function(){
			var phone = $("#parent_phone").val();
			var carRegNum = $("#parent_carRegNum").val();
			
			$("#goBackForm").attr('action','/maintenanceHistory');
			$("#goBackForm").attr('method','post');
			$("#goBackForm #goBack_phone").val(phone);
			$("#goBackForm #goBack_carRegNum").val(carRegNum);
			$("#goBackForm").submit();
		}
		
}