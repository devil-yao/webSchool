window.onload=function(){
	code = new GVerify({
		id:"contain"
	});
	
}
function confirm(cap){
	if(cap.value == ""){return false;}
	var flag = code.validate(cap.value);
	$("#cp").html("");
	if(flag){
//		$("#cp").html("zhengque");
		
	}else{
		$("#cp").html("验证码错误");
		code.refresh();
		$("#cp").css("color","red");
		$("#cp").css("text-align","left");
		$("#cp").css("padding-left","30px");
		
	}
	return flag;
}
//$("#submitlogin").click(function(){
function login(){

	var cap = document.getElementById("capcha");
	var p = confirm(cap);
//	alert(p);
	if(cap.value == ""){
		$("#cp").html("验证码不能为空");
		$("#cp").css("color","red");
		$("#cp").css("text-align","left");
		$("#cp").css("padding-left","30px");
		return false;
	}
	if(!p){
		return false;
	}
	$("#error").empty();
	$.ajax({
		url:"loginConfirm",
		data:{"phone":$("#phone").val(),"password":$("#password").val()},
		type:"post",
		async:false,
		success:function(rs){
			switch ($.trim(rs)) {
			case "1":
				window.location.href=document.referrer;
				break;

			case "2":
				$("#error").text("用户名密码错误");
				code.refresh();
				break;
			case "3":
				alert("该用户已被冻结，请联系管理员");
				code.refresh();
				break;
			}
			
		}
	})
}
$(function(){
	 $("#submitlogin").click(function(){
		login();
	})
	document.onkeydown = function(event){
		 var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
					if (keyCode == 13) {
						login();
						return false;
					}
	 }
	
})


