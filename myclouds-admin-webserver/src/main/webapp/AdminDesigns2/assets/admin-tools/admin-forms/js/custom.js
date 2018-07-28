'use strict'; 
//  Author: AdminDesigns.com
// 
//  This file is reserved for changes made by the user 
//  as it's often a good idea to seperate your work from 
//  the theme. It makes modifications, and future theme
//  updates much easier 
// 

//  Place custom scripts below this line 
///////////////////////////////////////
(function($) {

	var cPicker = '<div class="demo-cpicker"><div class="bg-primary"></div><div class="bg-success"></div><div class="bg-info"></div><div class="bg-warning"></div><div class="bg-danger"></div><div class="bg-alert"></div><div class="bg-system"></div><div class="bg-dark active"></div></div>'
	$('.admin-form .container').addClass('posr').append(cPicker);

	$('.admin-form').append('<div class="admin-form-bg"></div>');

	// On-Click skin switcher function
	$('.demo-cpicker > div').on('click',function() {

		// Apply active class to menu
		$(this).siblings('div').removeClass('active').end().addClass('active');

		// Cache some dom elements
		var color = $(this).attr('class').slice(3),
			panel = $('.admin-form').find('.panel'),
			options = $('.admin-form').find('.option'),
			switchs = $('.admin-form').find('.switch'),
			buttons = $('.admin-form').find('.button');

		// Manually swap themes on all relevant elements	
		$('body').removeClass().addClass('admin-form theme-' + color);
		options.removeClass().addClass('option option-' + color);
		switchs.removeClass().addClass('switch switch-' + color);
		buttons.removeClass().addClass('button btn-' + color);

		// Manually swap header theme
		if (panel.hasClass('panel-alt')) {
			panel.removeClass().addClass('panel panel-alt panel-' + color);
		} 
		else {
			panel.removeClass().addClass('panel panel-' + color);
		}

	});

})(jQuery);
