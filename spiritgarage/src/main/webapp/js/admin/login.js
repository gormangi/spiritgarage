$(document).ready(function(){
	
	$("#loginBtn").on("click",function(){
		fn.login();
	});
	
	$("#password").on("keypress",function(e){
		if(e.keyCode == 13){
			fn.login();
		}
	});
	
});

var fn = {
		
		login : function(){
			
			var id = $("#id").val();
			var password = $("#password").val();
			
			if(id == null || id.length == 0 || id == ''){
				alert('아이디를 입력하세요');
				$("#id").focus();
				return false;
			}
			
			if(password == null || password.length == 0 || password == ''){
				alert('비밀번호를 입력하세요');
				$("#password").focus();
				return false;
			}
			
			$.ajax({
				url : '/admin/loginValidation',
				data : {id : id , password : password},
				dataType : 'json',
				type : 'post',
				success : function(res){
					
					if(res.result == 'fail'){
						alert(res.resultString);
					}else if(res.result == 'success'){
						document.location.href = '/admin/mngrManagement';
					}
				}
			});
			
		}
		
}