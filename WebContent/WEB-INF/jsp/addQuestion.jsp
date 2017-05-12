<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>添加试题</title>
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">

    
    <link rel="stylesheet" type="text/css" href="css/admin/default.css">
    <link type="text/css" rel="stylesheet" href="css/admin/zTreeStyle.css">
    <link rel="stylesheet" href="css/admin/demo.css" type="text/css">

<link rel="stylesheet" href="css/admin/layui.css" media="all">
<link rel="stylesheet" href="css/admin/global.css" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="css/admin/layer.css" media="all">
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
var flag = ${operater}
if(flag){
	alert("添加成功");
}else{
	alert("添加失败");
}
</script>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style>
<link id="layuicss-laydatecss" rel="stylesheet" href="css/admin/laydate.css" media="all">
<style type="text/css">
.layui-form-item select{
margin-top:8px;
display: block;
}
.layui-form-item input[type="radio"]{
display: inline;
margin-top:8px;
}
</style>

</head>
<body>
	
<fieldset class="layui-elem-field">
    <legend>
        <span>添加试题</span>
    </legend>
    <div class="layui-field-box">
        <form id="saveTeacherForm" action="addExam" method="post" class="layui-form">
             <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>题目</label>
                <div class="layui-input-block layui-textarea-block">
                    <textarea class="layui-textarea" id="career" lay-verify="required" name="question"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>题目类别</label>
                <div class="layui-input-block" id="input-block">
                    <input type="hidden" id="id" name="cateId" value="0">
                    <input readonly="readonly" id="subjectId" class="layui-input layui-input-6">
                    <ul id="ztreedemo" class="ztree"  style="display:none; z-index:99999; position: absolute; top: 30px; left: 0;  width:59%;border: 3px solid #ececec;">
                    </ul>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>选项A</label>
                <div class="layui-input-block">
                    <input name="choiceA" type="text" class="layui-input layui-input-6" lay-verify="required">
                    <input type="radio" value="A" name="answer" >设为答案
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>选项B</label>
                <div class="layui-input-block">
                    <input name="choiceB" type="text" class="layui-input layui-input-6" lay-verify="required">
               		<input type="radio" value="B" name="answer" >设为答案
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>选项C</label>
                <div class="layui-input-block">
                    <input name="choiceC" type="text" class="layui-input layui-input-6" lay-verify="required">
              		 <input type="radio" value="C" name="answer" >设为答案
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>选项D</label>
                <div class="layui-input-block">
                    <input name="choiceD" type="text" class="layui-input layui-input-6" lay-verify="required">
              		 <input type="radio" value="D" name="answer" >设为答案
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <a class="layui-btn layui-btn-danger" title="提 交" onclick="sub()" lay-submit="" lay-filter="teacherFormSubmit">提 交</a>
                    <a class="layui-btn layui-btn-primary" title="返 回" href="javascript:history.go(-1);">返 回</a>
                </div>
            </div>
        </form>
    </div>
</fieldset>

<!-- <script type="text/javascript" src="js/admin/teacheadd.js"></script> -->
<script type="text/javascript">
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
		$("#subjectId").click(function(){
			$("#ztreedemo").css("display","block")
		})
})
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
		var va = $("input[type='radio']:checked").val();
		if(va == null || va == "" || va == undefined){
			alert("请设置答案")
		}else{
			$("#saveTeacherForm").submit();
		}
	}
}
</script>
</body>
</html>