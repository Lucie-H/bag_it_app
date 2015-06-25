function checked(){
	$('.item-check').on('change'){
		console.log("checked")
		$.ajax({
     url: window.location.href + "/items" + this.value + "/submit.json",
     method: "PATCH",
     data: { status: this.status },
     success: 
   });		
	}
} 