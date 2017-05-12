//测试密码强度函数
function pwd(){
	var $pwd = $("#pwd");
	var $pwd_span = $("#span-pwd");
	var pwd1 = /[a-zA-Z]+/;		//字母
	var pwd2 = /\d+/;			//数字
	var pwd3 = /\W+/;			//特殊符号
	var count = 0;
	if($pwd.val().trim().length<6){
		$pwd_span.html("* 请输入至少六位密码");
		$pwd_span.css({"color":"red"});
		return false;
	}
	if(pwd1.test($pwd.val().trim())){
		count++;
	}
	if(pwd2.test($pwd.val().trim())){
		count++;
	}
	if(pwd3.test($pwd.val().trim())){
		count++;
	}
	switch (count){
			case 1:
				$pwd_span.html("* 密码强度太弱");
				$pwd_span.css({"color":"red"});
				return false;
			case 2:
				$pwd_span.html("");
				return true;
			case 3:
				$pwd_span.html("");
				return true;
	}
	
};

function confirmpwd(){
	var con = $("#pwd").val().trim();
	var pwd = $("#confirmPwd").val().trim();
	if(pwd == ""){
		$("#span-confirmPwd").html("请再次输入密码!!");
		$("#span-confirmPwd").css("color","red");
		return false;
	}
	if(con == pwd){
		$("#span-confirmPwd").html("");
		return true;
	}else{
		$("#span-confirmPwd").html("两次密码输入不同!!");
		$("#span-confirmPwd").css("color","red");
		return false;
	}
}

function updatePwd(){
	var p = pwd();
	var old = $("#oldPassword").val();
	if(old.trim() == ""){
		$("#span_old").html("旧密码不能为空!!");
		return false;
	}
	if(!p){
		return false;
	}
	var confirm = confirmpwd();
	if(!confirm){
		return false;
	}
	$.ajax({
		type:"post",
		url:"updatePwd",
		data : $("#pwdForm").serialize(),
		dataType : "json",
		async:true,
		success:function(rs){
//			if(rs.code == 1){
//				
//			}else if(rs.code == 2){
//				
//			}else if(rs.code == 3){
//				
//			}
			alert(rs.desc);
		}
	});
}
