$(document).ready(function one() {
	$('a.login-window').click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('.btn_close,#mask,a.join-now').on('click', function() {
		alert("on click 11111 ")
	  $('#mask ,.login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	
	return false;
	});
});
$(document).ready(function two() {
	$('a.join-now').click(function() {
		// Add the mask to body
		$('body').append('<div id="mask1"></div>');
		$('#mask1').fadeIn(300);	
		// Getting the variable's value from a link 
		var newloginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(newloginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(newloginBox).height() + 24) / 2; 
		var popMargLeft = ($(newloginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('.btn_close1, #mask1').on('click', function() {
		alert("on click 2 !!!")
	  $('#mask1 ,.login-popup1').fadeOut(300 , function() {
		$('#mask1').remove();  
	}); 
		one();
	return false;
	});


	
	
});
