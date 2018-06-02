<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,inal-scale-1">
<link href="bootstrap-3.3.5-dist/css/login.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/header.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>
</head>
<body>
<div id="d" align="right" style="margin-top:0px">
<a href="login.jsp"><font size=+2 color="#fff" >登陆</font></a>
</div>
<div class="header">
  <center>
    <font size=+5 color="#fff">蒲新教师公寓物业管理系统</font>
  </center>

    <div class="container col-lg-offset-4 col-lg-4">
        <div form-group class="col-lg-offset-1 col-lg-10">
        <div class="head col-lg-offset-4" >
        <span><font size=+5 color="#fff">注册</font></span></div>
          </div>
        <div class="divide-40"></div>
        <form id="registerForm" action="register.do"  method="post">
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">用户名</font></label>
                <input type="text" class="form-control"  name="username"/>
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">身份证号</font></label>
                    <input type="text" class="form-control" name="idcard" />
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">密码</font></label>
                    <input type="password" class="form-control" name="password" />
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">确认密码</font></label>
                    <input type="password" class="form-control" name="passwd" />
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
            
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <button type="button" id="submit" class="btn btn-default col-lg-6">注册</button>
                <button type="reset" class="btn btn-default col-lg-6">重置</button>  
            </div>
            
             
            </form>
            
        
    </div>
    <script type="text/javascript">
    
    
    $("#submit").click(function(){
       $("#registerForm").ajaxSubmit(function(response){
            if (response.success) {
              alert("用户注册成功");
              window.location.href = 'login.jsp';
          } else {
              alert("用户注册失败!");
          } 
       });
     
    }); 
    </script>
</body>
</html>