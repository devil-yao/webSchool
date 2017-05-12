<%@page import="com.dwh.tech.entity.Question"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试系统--智慧树人教育网站</title>
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">

<link rel="stylesheet" type="text/css"
	href="css/exam/exam-style.css">
<link rel="stylesheet"
	href="css/exam/examtheme.css">
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<style type="text/css">
.t-p-is-options label input{
	opacity: 1;
}
label+input {
text-align: right;
}
.ml10{
border:0;
}
#score{
float:right;
margin-right: 100px;
font-size: 28px;
font-family: 宋体;
}
/* .c-fff {
	margin-top: 12px;
} */
</style>
<link rel="stylesheet" href="css/exam/jquery-ui.css">
<script type="text/javascript" src="js/jquerr-3.1.0.min.js"></script>
<script type="text/javascript" src = "js/exam/jquery-ui.js"></script>
<script type="text/javascript" src="js/exam/exam.js"></script>
</head>
<body>
	<div class="e-wrap in-wrap">
		<div class="main-warp">
			<div class="main-infor">
				<!-- e-header -->
				<!-- /global header begin-->

				<form action="http://wx.inxedu.com/paper/addPaperRecord"
					method="post" id="addPaperRecord">
					<div class="e-main">
						<section class="container">
							<div class="clearfix mt30">
								<div class="col18 fl pr">
									<div class="p-test-box" id="p-test-box"
										>
										<dl class="paper-test">
											<dt>
												<em class="e-clock"></em><span id="timer">60分0秒</span>
											</dt>
											<dd>
												<a class="prevent" href="javascript:void(0)" title="" onclick="submitAnswer()">我要交卷</a>
											</dd>
											<dd>
												<a class="prevent" href="javascript:void(0)" onclick="stop()" >暂停</a>
											</dd>
										</dl>
										<!-- /答题卡 开始 -->
										<div class="mt20">
											<dl class="paper-test q-card-box q-card-wrap">
												<dt>
													<a href="javascript:"><span class="ques-card">答题卡</span><em
														class="q-card-icon icon16"></em></a>
												</dt>
												<dd>
													<table class="ques-card-tab">
														<tbody>
														<% List<Question> list = (List<Question>)request.getAttribute("question"); 
															int tr = list.size()/4;
															if(tr == 0){tr= 1;}
															int td = list.size()%4;
														%>
														<c:forEach begin="1" end="<%=tr %>" varStatus="status" >
															<tr>
																<td id="datikaCurrent${(status.current-1)*4+1}" class="current"><a
																	href="#${(status.current-1)*4+1}"
																	title="第${(status.current-1)*4+1}题">${(status.current-1)*4+1}</a></td>
																
																<td id="datikaCurrent${(status.current-1)*4+2}" class="current"><a
																	href="#${(status.current-1)*4+2}"
																	title="第${(status.current-1)*4+2}题">${(status.current-1)*4+2}</a></td>
																
																<td id="datikaCurrent${(status.current-1)*4+3}" class="current"><a
																	href="#${(status.current-1)*4+3}"
																	title="第${(status.current-1)*4+3}题">${(status.current-1)*4+3}</a></td>
																
																<td id="datikaCurrent${(status.current-1)*4+4}" class="current"><a
																	href="#${(status.current-1)*4+4}"
																	title="第${(status.current-1)*4+4}题">${(status.current-1)*4+4}</a></td>
															</tr>
															</c:forEach>
															<tr>
															<% for(int i = 1;i <= td;i++){ %>
															<td id="datikaCurrent<%=tr*4+i %>" class="current"><a
																	href="#<%=tr*4+i %>"
																	title="第<%=tr*4+i %>题"><%=tr*4+i %></a></td>
															<% }%>															
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
										<!-- /答题卡 结束 -->
									</div>
								</div>
								<div class="col82 fr">
									<div class="ml40">
										<div class="p-test-title">
											<span class="nextTitleAnchor">${type}模拟试卷</span>
										</div>
										<div id="score"></div>
										<div class="pt10 pb10 pr20">
											<h6 class="hLh30 of unFw ml15">
												<font class="c-333 fsize12" id="showTitleValue">每题有且只有1个正确答案[&nbsp;每小题10分&nbsp;]</font>
											</h6>
										</div>
										<div class="p-ques-list">
											<ul id="titleHidden215">
												<!-- /试卷试题列表开始 -->
												<c:forEach items="${requestScope.question }" var="var" varStatus="status">
												<a name="${status.index+1 }"></a>
												<li class="datikaQstAnchor1 p-q-item">
													<div class=" p-ques-title">
														<tt>${status.index+1 }</tt>
														<span class="c-master fsize16 ml10"> （单选题）</span> <span
															class="c-666 fsize16"><p class="pre"
																style="margin: 0pt; line-height: 24pt; mso-line-height-rule: exactly;">
																<span style="font-family: Arial; font-size: 12pt; mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																<span style="font-family: 宋体;">${var.title }</span><span
																	style="font-family: Arial;">()<br> <br>
																</span></span>
															</p> <!--EndFragment--></span>
													</div>
													<section class="t-p-options">
														<ol>
															<li><a href="javascript:void(0);">A、
																	<p class="pre"
																		style="margin: 0pt; line-height: 24pt; mso-line-height-rule: exactly;">
																		<span style="font-family: Arial; font-size: 12pt;mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																		<span style="font-family: 宋体;">${var.choiceA }</span></span>
																	</p> <!--EndFragment-->
															</a></li>
															<li><a href="javascript:void(0);">B、
																	<p class="pre"
																		style="margin: 0pt; line-height: 24pt; mso-line-height-rule: exactly;">
																		<span style="font-family: Arial; font-size: 12pt;mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																		 <span style="font-family: Arial;">&nbsp;</span><span
																			style="font-family: 宋体;">${var.choiceB }</span></span>
																	</p> <!--EndFragment-->
															</a></li>
															<li><a href="javascript:void(0);">C、
																	<p class="pre"
																		style="margin: 0pt; line-height: 24pt; mso-line-height-rule: exactly;">
																		 <span style="font-family: Arial; font-size: 12pt;mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																		 <span style="font-family: Arial;">&nbsp;</span>
																		 <span style="font-family: 宋体;">${var.choiceC } </span></span>
																	</p> <!--EndFragment-->
															</a></li>
															<li><a href="javascript:void(0);">D、
																	<p class="pre"
																		style="margin: 0pt; line-height: 24pt; mso-line-height-rule: exactly;">
																		  <span style="font-family: Arial; font-size: 12pt;mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																		  <span style="font-family: 宋体;">${var.choiceD }</span></span>
																			<span style="font-family: Arial; font-size: 12pt;mso-spacerun:yes;mso-font-kerning:0.0000pt;mso-fareast-font-family:宋体;">
																			<!--?xml:namespace prefix = "o" ns = "urn:schemas-microsoft-com:office:office" /-->
																			<o:p></o:p>
																		</span>
																	</p> <!--EndFragment-->
															</a></li>
														</ol>
													</section>
													<section class="is-options clearfix is-options-mo">
														<div class="fr">
															
														</div>
														<!-- 论述题出现的是输入框没有选项 -->
														<div class="fl t-p-is-options">
															<label for="${status.index+1 }_A" numinder="1" papermiddlelistindex="0">
																<em class="icon18 o-radio">&nbsp;</em> <input
																type="radio" name="record[${status.index+1 }]" id="${status.index+1 }_A"
																value="A"> <span>A</span>
															</label> <label for="${status.index+1 }_B" numinder="1" papermiddlelistindex="0">
																<em class="icon18 o-radio">&nbsp;</em> <input
																type="radio" name="record[${status.index+1 }]" id="${status.index+1 }_B"
																value="B"> <span>B</span>
															</label> <label for="${status.index+1 }_C" numinder="1" papermiddlelistindex="0">
																<em class="icon18 o-radio">&nbsp;</em> <input
																type="radio" name="record[${status.index+1 }]" id="${status.index+1 }_C"
																value="C"> <span>C</span>
															</label> <label for="${status.index+1 }_D" numinder="1" papermiddlelistindex="0">
																<em class="icon18 o-radio">&nbsp;</em> <input
																type="radio" name="record[${status.index+1 }]" id="${status.index+1 }_D"
																value="D"> <span>D</span>
															</label> <input class="ml10"  value="正确答案:" type="hidden">
															<input class="ml10" id="record[${status.index+1 }]" value="${var.answer}" type="hidden"
																name="record[${status.index+1 }].userAnswer">
														</div>
													</section>
												</li>
												</c:forEach>
												
												<!-- /试卷试题列表结束 -->
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					
				</form>
				<div class="d-tips-7" id="dialog">
				<!-- <img alt="" src="images/exam/xiuxi.jpg"> -->
				</div>
				<div class="d-tips-7" id="dia">
				<!-- <img alt="" src="images/exam/xiuxi.jpg"> -->
				</div>
			</div>
		</div>
	</div>
	<div class="mo-footer">
</body>
</html>