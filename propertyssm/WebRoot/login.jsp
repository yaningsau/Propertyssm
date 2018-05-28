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
</head>
<body>
<div class="header">


  <center>
    <font size=+5 color="#fff">蒲新教师公寓物业管理系统</font>
  </center>
    </div>

	<div class="container col-lg-offset-4 col-lg-4">
		<div class="head col-lg-offset-4"><span><font color="#fff">登录</font></span></div>
		<div class="divide-40"></div>
		<form action="login.do"  method="post" id="form" onsubmit="return check(this)">
			<div class="form-group col-lg-offset-1 col-lg-10">
	        	<label class="control-label"><font size=+1 color="#fff">用户名</font></label>
	           	<input type="text" class="form-control"  name="username" id="username"/>
	        </div>
	    	<div class="form-group col-lg-offset-1 col-lg-10">
	        	<label class="control-label"><font size=+1 color="#fff">密码</font></label>
	           		<input type="password" class="form-control" name="password" id="password"/>
	        </div>
	        <div class="form-group col-lg-offset-1 col-lg-10">
	        
	        </div>
	        <div class="form-group col-lg-offset-1 col-lg-10">
				<button type="submit" class="btn btn-default col-lg-6">登录</button>
				<button type="reset" class="btn btn-default col-lg-6">重置</button>
				
			</div>
			
			<div class="form-group col-lg-offset-1 col-lg-10">
              <font size=+2 color="#fff">没有账号请点击 ——> <a href="/propertyssm/register.jsp"> 注册</font></a>
            </div>
			</form>
	    
    </div>
    
    <script type="text/javascript">
      function check(form){
        if(form.username.value==''){
           alert("请输入用户名!!!");
           return false;
        }
        if(form.password.value==''){
           alert("请输入密码!!!");
           return false;
        }
        return true;
      }
    </script>
</body>
</html>