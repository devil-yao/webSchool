function gg(bn){
	var patt1 = new RegExp("^[1-9]\d*$");
	var val = bn.value;
	if(val == ""){
		$("#video_parent").css({"display":"none"})
		return false;
	}
	if( isNaN(val) || !patt1.test(val) ){
		alert("请输入正确的课时数")
		$("#video_parent").css({"display":"none"})
		return false;
	}
	if(parseInt(val) == 0){
		$("#video_parent").css({"display":"none"})
		alert("至少需要一课时")
		return false;
	}
	return true;
}	
function show(bn){
		$("#video_div").empty();
		var patt1 = new RegExp("^[1-9]\d*$");
		var val = bn.value;
		if(val == ""){
			$("#video_parent").css({"display":"none"})
			return false;
		}
		if( isNaN(val) || !patt1.test(val) ){
			alert("请输入正确的课时数")
			$("#video_parent").css({"display":"none"})
			return false;
		}
		if(parseInt(val) == 0){
			$("#video_parent").css({"display":"none"})
			alert("至少需要一课时")
			return false;
		}
		$("#video_parent").css({"display":"block"})
		for(var i = 1;i<=parseInt(val);i++ ){
			$("#video_div").append("<div class='layui-input-block '></div><font>课时"+i+":</font><input class='layui-input layui-input-6' placeholder='请输入课时名' name='chapter_"+i+"'><input class='ke-upload-file'  type='file' name='video_"+i+"' accept='video/mp4'>")
		}
		return true;
	}
	function judgePrice(pri){
		var price = pri.value;
		if(price == ""){
			return false;
		}
		if(isNaN(price)){
			alert("请输入正确的价格")
			return false;
		}
		return true;
	}
	function sub(){
		var flag = false;
		$("input").each(function(){
			if(this.value == null || this.value == "" || this.value == undefined){
				flag = true;
			}
		})
		if(flag){
		alert("必填项不能为空")
		}else{
			var num = document.getElementById("num");
			var price = document.getElementById("price");
			var ju = gg(num);
			var pri = judgePrice(price);
			if(ju && pri){
				$("#saveTeacherForm").submit();
			}
			
		}
	}
	function showMsg(msg){
		document.getElementById("subjectId").value=msg.title;
		$("#ztreedemo").css("display","none");
		$("#id").val(msg.dataset.id)
		}
	function showTeacher(msg){
		document.getElementById("teacher").value=msg.title;
		$("#ztree").css("display","none");
		$("#techId").val(msg.dataset.id)
	}
	$(function(){
//		subjectId
		$.ajax({
			url:"getCate",
			type:"post",
			dataType:"json",
			async:false,
			success:function(rs){
				/* "cateName":"Java ","id":1,"parentId":0 */
				if(rs != null && rs.length>0){
					for(var i = 0;i<rs.length;i++){
						$("#ztreedemo").append("<li id='ztreedemo_"+i+"' class='level0' tabindex='0' hidefocus='true' ><span id='ztreedemo_"+i+"_switch' class='button level0 switch roots_docu' ></span><a onclick='showMsg(this)' data-id='"+rs[i].id+"' title='"+rs[i].cateName+"' id='ztreedemo_"+i+"_a' class='level0'><span id='ztreedemo_"+i+"_ico' class='button ico_docu'></span><span id='ztreedemo_"+i+"_span'>"+rs[i].cateName+"</span></a></li>")
					}
				}
			}
		})
		$.ajax({
			url:"getTeacher",
			type:"post",
			dataType:"json",
			async:false,
			success:function(rs){
				/* "cateName":"Java ","id":1,"parentId":0 */
				if(rs != null && rs.length>0){
					for(var i = 0;i<rs.length;i++){
						$("#ztree").append("<li id='ztreedemo_"+i+"' class='level0' tabindex='0' hidefocus='true' ><span id='ztreedemo_"+i+"_switch' class='button level0 switch roots_docu' ></span><a onclick='showTeacher(this)' data-id='"+rs[i].id+"' title='"+rs[i].login_name+"' id='ztreedemo_"+i+"_a' class='level0'><span id='ztreedemo_"+i+"_ico' class='button ico_docu'></span><span id='ztreedemo_"+i+"_span'>"+rs[i].login_name+"</span></a></li>")
					}
				}
			}
		})
			$("#input-block").blur(function(){
				$("#ztreedemo").css("display","none")
			}) 
			$("#subjectId").click(function(){
				$("#ztreedemo").css("display","block")
			})
			$("#input-block-teacher").blur(function(){
				$("#ztree").css("display","none")
			}) 
			$("#teacher").click(function(){
				$("#ztree").css("display","block")
			})
	})
	function change(file){
	var url = window.URL.createObjectURL(file.files[0]);
	$("#subjcetpic").attr("src",url)
}