function exit(){
	$.ajax({
		url:"exit",
		type:"post",
		async : true,
		success:function(rs){
//			alert(rs);
			location.reload();
		},
		error:function(){
			alert("系统繁忙，请稍后再试");
		}
	});
}
function goodCourse(){
	$.post("goodLesson",{"pageCount":"8"},function(rs){
		if(rs == null || rs.length == 0){
			return;
		}
		$("#goodCourse").empty();
		for(var i in rs){
			
	
		$("#goodCourse").append("<li><div class='cc-l-wrap'><section class='course-img'>" +
				"<a href='lessonDetail?classId="+rs[i].classId+"'>" +
				"<img src='/images/lesson/"+rs[i].picture+"' class='img-responsive' alt='"+rs[i].className+"'>	</a></section><div class='coure-bg-g'><h3 class='hLh30 txtOf'>" +
				"<a href='lessonDetail?classId="+rs[i].classId+"' title='"+rs[i].className+"' class='course-title fsize16 c-333'>"+rs[i].className+"</a></h3><section class='mt10 hLh20 of'><span class='fr'>" +
				"<tt class='c-master fsize14 f-fM'>￥"+parseFloat(rs[i].price).toFixed(2)+"</tt></span><span class='fl jgAttr c-ccc f-fA'>" +
				"<tt class='c-999 f-fA mr10'>"+rs[i].numBuy+"购买</tt><tt class='c-999 f-fA span-2'>"+rs[i].numLook+"浏览</tt>	</span></section></div></div></li>");
		
		
			
				/*<a href="http://wx.inxedu.com/front/couinfo/37">
					<img xsrc="http://wx.inxedu.com/images/upload/course/20161222/1482393428320.jpg" src="http://wx.inxedu.com/static/inxweb/img/coures.gif" class="img-responsive" alt="技术开发套餐">
					</a>
					</section>
			<div class="coure-bg-g">
				<h3 class="hLh30 txtOf">
					<a href="http://wx.inxedu.com/front/couinfo/37" title="技术开发套餐" class="course-title fsize16 c-333">技术开发套餐</a>
				</h3>
				<section class="mt10 hLh20 of">
					<span class="fr"><tt class="c-master fsize14 f-fM">￥88.00</tt></span>
					<span class="fl jgAttr c-ccc f-fA">
				<tt class="c-999 f-fA mr10">11人购买</tt>
				<tt class="c-999 f-fA span-2">893浏览</tt>
			</span>
				</section>
			</div>
		</div>
	</li>*/
		}	
	},"json");
}
function iteacher(){
	$.post("iteacher",{"pageCount":"4"},function(rs){
		if(rs == null || rs.length == 0){
			return;
		}
		$("#iteach").empty();
		for(var i in rs){
			$("#iteach").append("<li><section class='i-teach-wrap'><div class='i-teach-pic'>" +
					"<a href='tech?techId="+rs[i].id+"' title='"+rs[i].login_name+"'>" +
					"<img width='141.3px' height='141.3px' alt='"+rs[i].login_name+"' src='/images/"+rs[i].head+"'></a></div><div class='mt10 hLh30 txtOf tac'>" +
					"<a href='tech?techId="+rs[i].id+"' title='"+rs[i].login_name+"' class='fsize18 c-666'>"+rs[i].login_name+"</a></div><div class='hLh30 txtOf tac'>" +
					"</div><div class='mt15 i-q-txt'>" +
					"<p class='c-999 f-fA'>"+rs[i].dec+"</p></div></section></li>");
		}
		﻿
	},"json");
	/*<li>
	<section class="i-teach-wrap">
		<div class="i-teach-pic">
			<a href="http://wx.inxedu.com/front/teacher/82" title="李小梅">
				<img alt="李小梅" src="http://wx.inxedu.com/static/inxweb/img/avatar-boy.gif" xsrc="http://wx.inxedu.com/images/upload/teacher/20150915/1442297919077.jpg">
				</a>
		</div>
		<div class="mt10 hLh30 txtOf tac">
			<a href="http://wx.inxedu.com/front/teacher/82" title="李小梅" class="fsize18 c-666">李小梅</a>
		</div>
		<div class="hLh30 txtOf tac">
			<span class="fsize14 c-999">资深课程设计专家，专注10年AACTP美国培训协会认证导师</span>
		</div>
		<div class="mt15 i-q-txt">
			<p class="c-999 f-fA">十年课程研发和培训咨询经验，曾任国企人力资源经理、大型外企培训经理，负责企业大学和培训体系搭建；曾任专业培训机构高级顾问、研发部总监，为包括广东移动、东莞移动、深圳移动、南方电网、工商银行、农业银行、民生银行、邮储银行、TCL集团、清华大学继续教育学院、中天路桥、广西扬翔股份等超过200家企业提供过培训与咨询服务，并担任近50个大型项目的总负责人。</p>
		</div>
	</section>
</li>*/
} 
$(function(){
	 goodCourse();
	 iteacher();
})