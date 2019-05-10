<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生提交信息详情页</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/jquery-form.js" type="text/javascript"></script>
    <style>
       #table_stu{
        	margin:0px auto;
        }
        #table_stu thead{
		    display:block;
		    overflow-y: scroll;
		}
		#table_stu tbody{
           display:block;
           max-height:150px;
           overflow-y: scroll;
       }
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

<div class="modal fade" id="model_stu_view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">学生基本信息</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_stu_view">
	  			<div class="form-group">
	    			<label for="static_s_no" class="col-sm-3 control-label">学生学号：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_no"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_s_name" class="col-sm-3 control-label">学生姓名：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_s_gender" class="col-sm-3 control-label">学生性别：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_gender"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_s_email" class="col-sm-3 control-label">学生邮箱：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_email"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_s_phone_num" class="col-sm-3 control-label">手机号码：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_phone_num"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_aca_name" class="col-sm-3 control-label">所在学院：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_aca_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_b_name" class="col-sm-3 control-label">所在班级：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_b_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_s_birth" class="col-sm-3 control-label">出生日期：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_birth"></p>
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-warning" data-dismiss="modal" id="btn_notify">提醒交作业</button>
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
   				<h3 style="color: #00CCFF;" id="title">学生作业提交详情页</h3>
   			</li>
   			<li class="dropdown pull-right">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_tea"><strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="/MY_EMS/jsp/teaInfo.jsp">个人信息</a>
                    </li>
                    <li>
                        <a href="/MY_EMS/student/login_out.do">退出登录</a>
                    </li>
                </ul>
           	</li>
   		</ul>
   		<hr width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
   	</div>
  <div class="row-fluid">
	    	<div class="col-md-9" style="margin-bottom: 30px">
	    		<div class="col-md-12">
	    			<div class="col-md-9">
	    				<form class="form-inline" style="margin-left: 15px">
	    				<label style="font-size: 18px;margin-right: 80px">已交作业学生名单</label>
	    				 <input id="search_stu" class="form-control" placeholder="搜索学生" type="text" style="height: 35px;width: 200px"/>
			              <button type="button" class="btn btn-info" id="btn_search">
			              	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
			              </button>
			             </form>
	    			</div>
	    		</div>
	    		<table class="table table-hover table-striped table-bordered" >
	    			<thead>
	    				<tr>
	    					<th>学生信息</th>
	    					<th>提交作业附件</th>
	    					<th>作业提交时间</th>
	    					<th>教师打分</th>
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
		    
		    <div class="col-md-3" style="margin-top: 25px">
		    	<h4></h4>
		    	<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">未交作业学生名单</h3>
					</div>
					<div class="panel-body" style="height: 250px">
						<table id="table_stu" class="table table-hover table-striped " >
							<thead>
								<tr>
									<th style="width: 120px;background-color: white">学生</th>
									<th style="background-color: white">查看基本信息</th>
								</tr>
							</thead>
							<tbody id="tbody_stu"></tbody>
						</table>
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
	var tea;
	var ht_idx;
	var current_page;
	var stus;
	var stus2;
	$(function () {
		tea=JSON.parse(tea_session);//得到自定义的 tea对象
		var str_tea=tea.aca_name+"-"+tea.t_name+"老师";
		$("#dropDown_tea").text(str_tea);
		ht_idx=window.location.search.split("=")[1];
		to_PageWithJson(1);
	});
	
	function to_PageWithJson(pn) {
		$.ajax({
			url:"/MY_EMS/hs/getHssWithJson.do?ht_idx="+ht_idx,
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
				buildTable(result);		  //得到数据后构建表格
				stus2=result.extend.list3;
				buildStuTable();		//构建未提交作业学生的表格
				bulidPageInfo(result);	  //构建分页信息
				bulidPageNav(result);	   ///构建分页导航
			}
		});
	}
	
	function buildTable(result) {
		$('#tbody').empty();
		var hss=result.extend.pageInfo.list;
		console.log(hss);
		stus=result.extend.pageInfo2.list;
		$.each(hss,function(index,item){
			var $stu_info=$('<a></a>');
			var $file_a=$('<a></a>');
			$stu_info.text(stus[index].s_no+"-"+stus[index].s_name).attr('href',"#");
			$stu_info.attr('view_id',index).attr('class','stu_view');
			
			$file_a=$('<a></a>').text(item.hs_file_name);
			$file_a.attr('href',"/MY_EMS/hs/hsDownLoad.do?hs_idx="+item.hs_idx);
			
			var td1=$('<td></td>').append($stu_info);
			var td2=$('<td></td>').append($file_a);
			var td3=$('<td></td>').append(item.hs_up_time);
			
			var score_a=$("<a></a>").attr('hs_idx',item.hs_idx).attr('class','score_a');
			if(null==item.hs_score){
				score_a.text("还未打分");
			}else{
				score_a.text(item.hs_score);
			}
			var td4=$('<td></td>').append(score_a);	
				
			$('<tr></tr>').append(td1).append(td2).append(td3).append(td4).appendTo("#tbody");
		});
	}
	
	function buildStuTable() {
		$('#tbody_stu').empty();
		for(var i=0;i<stus2.length;i++){
			var td1=$("<td></td>").append(stus2[i].s_no+"-"+stus2[i].s_name);
			var view_btn=$('<button></button>').addClass("btn btn-success btn-sm stu_view")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-user')
			.append('查看信息'));
			view_btn.attr("view_id",i);
			var td2=$("<td></td>").append(view_btn)
			
			$('<tr></tr>').append(td1).append(td2).appendTo("#tbody_stu");
		}
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
			to_PageWithJson(1);
		})
		
		var prePageLi=$('<li></li>').append($('<a></a>').append("&laquo;"));
		prePageLi.click(function () {
			to_PageWithJson(result.extend.pageInfo.pageNum-1);
		})
		
		if(result.extend.pageInfo.hasPreviousPage==false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}
		
		var nextPageLi=$('<li></li>').append($('<a></a>').append("&raquo;"));
		nextPageLi.click(function () {
			to_PageWithJson(result.extend.pageInfo.pageNum+1);
		})
		
		var lastPageLi=$('<li></li>').append($('<a></a>').append("尾页").attr('href',"#"));
		lastPageLi.click(function () {
			to_PageWithJson(result.extend.pageInfo.lastPage);
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
				to_PageWithJson(item);
			})
			ul.append(numLi);
		});
		ul.append(nextPageLi).append(lastPageLi);
		
		var nav_page=$('<nav></nav>').append(ul);
		
		nav_page.appendTo("#page_nav");
	}
	
	$(document).on("click",".stu_view",function(){
		var a_stu;
		if($(this).hasClass("btn")){//点击按钮
			$("#btn_notify").removeAttr("disabled");
			a_stu=stus2[$(this).attr("view_id")];
		}else{
			$("#btn_notify").attr('disabled','disabled');
			a_stu=stus[$(this).attr("view_id")];
		}
		console.log(a_stu);
		$("#static_s_no").text(a_stu.s_no);
		$("#static_s_name").text(a_stu.s_name);
		$("#static_s_gender").text(a_stu.s_gender);
		$("#static_s_email").text(a_stu.s_email);
		$("#static_s_phone_num").text(a_stu.s_phone_num);
		$("#static_aca_name").text(a_stu.aca_name);
		$("#static_b_name").text(a_stu.s_grade+"级"+a_stu.b_name);
		$("#static_s_birth").text(a_stu.s_birth);
		
		$("#model_stu_view").modal({
			backdrop:"static"
		});
	});
	
	$(document).on("click",".score_a",function(){
		var score=prompt("请打分:",$(this).text())
		if(isNaN(score)){
			alert("请输入数字！");
		}else if(score===null){
			return;
		}else{
			var hs_idx=$(this).attr("hs_idx");
			$(this).text(score);
			$.ajax({
				url:"/MY_EMS/hs/updateScore.do?hs_idx="+hs_idx+"&hs_score="+score,
				type:"get",
				success : function() { //请求成功后处理函数。
	               alert("分数修改成功！");
	               to_PageWithJson(current_page);
				}
			}); 
		}
	});
	
	$("#btn_search").click(function () {//模糊查询学生,学号和姓名都可以
		var stu=$("#search_stu").val();
		$.ajax({
			url:"/MY_EMS/hs/searchStu.do?ht_idx="+ht_idx+"&s_no="+stu,
			type:"get",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为json对象
				buildTable(result);
				bulidPageInfo(result);
				bulidPageNav(result);
			}			
		});
	});
	
	$("#btn_notify").click(function () {
		$.ajax({
			url:"../tr/addInform.do",
			data:{"tr_content":ht_idx,
					"tr_no":tea.t_no,"zt_no":$("#static_s_no").text()}
		});
		alert("提醒成功！");
	})
</script>
</html>