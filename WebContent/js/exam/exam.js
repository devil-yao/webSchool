
var time = 899;
var flag = true;
function setTime() {
	setInterval(function() {
		if(time == -1){
			flag=false;
			showScore();
		}
		if (flag) {
			var min = parseInt(time / 60);
			var ss = time % 60;
			var msg = "" + min + "分" + ss + "秒";
			$("#timer").text(msg);
			time = time - 1;
		}
	}, 1000);
	
}

function stop(){
	$("#dialog").css("background-image"," url('images/exam/xiuxi.jpg')")
	flag = false;
	$("#dialog").dialog({
		autoOpen:false,		//自动打开
		modal :true,		//模式窗口 其他内容不可点击
		draggable : false,		//是否可以拖动
		closeOnEscape :false,	//按esc退出
	    bgiframe: true,			//兼容ie6
	    resizable: false,	//大小是否可变
	    title:"暂停",
	    height:200,
//	    width:auto,
	    overlay: {
	        backgroundColor: '#000',
	        opacity: 0.5
	    },
	    buttons: {
	        '继续答题': function() {
	        	flag=true;
	            $(this).dialog('close');
	        }
	    }
	});
	$("#dialog").siblings('div.ui-dialog-titlebar').remove();
	$("#dialog").dialog("open");
}

function submitAnswer(){
	$("#dia").css("background-image"," url('images/exam/submit.png')")
	flag=false;
	$("#dia").dialog({
		autoOpen:false,		//自动打开
		modal :true,		//模式窗口 其他内容不可点击
		draggable : false,		//是否可以拖动
		closeOnEscape :false,	//按esc退出
	    bgiframe: true,			//兼容ie6
	    resizable: false,	//大小是否可变
//	    title:"暂停",
	    width:240,
	    overlay: {
	        backgroundColor: '#000',
	        opacity: 0.5
	    },
	    buttons: {
	        '确认': function() {
	        	$(".prevent").removeAttr("onclick");
	        	showScore();
	        	$(this).dialog('close');
	        	
	        },
	        '取消':function(){
	        	flag=true;
	        	$(this).dialog('close');
	        }
	    }
	});
	$("#dia").siblings('div.ui-dialog-titlebar').remove();
	$("#dia").dialog("open");
}

function showScore(){
	$(".prevent").removeAttr("onclick");
	var all = $(":radio").length/4;
	var total = all;
	var item = $(":radio:checked");
	var score = total-(all - item.length);
	for(var i = 0;i<item.length;i++){
		var answer = document.getElementById(item[i].name).value;
		var userAnswer = item[i].value;
		if(answer != userAnswer ){
			score=score-1;
		}
	}
	$("input:hidden").attr("type","text");
	$("input:radio").attr("disabled","disabled");
	$("#score").text("得分:"+score*10);
}
$(function(){
	setTime();
})

