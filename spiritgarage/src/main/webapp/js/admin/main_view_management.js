$(document).ready(function(){
	
	fn.mainSlideList();
	
	fn.categoryList();
	
	$("#mainSlideAddBtn").on("click",function(){
		fn.mainSlideAddModalOpen();
	});
	
	$("#mainSlideForm").on("change","input[name=mainSlideModal_slideDv]",function(){
		fn.mainSlideAddModalSlideDvChg($(this).val());
	});
	
	$("#mainSlideModal_bannerFile").on("change",function(){
		fn.bannerFileValidation($(this));
	});
	
	$("#mainSlideAdd").on("click",function(){
		fn.mainSlideAdd();
	});
	
	$("#mainSlide_list").on("click","button[name=mainSlideModifyBtn]",function(){
		fn.mainSlideModifyModalOpen($(this).closest('tr').data('mainSlideSeq'));
	});
	
	$("#mainSlideModify").on("click",function(){
		fn.mainSlideModify();
	});
	
	$("#mainSlide_list").on("click","button[name=mainSlideDelBtn]",function(){
		fn.mainSlideDelete($(this).closest('tr').data('mainSlideSeq'));
	});
	
	$("#mainSlide_list").on("click","button[name=mainSlideOrderUpBtn]",function(){
		fn.mainSlideOrderModify($(this).closest('tr').data('mainSlideOrder'),'up');
	});
	
	$("#mainSlide_list").on("click","button[name=mainSlideOrderDownBtn]",function(){
		fn.mainSlideOrderModify($(this).closest('tr').data('mainSlideOrder'),'down');
	});
	
	$("#category_list").on("click","input:checkbox",function(){
		fn.uptCategoryDisplayYn($(this));
	});
	
});

var fn = {
		
		mainSlideList : function(){
			
			$.ajax({
				url : '/admin/getMainSlideList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					$.each(res.list,function(i,item){
						if(item.slideDv == 'T'){
							item.slideDv = '텍스트형';
						}else if(item.slideDv == 'F'){
							item.slideDv = '배너형';
						}
						
						if(item.reservationBtnYn == 'Y'){
							item.reservationBtnYn = "사용";
						}else{
							item.reservationBtnYn = "사용안함";
						}
						
						if(item.maintenanceHistoryBtnYn == 'Y'){
							item.maintenanceHistoryBtnYn = "사용";
						}else{
							item.maintenanceHistoryBtnYn = "사용안함";
						}
					});
					
					$("#mainSlide_list").empty();
					$('#mainSlide_list_template').tmpl(res).appendTo('#mainSlide_list');
				}
			});
			
		},
		
		mainSlideAddModalOpen : function(){
			$("#mainSlide-modal form")[0].reset();
			$(".modal-title").text('메인슬라이드 추가');
			$("#mainSlideAdd").show();
			$("#mainSlideModify").hide();
			$("#mainSlideModal_slideDvText").show();
			$("#mainSlideModal_slideDvFile").hide();
			$("#mainSlideModal_bannerFileLabel").show();
			$("#mainSlideModal_bannerFileLabel").text('');
			$("#mainSlideModal_bannerFileModifyLabel").text('');
			$("#mainSlide-modal").modal('show');
		},
		
		mainSlideModifyModalOpen : function(mainSlideSeq){
			
			$.ajax({
				url : '/admin/getMainSlideInfo',
				data : {mainSlideSeq : mainSlideSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					$(".modal-title").text('메인슬라이드 수정');
					$("#mainSlideModify").show();
					$("#mainSlideAdd").hide();
					$("#mainSlideModal_mainSlideSeq").val(res.mainSlideSeq);
					
					if(res.slideDv == 'T'){
						$("input:radio[name=mainSlideModal_slideDv]:radio[value='T']").prop('checked', true);
						$("#mainSlideModal_slideDvText").show();
						$("#mainSlideModal_slideDvFile").hide();
					}else{
						$("input:radio[name=mainSlideModal_slideDv]:radio[value='F']").prop('checked', true);
						$("#mainSlideModal_slideDvFile").show();
						$("#mainSlideModal_slideDvText").hide();
					}
					
					$("#mainSlideModal_topText").val(res.topText);
					$("#mainSlideModal_middleText").val(res.middleText);
					$("#mainSlideModal_bottomText").val(res.bottomText);
					$("#mainSlideModal_bannerFileModifyLabel").text(res.originFileName);
					$("#mainSlideModal_bannerFileModifyLabel").show();
					
					if(res.reservationBtnYn == 'Y'){
						$("#mainSlideModal_reservationBtnYn").prop("checked",true);
					}else{
						$("#mainSlideModal_reservationBtnYn").prop("checked",false);
					}
					
					if(res.maintenanceHistoryBtnYn == 'Y'){
						$("#mainSlideModal_maintenanceHistoryBtnYn").prop("checked",true);
					}else{
						$("#mainSlideModal_maintenanceHistoryBtnYn").prop("checked",false);
					}
					
					$("#mainSlide-modal").modal('show');
				}
			});
			
		},
		
		mainSlideAddModalSlideDvChg :function(slideDv){
			if(slideDv == 'T'){
				$("#mainSlideModal_slideDvFile").hide();
				$("#mainSlideModal_slideDvText").show();
			}else{
				$("#mainSlideModal_slideDvText").hide();
				$("#mainSlideModal_slideDvFile").show();
			}
		},
		
		bannerFileValidation : function(me){
			var banner = $(me).val();
			if(banner != ''){
				var extName = banner.substring(banner.lastIndexOf(".")+1).toUpperCase();
				if(extName != 'JPG' && extName != 'PNG' && extName != 'GIF'){
					alert('배너이미지 확장자는 jpg , png , gif 만 등록할수있습니다');
					return false;
				}
				if($(me)[0].files[0].size > 2097152){
					alert('배너이미지는 2MB 이상 업로드할수없습니다');
					return false;
				}
				
				$("#mainSlideModal_bannerFileModifyLabel").hide();
				$("#mainSlideModal_bannerFileLabel").show();
				
				$("#mainSlideModal_bannerFileLabel").text($(me)[0].files[0].name);
			}
		},
		
		mainSlideValidation : function(){
			
			var result = true;
			
			var slideDv = $("input[name=mainSlideModal_slideDv]:checked").val();
			
			if(slideDv == 'T'){
				
				var topText = $("#mainSlideModal_topText").val();
				var middleText = $("#mainSlideModal_middleText").val();
				var bottomText = $("#mainSlideModal_bottomText").val();
				
				if(topText == ''){
					alert('TOP TEXT를 입력하세요');
					result = false;
					return result;
				}
				
				if(middleText == ''){
					alert('MIDDLE TEXT를 입력하세요');
					result = false;
					return result;
				}
				
				if(bottomText == ''){
					alert('BOTTOM TEXT를 입력하세요');
					result = false;
					return result;
				}
				
			}else if(slideDv == 'F'){
				
				var bannerFileLabel = $("#mainSlideModal_bannerFileLabel").text();
				if(bannerFileLabel == ''){
					alert('배너이미지를 등록하세요');
					result = false;
					return result;
				}
				
			}
			return result;
		},
		
		mainSlideAdd : function(){
			
			if(fn.mainSlideValidation()){
				var slideDv = $("input[name=mainSlideModal_slideDv]:checked").val();
				var topText = $("#mainSlideModal_topText").val();
				var middleText = $("#mainSlideModal_middleText").val();
				var bottomText = $("#mainSlideModal_bottomText").val();
				var bannerFile = $("#mainSlideModal_bannerFile")[0].files[0];
				var reservationBtnYn = '';
				var maintenanceHistoryBtnYn = '';
				
				if($("#mainSlideModal_reservationBtnYn").is(':checked')){
					reservationBtnYn = 'Y';
				}else{
					reservationBtnYn = 'N';
				}
				
				if($("#mainSlideModal_maintenanceHistoryBtnYn").is(":checked")){
					maintenanceHistoryBtnYn = 'Y';
				}else{
					maintenanceHistoryBtnYn = 'N';
				}
				
				var formData = new FormData();
				if(bannerFile != null){
					formData.append("bannerFile", bannerFile);
				}
				formData.append('slideDv',slideDv);
				if(slideDv == 'T'){
					formData.append('topText',topText);
					formData.append('middleText',middleText);
					formData.append('bottomText',bottomText);
				}
				formData.append('reservationBtnYn',reservationBtnYn);
				formData.append('maintenanceHistoryBtnYn',maintenanceHistoryBtnYn);
				
				$.ajax({
					url : '/admin/mainSlideWrite',
					data : formData,
					dataType : 'json',
					type : 'post',
					enctype : 'multipart/form-data',
					processData : false, 
					contentType : false,
					success : function(res){
						if(res.state == 'success'){
							alert('정상 등록되었습니다.');
							fn.mainSlideList();
							$("#mainSlide-modal").modal('hide');
						}else{
							alert('등록에 실패하였습니다. 관리자에게 문의해주세요');
							return false;
						}
					}
				});
			}
			
		},
		
		mainSlideModify : function(){
			
			if(fn.mainSlideValidation()){
				var mainSlideSeq = $("#mainSlideModal_mainSlideSeq").val();
				var slideDv = $("input[name=mainSlideModal_slideDv]:checked").val();
				var topText = $("#mainSlideModal_topText").val();
				var middleText = $("#mainSlideModal_middleText").val();
				var bottomText = $("#mainSlideModal_bottomText").val();
				var bannerFile = $("#mainSlideModal_bannerFile")[0].files[0];
				var reservationBtnYn = '';
				var maintenanceHistoryBtnYn = '';
				
				if($("#mainSlideModal_reservationBtnYn").is(':checked')){
					reservationBtnYn = 'Y';
				}else{
					reservationBtnYn = 'N';
				}
				
				if($("#mainSlideModal_maintenanceHistoryBtnYn").is(":checked")){
					maintenanceHistoryBtnYn = 'Y';
				}else{
					maintenanceHistoryBtnYn = 'N';
				}
				
				var formData = new FormData();
				formData.append('mainSlideSeq',mainSlideSeq);
				if(bannerFile != null){
					formData.append("bannerFile", bannerFile);
				}
				formData.append('slideDv',slideDv);
				if(slideDv == 'T'){
					formData.append('topText',topText);
					formData.append('middleText',middleText);
					formData.append('bottomText',bottomText);
				}
				formData.append('reservationBtnYn',reservationBtnYn);
				formData.append('maintenanceHistoryBtnYn',maintenanceHistoryBtnYn);
				
				$.ajax({
					url : '/admin/mainSlideModify',
					data : formData,
					dataType : 'json',
					type : 'post',
					enctype : 'multipart/form-data',
					processData : false, 
					contentType : false,
					success : function(res){
						if(res.state == 'success'){
							alert('수정되었습니다.');
							fn.mainSlideList();
							$("#mainSlide-modal").modal('hide');
						}else{
							alert('수정에 실패하였습니다. 관리자에게 문의해주세요');
							return false;
						}
					}
				});
			}
			
		},
		
		mainSlideDelete : function(mainSlideSeq){
			
			if(confirm('해당 슬라이드를 삭제하시겠습니까?')){
				$.ajax({
					url : '/admin/mainSlideDelete',
					data : {mainSlideSeq : mainSlideSeq},
					dataType : 'json',
					type : 'post',
					success : function(res){
						if(res.state == 'success'){
							alert('삭제되었습니다');
							fn.mainSlideList();
						}else{
							alert('삭제에 실패하였습니다. 관리자에게 문의해주세요');
							return false;
						}
					}
				});
			}
			
		},
		
		mainSlideOrderModify : function(mainSlideOrder , way){
			
			$.ajax({
				url : '/admin/mainSlideOrderModify',
				data : {mainSlideOrder : mainSlideOrder , mainSlideOrderWay : way},
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.state == 'success'){
						fn.mainSlideList();
					}else{
						alert('순서 변경에 실패하였습니다. 관리자에게 문의해주세요');
					}
				}
			});
			
		},
		
		categoryList : function(){
			
			$.ajax({
				url : '/admin/getCategoryList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#category_list").empty();
					$('#category_list_template').tmpl(res).appendTo('#category_list');
				}
			});
			
		},
		
		uptCategoryDisplayYn : function(me){
			
			var blogCategorySeq = $(me).closest('tr').data('blogCategorySeq');
			var displayYn = '';
			if($(me).is(":checked")){
				displayYn = 'Y';
			}else{
				displayYn = 'N';
			}
			
			$.ajax({
				url : '/admin/uptCategoryDisplayYn',
				data : {blogCategorySeq : blogCategorySeq , displayYn : displayYn},
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.state == 'success'){
						fn.categoryList();
					}
				}
			});
			
		}
		
}