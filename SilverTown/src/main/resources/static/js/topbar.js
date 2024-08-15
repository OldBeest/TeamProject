// 상단 메뉴 관련
$(function(){
	$('.header > .header-inner > .top-menu-bar > ul > li').mouseenter(function(){
	    $(this).addClass('active');
		console.log("active")
	    $(this).find('> a').addClass('active');
	});

	$('.header > .header-inner > .top-menu-bar > ul > li').mouseleave(function(){
	    $(this).removeClass('active');
	    $(this).find('> a').removeClass('active');
	});

	// 상단 2차 메뉴 배경
	$('.header > .header-inner > .top-menu-bar > ul > .menu-1').mouseenter(function(){
	    $('.sub-menu-bg').css('height','180px');
	});
	$('.header > .header-inner > .top-menu-bar > ul > .menu-1').mouseleave(function(){
	    $('.sub-menu-bg').css('height','');
	});
	
	
	$('.header > .header-inner > .top-menu-bar > ul > .menu-2').mouseenter(function(){
	    $('.sub-menu-bg').css('height','');
	});
	$('.header > .header-inner > .top-menu-bar > ul > .menu-2').mouseleave(function(){
	    $('.sub-menu-bg').css('height','');
	});
	

	$('.header > .header-inner > .top-menu-bar > ul > .menu-3').mouseenter(function(){
	    $('.sub-menu-bg').css('height','164px');
	});
	$('.header > .header-inner > .top-menu-bar > ul > .menu-3').mouseleave(function(){
	    $('.sub-menu-bg').css('height','');
	});

	$('.header > .header-inner > .top-menu-bar > ul > .menu-4').mouseenter(function(){
	    $('.sub-menu-bg').css('height','150px');
	});
	$('.header > .header-inner > .top-menu-bar > ul > .menu-4').mouseleave(function(){
	    $('.sub-menu-bg').css('height','');
	});
	
	
	$('.header > .header-inner > .top-menu-bar > ul > .menu-5').mouseenter(function(){
	    $('.sub-menu-bg').css('height','');
	});
	$('.header > .header-inner > .top-menu-bar > ul > .menu-5').mouseleave(function(){
	    $('.sub-menu-bg').css('height','');
	});
	
});



// 로그인 박스