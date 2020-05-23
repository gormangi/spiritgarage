$(document).ready(function(){
	
	leftFn.renderWelcomeMessage();
	
	leftFn.activeMenu();
	
});

var leftFn = {
		
		renderWelcomeMessage : function(){
			
			$("#left_welcomeMessage").text(mngrInfo.name+'님 환영합니다.')
			
		},
		
		activeMenu : function(){
			
			var activeUrl = $("#activeUrl").val();
			
			$("#spiritAdmMenuList a").removeClass('active');
			
			if(activeUrl == 'mngrManagement'){
				$("#menu_mngrManagement a").addClass('active');
			}else if(activeUrl == 'reservationManagement'){
				$("#menu_reservationManagement a").addClass('active');
			}else if(activeUrl == 'noticeManagement'){
				$("#menu_noticeManagement a").addClass('active');
			}else if(activeUrl == 'noticeReg'){
				$("#menu_noticeManagement a").addClass('active');
			}
			
		}
		
}