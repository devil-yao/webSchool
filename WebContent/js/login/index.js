window.onload = cambiar_login();

function cambiar_login() {
	
	var span = document.getElementsByTagName("span");
	for(var i=0;i<span.length;i++){
		span[i].innerHTML="";
	}
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
	document.querySelector('.cont_form_login').style.display = "block";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.opacity = "1";
	}, 400);

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
	}, 200);
}

function cambiar_sign_up() {
	var span = document.getElementsByTagName("span");
	for(var i=0;i<span.length;i++){
		span[i].innerHTML="";
	}
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
	document.querySelector('.cont_form_sign_up').style.display = "block";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.opacity = "1";
	}, 100);

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.display = "none";
	}, 400);

}
