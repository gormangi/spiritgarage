$(document).ready(function(){
	
	fn.init();
	
});

var fn = {
		
		init : function(){
			
			var map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(37.403016, 126.769350),
				zoom: 13,
				minZoom: 7,
				zoomControl: true,
				draggable: true,
				pinchZoom: true,
				scrollWheel: true,
				keyboardShortcuts: true,
				disableDoubleTapZoom: false,
				disableDoubleClickZoom: false,
				disableTwoFingerTapZoom: false
			});
			
			var marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(37.403016, 126.769350),
				map: map,
				icon: {
					url: '/images/user/spiritgarage50.png',
					size: new naver.maps.Size(50, 50)
				}
			});
			
		}
		
}