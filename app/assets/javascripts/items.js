$(document).ready(function(){	
	$('.pack-check').on('ajax:success', function(event, xhr, settings){
		var itemId = "#packed_" + xhr.id;
		var imgId = "#pack_img_" + xhr.id;
		if(xhr.status === true){
			$(imgId).attr("src", "/assets/checked.png");
			$(itemId).html("packed!").removeClass("text-danger").addClass("text-primary");
		}else{
			$(imgId).attr("src", "/assets/unchecked.png");
			$(itemId).html("not packed").removeClass("text-primary").addClass("text-danger");
		}
	});
});