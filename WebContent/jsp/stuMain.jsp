<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
</head>
<body>
	<script type="text/javascript">
    var stu_session='<%=session.getAttribute("stu")%>';
	if(stu_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	} 
</script>
<div class="modal fade" id="model_tea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">教师信息</h4>
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
	    			<label for="static_t_gender" class="col-sm-3 control-label">教师性别：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_gender"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_email" class="col-sm-3 control-label">教师邮箱：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_email"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_office" class="col-sm-3 control-label">办公室地址：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_office"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_aca_name" class="col-sm-3 control-label">所属学院：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_aca_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_t_info" class="col-sm-3 control-label">教师信息：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_info"></p>
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<!-- <li><img src="../image/login.jpg" /></li> -->
    			<li>
    				<h3 style="color: #00CCFF;">作业管理系统-学生主页面</h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="#">个人信息</a>
	                    </li>
	                    <li>
	                        <a href="/MY_EMS/student/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr  width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="col-md-12">
	    	<div class="col-md-8" style="margin-bottom: 30px">
	    		<h4>所有课程</h4>
	    		<table class="table table-hover table-striped table-bordered">
	    			<thead>
	    				<tr>
	    					<th style="text-align: center;width: 260px">您所在的课程</th>
	    					<th style="text-align: center;width: 300px">教师信息</th>
	    				</tr>
	    			</thead>
	    			<tbody id="tbody">
	         		</tbody>
	    		</table>
	    		<div class="row-fluid">
		     	<!-- 分页信息 -->
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
							<li class="list-group-item">李伟(学生)回复了您<p align="right">2019-03-11 22:13:22</p></li>
							<li class="list-group-item">王磊(学生)回复了您<p align="right">2019-03-10 19:36:22</p></li>
							<li class="list-group-item">张帅(学生)回复了您<p align="right">2019-03-08 09:13:22</p></li>
							<li class="list-group-item">韩梅梅(教师)回复了您<p align="right">2019-03-08 22:55:22</p></li>
							<li class="list-group-item">邓波(学生)回复了您<p align="right">2019-03-07 12:23:22</p></li>
						</ul>
					</div>
				</div>
    		</div>
    </div>
    </div>
    <div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 15%">
   <div style="margin-top: 78px">
		<h4 style="text-align: center">©2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们：6654331</h4>
	</div>
</div>
</body>
<script type="text/javascript">
		var teas;
		$(function name() {
			var stu=JSON.parse(stu_session);//得到自定义的 stu对象
			var str_stu=stu.s_grade+"级"+stu.b_name+"-"+stu.s_name;
			//"<span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
			$("#dropDown_stu").text(str_stu);
			
			to_PageWithJson(1);
		});
		
		function to_PageWithJson(pn) {
			$.ajax({
				url:"/MY_EMS/banCourse/getAllBsWithJson.do",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
					buildTable(result);		  //得到数据后构建表格
					bulidUl();    //构建通知栏信息
					bulidPageInfo(result);	  //构建分页信息
					bulidPageNav(result);	   ///构建分页导航
				}
			});
		}
		
		function buildTable(result) {
			$('#tbody').empty();
			var banCs=result.extend.pageInfo1.list;
			console.log(result);
			teas=result.extend.pageInfo2.list;
			$.each(banCs,function(index,item){
				/* var c_info= */
				var $course_a=$('<a></a>');
				var $t_a=$('<a></a>');
				$course_a.css({"color":"#C4A93C","font-size":"18px"}).text(item.bc_idx+"-"+item.c_name);
				$course_a.attr('href',"/MY_EMS/banCourse/viewWithBcIdx.do?bc_idx="+item.bc_idx);
				$t_a.css({"color":"#22DD92","font-size":"18px"}).text(teas[index].aca_name+"-"+teas[index].t_name+"老师");
				$t_a.attr('num',index).attr('class','tea');
				
				var td1=$('<td></td>').attr("align","center").append($course_a);
				var td2=$('<td></td>').attr("align","center").append($t_a);
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
		
		//构建分页导航
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
		
		$(document).on("click",".tea",function(){
			//查看教师信息模态框
			var index=$(this).attr("num");
			var tea_info=teas[index];
			$("#static_t_name").text(tea_info.t_name);
			$("#static_t_gender").text(tea_info.t_gender);
			$("#static_t_email").text(tea_info.t_email);
			$("#static_aca_name").text(tea_info.aca_name);
			$("#static_t_office").text(tea_info.t_office);
			$("#static_t_info").text(tea_info.t_info);
			
			$("#model_tea").modal({
				backdrop:"static"
			});
		});
</script>
</html>