//显示密码界面
function showPwd(){
	$("#info").css({"display":"none"});
	$("#password").css({"display":"block"});
	$("#mypwd").show();
	$("#order").css({"display":"none"});
	$("#myinfo").hide();
	$("#myorder").hide();
}
//显示个人信息界面
function showInfo(){
	$("#password").css({"display":"none"});
	$("#info").css({"display":"block"});
	$("#order").css({"display":"none"});
	$("#mypwd").hide();
	$("#myinfo").show();
	$("#myorder").hide();
}
//显示订单界面
function showOrder(){
	$("#password").css({"display":"none"});
	$("#info").css({"display":"none"});
	$("#order").css({"display":"block"});
	$("#mypwd").hide();
	$("#myinfo").hide();
	$("#myorder").show();
	getOrderList(1);
}

function getOrderList(current){
	$("#order").empty();
	$.ajax({
		url:"myOrder",
		data:{"current":current,"pageCount":"3"},
		type:"post",
		dataType:"json",
		async:false,
		success:function(rs){
		for(var i = 0;i<rs.list.length;i++){
		$("#order").append("<dt class='clearfix'><span class='c-999 fsize14 fl'><tt class='f-fM'>订单号：</tt>" +
				"<tt class='f-fM c-666'>"+rs.list[i].orderNo+"</tt></span><span class='fr u-o-dt-time'><tt class='f-fM'>2017-04-16 21:08</tt></span></dt><dd class='u-order-list'><section class='w50pre disIb vam u-o-left'><div class='mr30 u-o-l-infor'><div class='c-cou-item'><div class=''>" +
						"<div><a href='lessonDetail?classId="+rs.list[i].lesson.classId+"' title='"+rs.list[i].lesson.className+"' class='u-ol-pic'>" +
						"<img src='/images/lesson/"+rs.list[i].lesson.picture+"' alt='"+rs.list[i].lesson.className+"'></a><h6 class='hLh30 txtOf name'>" +
						"<a href='lessonDetail?classId="+rs.list[i].lesson.classId+"'' title='"+rs.list[i].lesson.className+"' class='fsize14 c-666'>[课程订单]&nbsp;"+rs.list[i].lesson.className+"</a></h6><section class='hLh30 txtOf mt10 u-o-l-jg'>" +
						"<span class='c-master fsize16'>￥<font>"+parseFloat(rs.list[i].lesson.price).toFixed(2)+"</font></span></section></div></div></div></div></section><section class='disIb vam u-o-maddile col-2 tac mb20'><div class='disIb vam tac u-o-price'>" +
								"<span class='c-999 f-fM fsize14'>"+rs.list[i].payTime+"</span></div></section><section class='disIb vam col-2 tac mb20 col-2-new'><div class='disIb vam tac u-o-m-zt'><p class='hLh20'><span class='c-green fsize14'>购买成功</span></p></div></section></dd>");
		}
		$("#order").append("<div id = 'clear'></div>");
		$("#clear").pagination({
			totalData : rs.total,
			showData : rs.pageCount,
			isHide : true,
			current : current,
			coping : true,
			homePage : '首页',
			endPage : '末页',
			prevContent : '上页',
			nextContent : '下页',
			callback : function(index) {
				var cur = index.getCurrent();
				getOrderList(cur);
			}
		})
		}	
	})
}

//修改头像
	$("#file").change(function () { 
//		for(var i=0;i<this.files.length;i++){
			var url = window.URL.createObjectURL(this.files[0]);
			$("#img").attr("src",url);	
//			}
			
			var form = document.getElementById("updateInfo");
			var formData = new FormData(form);
			$.ajax({
				url :　"updateHead",
				data: (formData),
				type : "post",
				async: true,  
				processData: false,  // 告诉jQuery不要去处理发送的数据
				contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
				success : function(rs){
					if($.trim(rs) == "false"){
						alert("系统繁忙,稍后再试");
					}else{
					alert("头像修改成功");
					window.location.reload();
					}
				},
				error : function(){
					alert("系统繁忙,请稍后再试");
				}
			});
			
		}); 

	//修改个人信息
function updateUserInfo(){
	//1.验证手机号码
	var tel=$("#phone").val();

	var phone = telConfirm();
	if(!phone){
		return false;
	}
	//2.验证用户名
	var put=document.getElementById("changeShowName");
	var name = namesConfirm(put);
	if(!name){
		return false;
	}
	//3.验证邮箱
//	var em = document.getElementById("u-email");
//	var sp = document.getElementById("sp_email");
//	var ema = email(em,sp);
//	if(!ema){
//		return false;
//	}
	
	var update = $("#update");
	$.ajax({
		url :　"updateinfo",
		data: update.serialize(),
		type : "post",
		async: true,  
		success : function(rs){
			alert("个人信息修改成功")
			window.location.reload();
			
		},
		error : function(){
			alert("系统繁忙,请稍后再试");
		}
	});
	
}

//验证手机号码
function telConfirm(){
	var reg=/^1[3578]\d{9}/;
	var tel=$("#phone").val();
	var tel_span=document.getElementById("tel_span");
	if(tel == ""){
		tel_span.innerHTML="* 手机号码不能为空！";
		tel_span.style.color="red";
		return false;
		}
	if(!reg.test(tel)){
		tel_span.innerHTML="* 请输入正确的手机号码！";
		tel_span.style.color="red";
		return false;
	}
	return true;
}

function namesConfirm(put){
	var loginName=document.getElementById("name");
	if($(put).val() == ""){
		loginName.innerHTML="* 登录名不能为空！";
		loginName.style.color="red";
		return false;
	}
	return true;
}
//em input的dom对象
//sp span的dom对象
function email(em,sp){
	if($(em).val() == ""){
		return true;
	}
	var regex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if( !regex.test($(em).val()) ){
		sp.innerTEXT="* 请输入正确的邮箱！";
		sp.style.color="red";
		return false;
	}
	return true;
}

