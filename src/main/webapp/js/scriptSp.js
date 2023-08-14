$(function(){
	$('.products-seen>.owl-carousel').owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		dots:false,
		navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
		responsive:{
			0:{
				items:2,
				nav:true
			},
			600:{
				items:2,
				nav:true
			},
			1000:{
				items:5,
				nav:true,
				loop:true
			}
		}
	});
	$('.homeSlider>.owl-carousel').owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		dots:false,
		navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
		responsive:{
			0:{
				items:1,
				nav:true
			},
			600:{

				items:1,
				nav:true
			},
			1000:{
				items:1,
				nav:true,
				loop:true
			}
		}
	});
	$('.menu-multi').siblings().css('display','none');

	$('.menu-multi').click(function(){
		$(this).siblings().slideToggle('show');
	});
	$('.dropdown-item').click(function(){
		$('.option-customs').html($(this).html());

	});
	$('.fa-bars').click(function(){
		$('.menu-multi-mobile').show();
		$('.overplay').show();
	});
	$('.fa-times').click(function(){
		$('.menu-multi-mobile').hide();
		$('.overplay').hide();

	});


});
