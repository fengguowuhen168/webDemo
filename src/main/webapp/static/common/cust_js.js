
$(document).ready(function() {
	
	/* fold and unfold switch  */
	
	$('.accordion-head').on('click', function () {
		$(this).find('.arrow-down').toggleClass('hidden');
	    $(this).find('.arrow-up').toggleClass('hidden');
	})

	/* checkbox image switch */
    $(".checkbox1").click(function(){
	    $(this).toggleClass('checked');
	});
	
});



	

		
