/* ---------------------------------------------------- */
/* Login Check				                    */
/* ---------------------------------------------------- */
var abc;
function man() {
var user=document.login_frm.login.value;
var pass=document.login_frm.password.value;
	if(user=='' || pass=='') {
		alert('Username/Password can not be blank.');
		document.login_frm.login.focus();
		return;
    }
		else if ((user=="admin") && (pass=="admin")){
			document.location.href='index.html';
		return true;
		}
		else if ((user=="delhi") && (pass=="delhi")){
			document.location.href='delhi.html';
		return true;
		}
		else if ((user=="configure") && (pass=="configure")){
			document.location.href='configure-advertiser.html';
		return true;
		}
		else if ((user=="network") && (pass=="network")){
			document.location.href='customer-activation.html';
		return true;
		}
	else {
		alert('Invalid Username/Password.');
		document.login_frm.login.focus();
		return false;
		}
}


$(document).ready(function() {
	$('.flright a').click(function(){
		$(this).next("ul").toggle();
	});	
	$('.flright ul').mouseleave(function(){
		$(this).hide();
	});
});	
