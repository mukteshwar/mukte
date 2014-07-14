$(document).ready(function() {
	$('.dl_btn a').click(function(){
		$(this).next("ul").toggle();
	});	
	$('.dl_btn ul, .dl_btn').mouseleave(function(){
		$('.dl_btn ul').hide();
	});
	
	/* Account Settings*/
	$("li a.active img.inactive").hide("");
	$("li a.active img.active").show("");
	
	$(".acc_info").click(function() {				
		$(".loglink").toggle();
		$(this).toggleClass("selected");	
	});
	$('.loglink').mouseleave(function(){
		$(this).hide();
		$('.acc_info').toggleClass("selected");
	});
});	
