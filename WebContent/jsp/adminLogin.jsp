<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
</head>
<body style="background-color: #337ab7">
    <div class="container-fluid" style="background-color: #dff0d8">
        <div class="row-fluid" style="margin-top: 30px">
            <div class="span12">
                <h2 contenteditable="true" class="text-info" style="font-weight: bold">作业管理系统——管理员登录界面</h2>
            </div>
             <hr  width="90%" align="left" style="height:3px;margin-top: 40px;background-color: #0f0f0f" />
        </div>
        <div class="row-fluid" style="margin-top: 100px">
            <div class="col-lg-8" style="padding-bottom: 50px">
                <img src="../image/login.jpg" style="width: 400px;margin-left: 100px"/>
            </div>
            <div class="col-lg-4" >
                <form class="form-horizontal" id="admin_input" style="padding-top: 20px">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="a_no" style="font-size: 18px">账号:</label>
                        <div class="controls col-sm-5">
                            <input id="inputname" type="text" name="a_no" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="inputPassword" style="font-size: 18px">密码:</label>
                        <div class="controls col-sm-5">
                            <input id="inputPassword" type="password" name="a_pwd" class="form-control"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label class="checkbox"style="margin-top: 15px;padding-left: 66px;font-size: 16px"><input type="checkbox" id="rem_pwd"/> 记住密码</label>
                            <button type="button" class="btn btn-primary" style="margin-top: 20px;width: 240px" id="login">登陆</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
    <script>
        function setCookie(name,value,timeout) {
            var d=new Date()
            d.setDate(d.getDate()+timeout);
            document.cookie = name + '=' + value + ';expires='+ d;
        }
        function getCookie(name){
            var reg = RegExp(name+'=([^;]+)');
            var arr = document.cookie.match(reg);
            if(arr){
                return arr[1];
            }else{
                return '';
            }
        };

        var name=getCookie("name");
        var pwd=getCookie("pwd")
        var inputname=$('#inputname')[0];
        var inputPassword=$('#inputPassword')[0];
        if(name){
            inputname.value=name;
        }
        if(pwd){
            inputPassword.value=pwd;
        }
        
        function verify(ele) {
            if(!ele.value){
                alert("用户名或密码不能为空！");
            }
        }
        
        $("#login").click(function () {
            if(document.getElementById('rem_pwd').checked==true){
                setCookie("name",inputname.value,7);
                setCookie("pwd",inputPassword.value,7);
            }
           verify(inputname);
           verify(inputPassword);
           var data_admin=$("#admin_input").serialize();
           data_admin = decodeURIComponent(data_admin,true); 
           $.ajax({
        	 url:"/MY_EMS/admin/adminLogin.do",
        	 type:"post",
        	 data:data_admin,
        	 success:function(result){
        		 result=JSON.parse(result);
        	 	if(result.code==100){
        	 		alert("用户名或密码错误!");
        	 	}else{
        	 		window.location.href="/MY_EMS/jsp/adminMain.jsp";
        	 	}
        	 }
           });
        });

    </script>
</html>