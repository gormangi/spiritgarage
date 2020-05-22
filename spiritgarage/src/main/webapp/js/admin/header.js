$(document).ready(function(){
	
	$("#logoutBtn").on("click",function(){
		headerFn.logout();
	});
	
});

var headerFn = {
		
		logout : function(){
			document.location.href = "/admin/logout";
		}
		
}