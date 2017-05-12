function showSubjectList(){
	$("#ztreedemo").css("display","block")
}
function change(file){
	var url = window.URL.createObjectURL(file.files[0]);
	$("#subjcetpic").attr("src",url)
}

function show(msg){
	document.getElementById("subjectId").value=msg.title;
	$("#ztreedemo").css("display","none");
	$("#id").val(msg.dataset.id)
	}
//<input type="hidden" name="teacher.subjectId" value="0">
$(function(){
//	subjectId
	$.ajax({
		url:"getCate",
		type:"post",
		dataType:"json",
		success:function(rs){
			/* "cateName":"Java ","id":1,"parentId":0 */
			if(rs != null && rs.length>0){
				for(var i = 0;i<rs.length;i++){
					$("#ztreedemo").append("<li id='ztreedemo_"+i+"' class='level0' tabindex='0' hidefocus='true' ><span id='ztreedemo_"+i+"_switch' class='button level0 switch roots_docu' ></span><a onclick='show(this)' data-id='"+rs[i].id+"' title='"+rs[i].cateName+"' id='ztreedemo_"+i+"_a' class='level0'><span id='ztreedemo_"+i+"_ico' class='button ico_docu'></span><span id='ztreedemo_"+i+"_span'>"+rs[i].cateName+"</span></a></li>")
				}
			}
		}
	})
		$("#input-block").blur(function(){
			$("#ztreedemo").css("display","none")
		}) 
		$("#ztreedemo").focus(function(){
			$("#ztreedemo").css("display","block")
		})
})
function sub(){
	var flag = false;
	$("input[type != file]").each(function(){
		if(this.value == null || this.value == "" || this.value == undefined){
			flag = true;
		}
	})
	if(flag){
	alert("必填项不能为空")
	}else{
		$("#saveTeacherForm").submit();
	}
//	$("#saveTeacherForm").submit();
}
