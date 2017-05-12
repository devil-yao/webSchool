//验证手机号码
function telConfirm(){
	var reg=/^1[3578]\d{9}/;
	var tel=$("#tel").val();
	var tel_span=document.getElementById("tel_span");
	if(tel.trim() == ""){
		tel_span.innerHTML="* 手机号码不能为空！";
		tel_span.style.color="red";
		return false;
		}
	if(!reg.test(tel)){
		tel_span.innerHTML="* 请输入正确的手机号码！";
		tel_span.style.color="red";
		return false;
	}else{
		var flag = false;
		//手机号码格式正确，判断是否
		$.ajax({
			url : "regin",
			type : "post",
			data :{"phone" : tel},
			async : false,
			success:function(rs){
//				alert(rs)
				if(rs.trim() == 'true'){
					flag = false;
					tel_span.innerHTML="* 手机号码已存在！";
					tel_span.style.color="red";
				}else {
					flag = true;
					tel_span.innerHTML="";
				}
			}
		});
		return flag;
	}
}

function namesConfirm(put){
	var loginName=document.getElementById("name");
	if($(put).val().trim() == ""){
		loginName.innerHTML="* 登录名不能为空！";
		loginName.style.color="red";
		return false;
	}
	var flag = false;
	$.ajax({
		url : "regin",
		type : "post",
		data :{"loginName" : put.value},
		async : false,
		success:function(rs){
			if(rs.trim() == "true"){
				flag = false;
				loginName.innerHTML="* 用户名已存在！";
				loginName.style.color="red";
			}else {
				flag = true;
				loginName.innerHTML="";
			}
		}
	
	});
	return flag;
}

$pwd = $("#reg_pwd");
$pwd_span = $("#reg_span");
$pwd.blur(function(){
	p();
})
//测试密码强度函数
var p = function(){
	var pwd1 = /[a-zA-Z]+/;		//字母
	var pwd2 = /\d+/;			//数字
	var pwd3 = /\W+/;			//特殊符号
	var count = 0;
	if($pwd.val().trim().length<6){
		$pwd_span.html("* 请输入至少六位密码");
		$pwd_span.css({"color":"red"});
		return false;
	}
	if(pwd1.test($pwd.val())){
		count++;
	}
	if(pwd2.test($pwd.val())){
		count++;
	}
	if(pwd3.test($pwd.val())){
		count++;
	}
	switch (count){
			case 1:
				$pwd_span.html("* 密码强度太弱");
				$pwd_span.css({"color":"red"});
				return false;
			case 2:
				$pwd_span.html("* 密码强度中");
				$pwd_span.css({"color":"#33FF00"});
				return true;
			case 3:
				$pwd_span.html("* 密码强度强");
				$pwd_span.css({"color":"green"});
				return true;
	}
	
};

function confirmpwd(){
	var con = $("#confirmPassword").val().trim();
	var pwd = $("#reg_pwd").val().trim();
	if(con == pwd){
		$("#confirm").html("");
		return true;
	}else{
		$("#confirm").html("两次密码输入不同!!");
		$("#confirm").css("color","red");
		return false;
	}
}

function regin(){
	var telVal=document.getElementById("tel").value;
	var put=document.getElementById("loginName");
	
	var tel = telConfirm(); //手机号码验证
	if(!tel){
		return false;
	}
	var loginName = namesConfirm(put);	//登录名验证
	if(!loginName){
		return false;
	}
	var pwd = p();
	if(!pwd){
		return false;
	}
	var confirm = confirmpwd();
	if(!confirm){
		return false;
	}
	if(tel & loginName & pwd & confirm){
		$.ajax({
			url:"regUser",
			data:{
				phone:telVal,
				loginName:$("#loginName").val(),
				password:$pwd.val()
			},
		async:true,
		type:"post",
		success:function(rs){
			if(rs.trim() == "true"){
				alert("注册成功");
				cambiar_login();
			}else {
				alert("注册失败");
			}
		},
		error:function(){
			alert("注册失败");
		}
		});
	}
}