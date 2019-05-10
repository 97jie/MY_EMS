<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生个人信息页面</title>
 	<link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <style type="text/css">
    	label,p{
    		font-size: 18px
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
<div class="modal fade" id="model_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">教师个人信息修改</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_edit_tea">
	       		<input type="hidden" id="edit_t_no" name="t_no"> 
	  			<div class="form-group">
	    			<label for="p_t_name" class="col-sm-3 control-label">教师姓名：</label>
	   				<div class="col-sm-8">
	     				<p id="p_t_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="edit_t_pwd" class="col-sm-3 control-label">登录密码：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="t_pwd" class="form-control" id="edit_t_pwd">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="edit_t_email" class="col-sm-3 control-label" >邮箱号：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="t_email" class="form-control" id="edit_t_email">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="edit_t_office" class="col-sm-3 control-label">办公室：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="t_office" class="form-control" id="edit_t_office">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="edit_t_info" class="col-sm-3 control-label">教师信息：</label>
	    			<div class="col-sm-8" >
	      				<textarea rows="3" id="edit_t_info" name="t_info"></textarea>
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="tea_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/stu_logo.png" />
    			<li>
    				<h3 style="color: #00CCFF;">教师个人信息</h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_tea"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="/MY_EMS/teacher/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr  width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="col-md-8 col-md-offset-3">
    		<form class="form-horizontal">
    			<div class="form-group">
	    			<label for="static_t_name" class="col-sm-3 control-label">教师姓名：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_name"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_t_pwd" class="col-sm-3 control-label">账户密码：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_pwd"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_t_email" class="col-sm-3 control-label">教师邮箱：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_email"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_aca_name" class="col-sm-3 control-label">所在学院：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_aca_name"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_t_office" class="col-sm-3 control-label">办公室地址：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_office"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_t_info" class="col-sm-3 control-label">教师信息：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_t_info"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
    				<label for="static_a_phone" class="col-sm-3 control-label">操作：</label>
    				<div class="col-sm-8">
    					<button type="button" class="btn btn-success" id="btn_edit">
		              		<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>信息修改
			            </button>
		    			<button type="button" class="btn btn-danger" id="btn_back_home" style="margin-left: 20px">
			              	<span class="glyphicon glyphicon-backward" aria-hidden="true"></span>返回主页
			            </button>
    				</div>
	  			</div>
    		</form>
    	</div>
    </div>
</body>
<script type="text/javascript">
	var tea;
	$(function () {
		tea=JSON.parse(tea_session);
		var str_tea=tea.t_name+"老师";
		$("#dropDown_tea").text(str_tea);
		loadInfo(tea);
	});
	function loadInfo(tea) {
		$("#static_t_name").text(tea.t_name);
		$("#static_t_pwd").text(tea.t_pwd);
		$("#static_t_email").text(tea.t_email);
		$("#static_aca_name").text(tea.aca_name);
		$("#static_t_office").text(tea.t_office);
		$("#static_t_info").text(tea.t_info);
	}
	
	$("#btn_edit").click(function () {
		$("#edit_t_no").val(tea.t_no);
		$("#p_t_name").text(tea.t_name);
		$("#edit_t_pwd").val(tea.t_pwd);
		$("#edit_t_email").val(tea.t_email);
		$("#edit_t_office").val(tea.t_office);
		$("#edit_t_info").val(tea.t_info);
		
		error_clean($("#edit_t_pwd"));
		error_clean($("#edit_t_email"));
		error_clean($("#edit_t_office"));
		error_clean($("#edit_t_info"));
		$("#model_edit").modal({
			backdrop:"static"
		});
	});

	$("#tea_update_btn").click(function () {
		var data_t=$("#form_edit_tea").serialize();
		data_t = decodeURIComponent(data_t,true); //中文乱码解决办法
		if(confirm("确定要修改以上信息吗？")){
			$.ajax({
				url:"/MY_EMS/teacher/saveTea.do",
				type:"post",
				data:data_t,
				success:function(result){
					result=JSON.parse(result);
					if(result.code==200){
						$("#model_edit").modal("hide");
						alert("修改成功！");
						tea=result.extend.tea;
						loadInfo(tea);
					}else{
						if(undefined!=result.extend.error_map.t_pwd){
							validata_form($("#edit_t_pwd"),"error",result.extend.error_map_t_pwd);
						}
						if(undefined!=result.extend.error_map.t_email){
							validata_form($("#edit_t_email"),"error",result.extend.error_map.t_email);
						}
						if(undefined!=result.extend.error_map.t_office){
							validata_form($("#edit_t_office"),"error",result.extend.error_map.t_office);
						}
						if(undefined!=result.extend.error_map.t_info){
							validata_form($("#edit_t_info"),"error",result.extend.error_map.t_info);
						}
					}
				}
			});
		} 
	});
	$("#btn_back_home").click(function () {
		window.location.href="teaMain.jsp";
	})
	
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
</script>
</html>