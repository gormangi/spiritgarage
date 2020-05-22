$(document).ready(function(){
	
	fn.getMngrManagementList();
	
	fn.onValidation();
	
	$("#mngrAddBtn").on("click",function(){
		$("#mngrAdd-modal form")[0].reset();
		$("#mngrAdd-modal").modal('show');
	});
	
	$("#mngrAdd").on("click",function(){
		$("#mngrAddForm").submit();
	});
	
	$("#passwordConfirm").on("keypress",function(e){
		if(e.keyCode == 13){
			$("#mngrAddForm").submit();
		}
	});
	
	$("#mngrModify").on("click",function(){
		$("#mngrModifyForm").submit();
	});
	
	$("#modify_passwordConfirm").on("keypress",function(e){
		if(e.keyCode == 13){
			$("#mngrModifyForm").submit();
		}
	});
	
	$("#mngr_list").on("click","button[name=mngrModifyBtn]",function(){
		fn.openMngrModify($(this).closest('tr').data('mngrSeq'));
	});
	
	$("#mngr_list").on("click","button[name=mngrUseStopBtn]",function(){
		fn.mngrUseModify($(this).closest('tr').data('mngrSeq') , 'N');
	});
	
	$("#mngr_list").on("click","button[name=mngrUseActiveBtn]",function(){
		fn.mngrUseModify($(this).closest('tr').data('mngrSeq') , 'Y');
	});
	
});

var fn = {
		
		blockPostCnt : '10',
		
		getMngrManagementList : function(nowPageNumber){
			
			$.ajax({
				url : '/admin/getMngrManagementList',
				dataType : 'json',
				type : 'post',
				data : {
					nowPageNumber : nowPageNumber,
					blockPostCnt : fn.blockPostCnt
				},
				success : function(res){
					
					$("#mngr_list").empty();
					$('#mngr_list_template').tmpl(res).appendTo('#mngr_list');
					fn.incPaging(res.paging);
				}
			});
			
		},
		
		incPaging : function(paging){
			
			var html = [];
			if(paging.nowPageNumber != 1){
				html.push('<li class="page-item"><a href="javascript:fn.getMngrManagementList('+(paging.nowPageNumber - 1)+')" class="page-link">&laquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&laquo;</a></li>');
			}
			
			for(var i=paging.startPageNumber; i<=paging.endPageNumber; i++){
				if(i == paging.nowPageNumber){
					html.push('<li class="page-item active"><a href="javascript:fn.getMngrManagementList('+i+')" class="page-link">'+i+'</a></li>');
				}else{
					html.push('<li class="page-item"><a href="javascript:fn.getMngrManagementList('+i+')" class="page-link">'+i+'</a></li>');
				}
			}
			
			if(paging.nowPageNumber != paging.totPageNumber){
				html.push('<li class="page-item"><a href="javascript:fn.getMngrManagementList('+(paging.nowPageNumber + 1)+')" class="page-link">&raquo;</a></li>');
			}else{
				html.push('<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">&raquo;</a></li>');
			}		
			$("#mngr_pagination").html(html.join(''));
		},
		
		mngrAdd : function(){
			
			$.ajax({
				url : '/admin/mngrAdd',
				type : 'post',
				dataType : 'json',
				data : {
					id : $("#id").val(),
					name : $("#name").val(),
					password : $("#password").val()
				},
				success : function(res){
					if(res){
						alert('신규 관리자가 등록되었습니다.');
						$("#mngrAdd-modal").modal('hide');
					}else{
						alert('관리자 등록에 실패했습니다.');
						return false;
					}
				}
			});
			
		},
		
		mngrModify : function(){
			
			$.ajax({
				url : '/admin/mngrModify',
				type : 'post',
				dataType : 'json',
				data : {
					mngrSeq : $("#modify_mngrSeq").val(),
					id : $("#modify_id").val(),
					name : $("#modify_name").val(),
					password : $("#modify_password").val()
				},
				success : function(res){
					if(res){
						alert('관리자 정보가 수정되었습니다');
						$("#mngrModify-modal").modal('hide');
						fn.getMngrManagementList();
					}else{
						alert('관리자 수정에 실패했습니다.');
						return false;
					}
				}
			});
			
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
			
			$("#mngrAddForm").validate({
				rules: {
					id : {
						required : true,
						userIdCheck : true,
						minlength : 5,
						maxlength : 19,
						remote : {url :"/admin/mngrAddIdDupCheck"}
					},
					name : {
						required : true,
						userNameCheck : true,
						remote : {url :"/admin/mngrAddNameDupCheck"}
					},
					password : {
						required : true,
						passwordCheck : true
					},
					passwordConfirm : {
						required : true,
						equalTo : '#password'
					}
				},
				messages: {
					id : {
						required : "아이디를 입력해주세요",
						userIdCheck : "아이디는 영문자로 시작하는 영문자 또는 숫자 조합으로 입력하세요",
						minlength : "아이디는 5~19자리로 입력하세요",
						maxlength : "아이디는 5~19자리로 입력하세요",
						remote : '사용중인 아이디입니다'
					},
					name : {
						required : "이름을 입력해주세요",
						userNameCheck : "이름은 2~20자 내로 입력하세요",
						remote : '사용중인 이름입니다'
					},
					password : {
						required : "비밀번호를 입력해주세요",
						passwordCheck : "비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리로 입력해주세요"
					},
					passwordConfirm : {
						required : "비밀번호 확인란을 입력해주세요",
						equalTo : "비밀번호가 일치하지않습니다"
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
					if(confirm("입력하신 정보로 관리자를 등록하시겠습니까?")){
						fn.mngrAdd();
					}
				}
			});
			
			$("#mngrModifyForm").validate({
				rules: {
					modify_id : {
						required : true,
						userIdCheck : true,
						minlength : 5,
						maxlength : 19
					},
					modify_name : {
						required : true,
						userNameCheck : true
					},
					modify_password : {
						passwordCheck : true
					},
					modify_passwordConfirm : {
						equalTo : '#modify_password'
					}
				},
				messages: {
					modify_id : {
						required : "아이디를 입력해주세요",
						userIdCheck : "아이디는 영문자로 시작하는 영문자 또는 숫자 조합으로 입력하세요",
						minlength : "아이디는 5~19자리로 입력하세요",
						maxlength : "아이디는 5~19자리로 입력하세요"
					},
					modify_name : {
						required : "이름을 입력해주세요",
						userNameCheck : "이름은 2~20자 내로 입력하세요"
					},
					modify_password : {
						passwordCheck : "비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리로 입력해주세요"
					},
					modify_passwordConfirm : {
						equalTo : "비밀번호가 일치하지않습니다"
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
					if(confirm("입력하신 정보로 관리자를 수정하시겠습니까?")){
						fn.mngrModify();
					}
				}
			});
		},
		
		openMngrModify : function(mngrSeq){
			
			$.ajax({
				url : '/admin/getMngrInfo',
				data : {mngrSeq : mngrSeq},
				dataType : 'json',
				type : 'post',
				success : function(res){
					$("#modify_mngrSeq").val(res.mngrSeq);
					$("#modify_id").val(res.id);
					$("#modify_name").val(res.name);
					$("#mngrModify-modal").modal('show');
				}
			});
		},
		
		mngrUseModify : function(mngrSeq , useYn){
			
			$.ajax({
				url : '/admin/mngrUseModify',
				data : {mngrSeq : mngrSeq , useYn : useYn},
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res){
						if(useYn == 'N'){
							alert('사용중지 되었습니다');
						}else{
							alert('복구되었습니다');
						}
						fn.getMngrManagementList();
					}
				}
			});
			
		}
		
}