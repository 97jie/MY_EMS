<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>话题回复页</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/jquery-form.js" type="text/javascript"></script>
    <style type="text/css">
    	.title{
    		font-size: 17px
    	}
    	.fixed{ position:fixed; bottom:30px;
    		 z-index:9999;}
    	.time_span{
    		float: right;margin-bottom: 10px;
    	}
    	.content_div{
    		margin-top: 5px;padding-bottom: 15px;
    	}
    </style>
</head>
<body>
	<script type="text/javascript">
    var stu_session='<%=session.getAttribute("stu")%>';
    var tea_session='<%=session.getAttribute("tea")%>';
	if(stu_session=='null'&&tea_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	} 
</script>
<div class="container-fluid" >
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/chat.png" />
    			<li>
    				<h3 style="color: #00CCFF;margin-left: 15px" id="title">讨论区话题回复</h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="/MY_EMS/student/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    </div>

<div class="row container-fluid">
	<div class="col-md-6" style="margin-left: 20px">
		<div style="background: #E5E2E9;padding: 6px;margin-top: 15px">
			<div>
				<label class="title">${zt.zt_name}</label>
				<a style="float: right;font-size: 16px" id="back_a">
					<span class="glyphicon glyphicon-circle-arrow-left" ></span>返回讨论区</a>
			</div>
			<div></div>
			<span class="title" style="font-size: 16px;color: #6A516A">${zt.zt_content}</span>
			<label style="float: right;">${zt.zt_pub_time}</label>
		</div>
		<div class="col-md-11.7">
			<ul class="list-group" id="list_ul">
    		</ul>
    		<div class="row-fluid">
	     	<!-- 分页信息 -->
		     	<div class="col-md-6" id="page_info">
		        </div> 
		     	<div class="col-md-6" id="page_nav">
				</div>
     		</div>
		</div>
	</div>
	<div class="col-md-1">
		<div style="float: left;position:fixed; top:180px;padding: 0">
             <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu"><span class="glyphicon glyphicon-sort"></span>回复排序<strong class="caret"></strong></a>
             <ul class="dropdown-menu">
                 <li>
                     <a class="sort_a" sorted="1">按时间</a>
                 </li>
                 <li>
                     <a class="sort_a" sorted="2">按获赞</a>
                 </li>
                 <li>
                     <a class="sort_a" sorted="3">教师</a>
                 </li>
             </ul>
    	</div>
	</div>
	<div class="col-md-5">
		<div class="fixed">
			<p class="title">回复 ：</p>
			<form id="form_tr_pub">
				<input hidden="true" name="tr_no" id="input_tr_no">
				<input hidden="true" name="zt_no" value="${zt.zt_no}">
				<input hidden="true" name="zt_idx" value="${zt.zt_idx}">
				<textarea rows="7" cols="70" placeholder="(输入字符不大于1000)" name="tr_content"></textarea>
				<span class="help-block"></span>
			</form>
			<button type="button" class="btn btn-success" id="pub_tr" style="float: right;margin-right: 30px">
              	<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 发表回复
             </button>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var tr_no;
var sorted="3";
var zt_idx=${zt.zt_idx};;
$(function () {
	 if(stu_session!='null'){
		 var stu=JSON.parse(stu_session)
		 tr_no=stu.s_no;
		 $("#dropDown_stu").text(stu.s_grade+"级"+stu.b_name+"-"+stu.s_name)
	 }else{
		 var tea=JSON.parse(tea_session);
		 tr_no=tea.t_no;
		 $("#dropDown_stu").text(tea.aca_name+"-"+tea.t_name+"老师");
	 }
	 to_PageWithJson(1,sorted); 
	 $("#input_tr_no").val(tr_no);
});

function to_PageWithJson(pn,sorted) {
	$.ajax({
		url:"/MY_EMS/tr/getAllWithJson.do",
		data:{"pn":pn,"sort":sorted,"zt_idx":zt_idx},
		success:function(result){
			result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
			buildUl(result);		  //得到数据后构建表格
			bulidPageInfo(result);	  //构建分页信息
			bulidPageNav(result);	   ///构建分页导航
			$("#back_a").attr('href','/MY_EMS/zt/viewZt.do?bc_idx='+result.extend.bc_idx); 
		}
	});
}
function buildUl(result) {
	$("#list_ul").empty();
	var trs=result.extend.pageInfo.list;
	$.each(trs,function(index,item){
		var $li=$('<li></li>').addClass('list-group-item');
		var $a_like=$('<a></a>').addClass('a_like').attr('flag',"2").attr('tr_idx',item.tr_idx);
		if(item.flag=="1"){
			$a_like.css("color","#DDDD00").attr('flag',"1");
		}
		var $span_like=$('<span></span>').addClass('glyphicon glyphicon-thumbs-up').
							css('float','right').text(item.tr_like_num);
		$a_like.append($span_like);
		var $p_name=$('<p></p>').text(item.tr_name);
		var $div=$('<div></div>').addClass('content_div');
		var $label=$('<label></label>').text(item.tr_content);
		var $time=$('<span></span>').addClass('time_span').text(item.tr_time);
		$div.append($label).append($time);
		
		$li.append($a_like).append($p_name).append($div).appendTo("#list_ul");
	});
}

function bulidPageInfo(result) {
	$('#page_info').empty();
	$('#page_info').append("当前第"+result.extend.pageInfo.pageNum+"页，共有"+
			result.extend.pageInfo.pages+"页，一共有"+
        	result.extend.pageInfo.total+"条记录");
	
	current_page=result.extend.pageInfo.pageNum;
}

//构建分页导航
function bulidPageNav(result) {
	$('#page_nav').empty();
	var ul=$('<ul></ul>').addClass('pagination');
	var firstPageLi=$('<li></li>').append($('<a></a>').append("首页").attr('href',"#"));
	firstPageLi.click(function () {
		to_PageWithJson(1,sorted);
	})
	
	var prePageLi=$('<li></li>').append($('<a></a>').append("&laquo;"));
	prePageLi.click(function () {
		to_PageWithJson(result.extend.pageInfo.pageNum-1,sorted);
	})
	
	if(result.extend.pageInfo.hasPreviousPage==false){
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	}
	
	var nextPageLi=$('<li></li>').append($('<a></a>').append("&raquo;"));
	nextPageLi.click(function () {
		to_PageWithJson(result.extend.pageInfo.pageNum+1,sorted);
	})
	
	var lastPageLi=$('<li></li>').append($('<a></a>').append("尾页").attr('href',"#"));
	lastPageLi.click(function () {
		to_PageWithJson(result.extend.pageInfo.lastPage,sorted);
	})
	
	if(result.extend.pageInfo.hasNextPage==false){
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	}
	
	ul.append(firstPageLi).append(prePageLi);
	$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		var numLi=$('<li></li>').append($('<a></a>').append(item).attr('href',"#"));
		if(result.extend.pageInfo.pageNum==item){
			numLi.addClass("active");
		}
		numLi.click(function () {
			to_PageWithJson(item,sorted);
		})
		ul.append(numLi);
	});
	ul.append(nextPageLi).append(lastPageLi);
	
	var nav_page=$('<nav></nav>').append(ul);
	
	nav_page.appendTo("#page_nav");
}

$("#pub_tr").click(function () {
	var data_tr=$("#form_tr_pub").serialize();
	data_tr = decodeURIComponent(data_tr,true);
	$.ajax({
		url:"/MY_EMS/tr/savaTr.do",
		type:"post",
		data:data_tr,
		success:function(result){
			result=JSON.parse(result);
			if(result.code==200){
				alert("发布成功！");
				to_PageWithJson(1,sorted);
			}else{
				if(undefined!=result.extend.error_map.tr_content){
					validata_form($("#input_tr_content"),"error",result.extend.error_map.tr_content);
				}
			}
		}
	});
});

function error_clean($ele) {
	$ele.parent().removeClass("has-success has-error");
	$ele.next("span").text("");
}

function validata_form($ele,status,msg){//显示表单错误信息
	error_clean($ele);
	if("success"==status){
		$ele.parent().addClass("has-success");
		$ele.next('span').text("");
	}else{
		$ele.parent().addClass("has-error");
		$ele.next('span').text(msg);
	}
}

$(document).on("click",".sort_a",function(){
	sorted=$(this).attr("sorted");
	to_PageWithJson(1,sorted);
});

$(document).on("click",".a_like",function(){
	var flag=$(this).attr('flag');
	var $span=$($(this).children("span")[0]);
	var num=parseInt($span.text());
	var tr_idx=$(this).attr('tr_idx');
	if(flag=="1"){//已点赞
		changeLike(tr_idx,tr_no,-1);
		$span.text(num-1);
		$(this).css('color',"");
		$(this).attr('flag',"2");
	}else{
		console.log(tr_no);
		changeLike(tr_idx,tr_no,1);
		$span.text(num+1);
		$(this).css('color',"#DDDD00");
		$(this).attr('flag',"1");
	}
});

function changeLike(tr_idx,like_no,num) {
	$.ajax({
		url:"/MY_EMS/tr/changeLike.do",
		data:{"tr_idx":tr_idx,"like_no":like_no,"num":num}
	});
}
</script>

</html>