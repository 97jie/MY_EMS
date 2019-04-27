<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程讨论区页</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/jquery-form.js" type="text/javascript"></script>
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
	<div class="modal fade" id="model_topic_hub" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">发布话题</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_topic_pub">
	       		<input type="text" name="zt_no" hidden="true" id="input_zt_no">
	       		<input type="text" name="bc_idx" hidden="true" id="input_bc_idx">
	  			<div class="form-group">
	    			<label for="input_zt_content" class="col-sm-3 control-label">话题内容：</label>
	   				<div class="col-sm-8">
	     				<textarea class="form-control" rows="5" id="input_zt_content" name="zt_content"></textarea>
	  					<span class="help-block"></span>
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" id="zt_save">
        	<span class="glyphicon glyphicon-saved"></span>发布</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

	<div class="container-fluid" >
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/chat.png" />
    			<li>
    				<h3 style="color: #00CCFF;margin-left: 15px" id="title">课程讨论区</h3>
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
   	<div class="row-fluid" style="margin-left: 200px">
    	<div class="col-md-10 col-offset-md-1" style="margin-bottom: 30px">
    		<div class="col-md-12">
    			<div class="col-md-6">
    				<h4>已发布话题</h4>
    			</div>
    			<div class="col-md-2 col-md-offset-2">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu"><span class="glyphicon glyphicon-sort"></span>排序<strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a class="sort_a" sorted="1">按时间</a>
	                    </li>
	                    <li>
	                        <a class="sort_a" sorted="2">按热度</a>
	                    </li>
	                    <li>
	                        <a class="sort_a" sorted="3">教师</a>
	                    </li>
	                </ul>
    			</div>
    			<div>
    				<button type="button" class="btn btn-success" data-dismiss="modal" id="zt_pub">
       				<span class="glyphicon glyphicon-plus"></span>发布新话题</button>
	    		</div>
    		</div>
    		<ul class="list-group" style="margin-top: 34px" id="list_ul">
    			<li class="list-group-item">
    				<span class="badge glyphicon glyphicon-fire">14</span>
					<p>李雷（老师）：</p>
					<div style="margin-top: 5px">
						<a>实打实大师法萨芬</a>
						<label style="float: right;">2019-05-01 13:21:21</label>
					</div>
    			</li>
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
</body>
<script type="text/javascript">
	var zt_no;
	var bc_idx;
	var sorted="1";
	 $(function () {
		 if(stu_session!='null'){
			 var stu=JSON.parse(stu_session)
			 zt_no=stu.s_no;
			 $("#dropDown_stu").text(stu.s_grade+"级"+stu.b_name+"-"+stu.s_name)
		 }else{
			 var tea=JSON.parse(tea_session);
			 zt_no=tea.t_no;
			 $("#dropDown_stu").text(tea.aca_name+"-"+tea.t_name+"老师");
		 }
		 bc_idx=${bc_idx}
		 console.log(bc_idx);
		to_PageWithJson(1,sorted); 
	});
	
	function to_PageWithJson(pn,sorted) {
		$.ajax({
			url:"/MY_EMS/zt/getAllWithJson.do?bc_idx="+bc_idx,
			data:{"pn":pn,"sort":sorted},
			type:"GET",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
				buildUl(result);		  //得到数据后构建表格
				bulidPageInfo(result);	  //构建分页信息
				bulidPageNav(result);	   ///构建分页导航
			}
		});
	} 
	function buildUl(result) {
		$("#list_ul").empty();
		var zts=result.extend.pageInfo.list;
		$.each(zts,function(index,item){
			var $li=$('<li></li>').addClass('list-group-item');
			var $span=$('<span></span>').addClass('badge glyphicon glyphicon-fire');
			$span.text(item.zt_heat)
			var $p=$('<p></p>').text(item.zt_name);
			var $div=$('<div></div>').css("margin-top","5px");
			var $a_content=$('<a></a>').attr('href','/MY_EMS/zt/viewTr.do?zt_idx='+item.zt_idx);
			$a_content.append(item.zt_content);
			var $label=$('<label></label>').css("float","right");
			$label.append(item.zt_pub_time);
			$div.append($a_content).append($label);
			$li.append($span).append($p).append($div).appendTo("#list_ul");
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
	
	$("#zt_pub").click(function () {
		$("#input_zt_no").val(zt_no);
		$("#input_bc_idx").val(bc_idx);
		error_clean($("#input_zt_content"));
		$("#model_topic_hub").modal({
			backdrop:"static"
		});
	});
	function error_clean($ele) {
		$ele.parent().removeClass("has-success has-error");
		$ele.next("span").text("");
	}
	$("#zt_save").click(function () {
		if(confirm("确定要发布话题吗？")){
			var data_zt=$("#form_topic_pub").serialize();
			data_zt = decodeURIComponent(data_zt,true);
			$.ajax({
				url:"/MY_EMS/zt/savaZt.do",
				type:"post",
				data:data_zt,
				success:function(result){
					result=JSON.parse(result);
					if(result.code==200){
						$("#model_topic_hub").modal("hide");
						alert("发布成功！");
						to_PageWithJson(1,sorted);
					}else{
						if(undefined!=result.extend.error_map.zt_content){
							validata_form($("#input_zt_content"),"error",result.extend.error_map.zt_content);
						}
					}
				}
			});
		}
	});
	
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
</script>
</html>