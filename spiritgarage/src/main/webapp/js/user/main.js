$(document).ready(function(){
	fn.init();
});

var fn = {
		init : function(){
			fn.getBlogInfoList();
		},
		
		getBlogInfoList : function(){
			
			$.ajax({
				url : '/main/getBlogInfoList',
				dataType : 'json',
				type : 'post',
				success : function(res){
					console.log(res);
					$("#blog_area").empty();
					$("#blog_area_template").tmpl(res).appendTo("#blog_area");
				}
			});
			
		}
}