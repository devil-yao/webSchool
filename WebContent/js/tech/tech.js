$(function() {
	current = 1;
	Categroy();
	getTeacher(1, null, current);
})
/*type 1 全部 2 类别cateId类别Id*/
function getTeacher(type, cateId, cur) {
	$
			.ajax({
				url : "getTech",
				data : {
					"type" : type,
					"cateId" : cateId,
					"current" : cur
				},
				type : "POST",
				dataType : "json",
				success : function(rs) {
					if (rs == null) {
						return false;
					}
					$("#list").empty();
					for (var i = 0; i < rs.list.length; i++) {
						$("#list")
								.append(
										"<li><section class='i-teach-wrap'><div class='i-teach-pic'>"
												+ "<a href='tech?techId="
												+ rs.list[i].id
												+ "' target='_blank' title='"
												+ rs.list[i].login_name
												+ "'>"
												+ "<img width='141.3px' height='141.3px' src='/images/"
												+ rs.list[i].head
												+ "'></a></div><div class='mt10 hLh30 txtOf tac'>"
												+ "<a href='tech?techId="
												+ rs.list[i].id
												+ "' title='"
												+ rs.list[i].login_name
												+ "' class='fsize18 c-666'>"
												+ rs.list[i].login_name
												+ "</a></div><div class='hLh30 txtOf tac'>"
												+ "<span class='fsize14 c-999'></span></div><div class='mt15 i-q-txt'>"
												+ "<p class=''c-999 f-fA'>"
												+ rs.list[i].dec
												+ "</p></div></section></li>")
					}
					$('#clear').pagination({
						totalData : rs.total,
						showData : rs.pageCount,
						isHide : true,
						current : cur,
						coping : true,
						homePage : '首页',
						endPage : '末页',
						prevContent : '上页',
						nextContent : '下页',
						callback : function(index) {
							current = index.getCurrent();
							getTeacher(type, cateId, current);
						}
					});
				}
			})
}
function Categroy(){
	$.ajax({
		url:"getCate",
		type:"post",
		dataType:"json",
		async:false,
		success:function(rs){
			$("#cate").append("<li class='current'><a onclick='getTeacher(2,0,current);' title='全部'>全部</a></li>");
			for(var i in rs){
				$("#cate").append("<li><a onclick='getTeacher(2, "+rs[i].id+", current);' title='"+rs[i].cateName+"'>"+rs[i].cateName+"</a></li>");
			}
		}
	})
}
