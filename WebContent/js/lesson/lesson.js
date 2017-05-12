$(function() {
	var current = 1;
	var cateId = 0;
	getData(current,cateId);
	 getCate();
});

function getData(current,cateId) {
	$
			.ajax({
				url : "lessonAll",
				dataType : "json",
				type : "get",
				data : {
					"current" : current,
					"name" : name,
					"cateId" : cateId
				},
				success : function(rs) {
					$("#lesson").empty();
					if (rs != "" && rs.list != null && rs.list.length != 0) {
						for (var i = 0; i < rs.list.length; i++) {
							$("#lesson")
									.append(
											"<li><div class='cc-l-wrap'><section class='course-img'>"
													+ "<a href='lessonDetail?classId="+rs.list[i].classId+"' target='_blank'>"
													+ "<img width='257px' height='143.34px' src='/images/lesson/"
													+ rs.list[i].picture
													+ "' class='img-responsive'></a></section><div class='coure-bg-g'><h3 class='hLh30 txtOf mt10'>"
													+ "<a href='lessonDetail?classId="+rs.list[i].classId+"' target='_blank' class='course-title fsize18 c-333'>"
													+ rs.list[i].className
													+ "</a></h3><section class='mt10 hLh20 of'><span class='fr'>"
													+ "<tt class='c-green fsize12 f-fA' style='font-size:16px;'>￥"
													+  parseFloat(rs.list[i].price).toFixed(2)
													+ "</tt></span>"
													+ "<span class='fl jgAttr c-ccc f-fA'><tt class='c-999 f-fA mr10'>"
													+ rs.list[i].numBuy
													+ "人购买</tt>"
													+ "<tt class='c-999 f-fA span-2'>"
													+ rs.list[i].numLook
													+ "浏览</tt></span></section></div></div></li>");
						}
						$('#clear').pagination({
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
								getData(cur,cateId)
							}
						});
					}else{
						alert("对不起，不存在相关课程");
						name = "";
						getData(1,0)
					}

				}
			});
}
function getCate(){
	$.ajax({
		url:"getCate",
		type:"post",
		dataType:"json",
		async:false,
		success:function(rs){
			$("#cate").append("<li class='current'><a onclick='getData(1,0);' title='全部'>全部</a></li>");
			for(var i in rs){
				$("#cate").append("<li><a onclick='getData(1,"+rs[i].id+");' title='"+rs[i].cateName+"'>"+rs[i].cateName+"</a></li>");
			}
		}
	})
}

