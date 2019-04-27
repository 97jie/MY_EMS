<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员个人信息页面</title>
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
	var stu_session='<%=session.getAttribute("stu")%>';
	if(stu_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	}
</script>
<div class="modal fade" id="model_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">学生个人信息修改</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_edit_stu">
	       		<input type="hidden" id="edit_s_no" name="s_no"> 
	  			<div class="form-group">
	    			<label for="static_a_no" class="col-sm-3 control-label">学生姓名：</label>
	   				<div class="col-sm-8">
	     				<p id="p_s_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="edit_s_pwd" class="col-sm-3 control-label">登录密码：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="s_pwd" class="form-control" id="edit_s_pwd">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="edit_s_email" class="col-sm-3 control-label" >邮箱号：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="s_email" class="form-control" id="edit_s_email">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="edit_s_phone_num" class="col-sm-3 control-label">手机号：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="s_phone_num" class="form-control" id="edit_s_phone_num">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/stu_logo.png" />
    			<li>
    				<h3 style="color: #00CCFF;">学生个人信息</h3>
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
    		<hr  width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="col-md-8 col-md-offset-3">
    		<form class="form-horizontal">
    			<div class="form-group">
	    			<label for="static_s_no" class="col-sm-3 control-label">学生姓名：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_name"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_s_pwd" class="col-sm-3 control-label">账户密码：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_pwd"></p>
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
	    			<label for="static_s_id_card" class="col-sm-3 control-label">身份证号：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_id_card"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_aca_name" class="col-sm-3 control-label">所属学院：</label>
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
	    			<label for="static_s_birth" class="col-sm-3 control-label">生日：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_s_birth"></p>
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
	var stu;
	$(function () {
		stu=JSON.parse(stu_session);
		var str_stu=stu.s_grade+"级"+stu.b_name+"-"+stu.s_name;
		$("#dropDown_stu").text(str_stu);
		loadInfo(stu);
	});
	function loadInfo(stu) {
		console.log(stu);
		$("#static_s_name").text(stu.s_name);
		$("#static_s_pwd").text(stu.s_pwd);
		$("#static_s_email").text(stu.s_email);
		$("#static_s_phone_num").text(stu.s_phone_num);
		$("#static_s_id_card").text(stu.s_id_card);
		$("#static_aca_name").text(stu.aca_name);
		$("#static_b_name").text(stu.s_grade+"级-"+stu.b_name);
		$("#static_s_birth").text(stu.s_birth);
	}
	
	$("#btn_edit").click(function () {
		$("#edit_s_no").val(stu.s_no);
		$("#p_s_name").text(stu.s_name);
		$("#edit_s_pwd").val(stu.s_pwd);
		$("#edit_s_email").val(stu.s_email);
		$("#edit_s_phone_num").val(stu.s_phone_num);
		
		error_clean($("#edit_s_pwd"));
		error_clean($("#edit_s_email"));
		error_clean($("#edit_s_phone_num"));
		$("#model_edit").modal({
			backdrop:"static"
		});
	});

	$("#stu_update_btn").click(function () {
		var data_s=$("#form_edit_stu").serialize();
		data_s = decodeURIComponent(data_s,true); //中文乱码解决办法
		console.log(data_s);
		if(confirm("确定要修改以上信息吗？")){
			$.ajax({
				url:"/MY_EMS/student/saveStu.do",
				type:"post",
				data:data_s,
				success:function(result){
					result=JSON.parse(result);
					if(result.code==200){
						$("#model_edit").modal("hide");
						alert("修改成功！");
						stu=result.extend.stu;
						loadInfo(stu);
					}else{
						if(undefined!=result.extend.error_map.s_pwd){
							validata_form($("#edit_s_pwd"),"error",result.extend.error_map_s_pwd);
						}
						if(undefined!=result.extend.error_map.s_email){
							validata_form($("#edit_s_email"),"error",result.extend.error_map.s_email);
						}
						if(undefined!=result.extend.error_map.s_phone_num){
							validata_form($("#edit_s_phone_num"),"error",result.extend.error_map.s_phone_num);
						}
					}
				}
			});
		} 
	});
	$("#btn_back_home").click(function () {
		window.location.href="stuMain.jsp";
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