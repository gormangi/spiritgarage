$(document).ready(function(){
	
	fn.init();
	
});

var fn = {
		
		map : null,
		
		marker : null,
		
		init : function(){
			
			map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(37.403016, 126.769350),
				zoom: 16,
				scaleControl : true,
				zoomControl : true,
				mapTypeControl : true
			});
			
			marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(37.403016, 126.769350),
				map: map,
				icon: {
					url: '/images/user/spiritgarage50.jpg',
					size: new naver.maps.Size(50, 50),
					origin: new naver.maps.Point(0, 0),
					anchor: new naver.maps.Point(11, 35)
				}
			});
			
		}
		
}