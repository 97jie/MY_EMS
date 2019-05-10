<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师主界面</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <style>
    </style>
</head>
<body>
	<script type="text/javascript">
    var tea_session='<%=session.getAttribute("tea")%>';
	if(tea_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	} 
</script>
<div class="modal fade" id="model_tea_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">教师信息详情页</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_tea">
	  			<div class="form-group">
	    			<label for="static_t_name" class="col-sm-3 control-label">教师姓名：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_name" class="col-sm-3 control-label">密码：</label>
	   				<div class="col-sm-8">
	     				<input type="text" class="form-control-static" id="static_t_pwd" name="t_pwd">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_email" class="col-sm-3 control-label">教师邮箱：</label>
	   				<div class="col-sm-8">
	     				<input type="email" class="form-control-static" id="static_t_email" name="t_email">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_office" class="col-sm-3 control-label">办公室地址：</label>
	   				<div class="col-sm-8">
	     				<input type="text" class="form-control-static" id="static_t_office" disabled="disabled">
	     				<!-- <div class="span_edit">
	     				<span class='glyphicon glyphicon-pencil span_edit' aria-hidden='true' ></span>
	     				</div> -->
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_info" class="col-sm-3 control-label">教师信息：</label>
	   				<div class="col-sm-8">
	     				<textarea class="form-control-static" id="static_t_info"></textarea>
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal" id="save_tea">保存</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/stu_logo.png" />
    			<li>
    				<h3 style="color: #00CCFF;">作业管理系统-教师主界面</h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_tea"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="/MY_EMS/jsp/teaInfo.jsp" id="view_tea">个人信息</a>
	                    </li>
	                    <li>
	                        <a href="/MY_EMS/teacher/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr  width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="col-md-12">
	    	<div class="col-md-8" style="margin-bottom: 30px">
	    		<h4>课程信息</h4>
	    		<table class="table table-hover table-striped table-bordered">
	    			<thead>
	    				<tr>
	    					<th style="text-align: center;width: 260px">您所教授课程</th>
	    					<th style="text-align: center;width: 300px">班级信息</th>
	    				</tr>
	    			</thead>
	    			<tbody id="tbody">
	         		</tbody>
	    		</table>
	    		<div class="row-fluid">
		     	<!-- 鍒嗛〉淇℃伅 -->
			     	<div class="col-md-6" id="page_info">
			        </div> 
			     	<div class="col-md-6" id="page_nav">
				</div>
     </div>
	    	</div>
    		<div class="col-md-4" style="margin-top: 25px">
    			<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">通知栏</h3>
					</div>
					<div class="panel-body row pre-scrollable" >
						<ul class="list-group" id="ul_inform">
						</ul>
					</div>
				</div>
    		</div>
    </div>
    </div>
    <div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 10%">
   <div style="margin-top: 78px">
		<h4 style="text-align: center">©2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们：6654331</h4>
	</div>
</div>
</body>
<script type="text/javascript">
		var bans;
		var tea;
		$(function name() {
			tea=JSON.parse(tea_session);//得到自定义的 tea对象
			var str_tea=tea.aca_name+"-"+tea.t_name+"老师";
			//"<span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
			$("#dropDown_tea").text(str_tea);
			
			to_PageWithJson(1);
			buildInform();
		});
		function buildInform() {
			$("#ul_inform").empty();
			$.ajax({
				url:"/MY_EMS/tr/getTrsWithNo.do?zt_no="+tea.t_no,
				type:"GET",
				success:function(result){
					result=JSON.parse(result);
					var trs=result.extend.list;
					$.each(trs,function(index,item){
						var $li=$('<li></li>').addClass('list-group-item');
						var $content_a=$('<a></a>').attr('href','/MY_EMS/zt/viewTr.do?zt_idx='+item.zt_idx).attr("target","_blank");
						$content_a.append(item.tr_name+"在课程讨论区回复了您（点击查看）");
						var $p_time=$('<p></p>').attr('align','right').text(item.tr_time);
						$li.append($content_a).append($p_time).appendTo("#ul_inform");
					});
				}
			});
		}
		function to_PageWithJson(pn) {
			$.ajax({
				url:"/MY_EMS/banCourse/getAllBsWithTea.do",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					console.log(result);
					result=JSON.parse(result);
					buildTable(result);		  
					bulidPageInfo(result);	  
					bulidPageNav(result);	   
				}
			});
		}
		
		function buildTable(result) {
			$('#tbody').empty();
			var banCs=result.extend.pageInfo1.list;
			console.log(result);
			bans=result.extend.pageInfo2.list;
			$.each(banCs,function(index,item){
				/* var c_info= */
				var $course_a=$('<a></a>');
				var $b_info=$('<p></p>');
				$course_a.css({"color":"#C4A93C","font-size":"18px"}).text(item.bc_idx+"-"+item.c_name);
				$course_a.attr('href',"/MY_EMS/banCourse/viewWithBcIdx.do?bc_idx="+item.bc_idx);
				$b_info.css({"color":"#22DD92","font-size":"18px"}).text(bans[index].aca_name+"-"+bans[index].b_grade+bans[index].b_name);
				var td1=$('<td></td>').attr("align","center").append($course_a);
				var td2=$('<td></td>').attr("align","center").append($b_info);
				$('<tr></tr>').append(td1).append(td2).appendTo("#tbody");
			});
		}
		
		function bulidPageInfo(result) {
			$('#page_info').empty();
			$('#page_info').append("当前第"+result.extend.pageInfo1.pageNum+"页，共有"+
					result.extend.pageInfo1.pages+"页，一共有"+
		        	result.extend.pageInfo1.total+"条记录");
			
			current_page=result.extend.pageInfo1.pageNum;
		}
		
		//鏋勫缓鍒嗛〉瀵艰埅
		function bulidPageNav(result) {
			$('#page_nav').empty();
			var ul=$('<ul></ul>').addClass('pagination');
			var firstPageLi=$('<li></li>').append($('<a></a>').append("首页").attr('href',"#"));
			firstPageLi.click(function () {
				to_PageWithJson(1);
			})
			
			var prePageLi=$('<li></li>').append($('<a></a>').append("&laquo;"));
			prePageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo.pageNum-1);
			})
			
			if(result.extend.pageInfo1.hasPreviousPage==false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}
			
			var nextPageLi=$('<li></li>').append($('<a></a>').append("&raquo;"));
			nextPageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo1.pageNum+1);
			})
			
			var lastPageLi=$('<li></li>').append($('<a></a>').append("尾页").attr('href',"#"));
			lastPageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo1.lastPage);
			})
			
			if(result.extend.pageInfo1.hasNextPage==false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo1.navigatepageNums,function(index,item){
				var numLi=$('<li></li>').append($('<a></a>').append(item).attr('href',"#"));
				if(result.extend.pageInfo1.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function () {
					to_PageWithJson(item);
				})
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			
			var nav_page=$('<nav></nav>').append(ul);
			
			nav_page.appendTo("#page_nav");
		}
		
		$(document).on("click","#view_tea",function(){
			$("#static_t_name").text(tea.t_name);
			$("#static_t_pwd").val(tea.t_pwd);
			$("#static_t_email").val(tea.t_email);
			$("#static_t_office").val(tea.t_office);
			$("#static_t_info").text(tea.t_info);
			
			$("#model_tea_edit").modal({
				backdrop:"static"
			});
		});
		
		$(".span_edit").click(function (event) {
			 event.stopPropagation();
			 $("this").prev().attr("disabled","false")
		})
</script>
</html>