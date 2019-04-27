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
    var ad_session='<%=session.getAttribute("admin")%>';
    /* alert(ad_session.split("=")[1].split(",")[0]) */
	if(ad_session=='null'){
		alert("请先登录！");
		window.location.href="adminLogin.jsp";
	} 
</script>
<div class="modal fade" id="model_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">管理员信息修改</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_edit_a">
	  			<div class="form-group">
	    			<label for="static_a_no" class="col-sm-3 control-label">管理员账号：</label>
	   				<div class="col-sm-8">
	   					<input type="hidden" id="edit_a_no" name="a_no">
	     				<p id="p_a_no"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="static_a_pwd" class="col-sm-3 control-label">登录密码：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="a_pwd" class="form-control" id="edit_a_pwd">
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="static_a_pwd" class="col-sm-3 control-label" >邮箱号：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="a_email" class="form-control" id="edit_a_email">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="static_a_pwd" class="col-sm-3 control-label">手机号：</label>
	    			<div class="col-sm-8" >
	      				<input type="text" name="a_phone_num" class="form-control" id="edit_a_phone_num">
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="a_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/stu_logo.png" />
    			<li>
    				<h3 style="color: #00CCFF;">管理员个人信息</h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu">管理员<strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="/MY_EMS/admin/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr  width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="col-md-8 col-md-offset-4" style="margin-top: 50px">
    		<form class="form-horizontal">
    			<div class="form-group">
	    			<label for="static_a_no" class="col-sm-3 control-label">账户名称：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_a_no"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_a_pwd" class="col-sm-3 control-label">账户密码：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_a_pwd"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_a_emial" class="col-sm-3 control-label">管理员邮箱：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_a_email"></p>
	  				</div>
	  			</div>
    			<div class="form-group">
	    			<label for="static_a_phone" class="col-sm-3 control-label">管理员手机号：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_a_phone_num"></p>
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
	var admin;
	$(function () {
		ad_session='<%=session.getAttribute("admin")%>';
		admin=JSON.parse(ad_session);
		loadInfo(admin);
	});
	function loadInfo(admin) {
		console.log(admin);
		$("#static_a_no").text(admin.a_no);
		$("#static_a_pwd").text(admin.a_pwd);
		$("#static_a_email").text(admin.a_email);
		$("#static_a_phone_num").text(admin.a_phone_num);
	}
	
	$("#btn_edit").click(function () {
		$("#p_a_no").text(admin.a_no);
		$("#edit_a_no").val(admin.a_no);
		$("#edit_a_pwd").val(admin.a_pwd);
		$("#edit_a_email").val(admin.a_email);
		$("#edit_a_phone_num").val(admin.a_phone_num);
		
		error_clean($("#edit_a_pwd"));
		error_clean($("#edit_a_email"));
		error_clean($("#edit_a_phone_num"));
		$("#model_edit").modal({
			backdrop:"static"
		});
	});

	$("#a_update_btn").click(function () {
		var data_a=$("#form_edit_a").serialize();
		data_a = decodeURIComponent(data_a,true); //中文乱码解决办法
		$.ajax({
			url:"/MY_EMS/admin/saveA.do",
			type:"post",
			data:data_a,
			success:function(result){
				result=JSON.parse(result);
				if(result.code==200){
					$("#model_edit").modal("hide");
					alert("修改成功！");
					admin=result.extend.ad;
					loadInfo(admin);
				}else{
					if(undefined!=result.extend.error_map.a_pwd){
						validata_form($("#edit_a_pwd"),"error",result.extend.error_map.a_pwd);
					}
					if(undefined!=result.extend.error_map.a_email){
						validata_form($("#edit_a_email"),"error",result.extend.error_map.a_email);
					}
					if(undefined!=result.extend.error_map.a_phone_num){
						validata_form($("#edit_a_phone_num"),"error",result.extend.error_map.a_phone_num);
					}
				}
			}
		});
	});
	$("#btn_back_home").click(function () {
		window.location.href="adminMain.jsp";
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