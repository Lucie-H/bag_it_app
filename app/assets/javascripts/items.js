$(document).ready(function(){	
	$('.pack-check').on('ajax:success', function(event, xhr, settings){
		var itemId = "#packed_" + xhr.id;
		var imgId = "#pack_img_" + xhr.id;
		if(xhr.status === true){
			$(imgId).attr("src", "/assets/button_packed.png");
			$(itemId).html("packed!");
		}else{
			$(imgId).attr("src", "/assets/button_unpacked.png");
			$(itemId).html("not packed");
		}
	});
});