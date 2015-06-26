$(document).ready(function(){	
	$('.pack-check').on('ajax:success', function(event, xhr, settings){
		var itemMarker = "#packed-" + xhr.id;
		if(xhr.status === true){
			$(this).html("done");
			$(itemMarker).html("packed!");
			console.log(itemMarker);
		}else{
			$(this).html("got it?");
			$(itemMarker).html("not packed");
			console.log(itemMarker);
		}
	});
});