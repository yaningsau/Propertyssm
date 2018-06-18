<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,inal-scale-1">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/login.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/header.css" rel="stylesheet">
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery.form.js"></script>

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
        <form id="registerForm" name="registerForm" action="register.do"  method="post">
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">用户名</font></label>
                <input type="text" class="form-control"  name="username" id="username" onblur="checkUm()"/>
                <div id="tipUm"></div>
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">身份证号</font></label>
                    <input type="text" class="form-control" name="idcard" id="idcard" onBlur="chkIdCard()"/>
                    <span id="tipCard"></span>
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">密码</font></label>
                    <input type="password" class="form-control" name="password" id="password" onblur="checkPwd()" />
                        <div id="tippwd"></div>
            </div>
            <div class="form-group col-lg-offset-1 col-lg-10">
                <label class="control-label"><font size=+1 color="#fff">确认密码</font></label>
                    <input type="password" class="form-control" name="passwd" id="passwd"onBlur="checkPwd2()" />
                            <div id="tippwd2"></div>
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
    //验证用户名
   function checkUm(){
      document.getElementById("tipUm").innerHTML = "";
      if(document.getElementById("username").value==""){
          document.getElementById("tipUm").innerHTML = "<font color='red' size='-1'>请输入用户名</font>";
      }
      
    }
    
   function tipPwd(){
   document.getElementById("tippwd").innerHTML = "<font color='red' size='-1'>请输入6位以上的密码</font>";
   }

   //验证密码长度
   function checkPwd(){
      document.getElementById("tippwd").innerHTML = "";
      var password = document.getElementById("password").value;
      if(password.length<6||password.length>10){
          document.getElementById("tippwd").innerHTML = "<font color='red' size='-1'>请输入6~10位的密码</font>";
          document.getElementById("password").value="";
          document.getElementById("password").focus();
      }
    }

   function checkPwd2(){
      document.getElementById("tippwd2").innerHTML = ""
      var password1 = document.getElementById("password");
      var password2 = document.getElementById("passwd");
      if(password1.value!=password2.value){
         document.getElementById("tippwd2").innerHTML = "<font color='red' size='-1'>两次密码输入不一致</font>";
          password2.value="";
      }
    }

    //验证身份证号码
    function chkIdCard(){
    document.getElementById("tipCard").innerHTML = "";
    var idcard = document.getElementById("idcard").value;
    var reg = /^\d{18}|\d{17}[xX]$/;
    
    if(idcard.match(reg)!=idcard){
       document.getElementById("tipCard").innerHTML = "<font color='red' size='-1'>输入的身份证号码格式不正确</font>";
    }   
   }
    $("#submit").click(function(){
       $("#registerForm").ajaxSubmit(function(response){
            if (response.success) {
              alert("用户注册成功");
              window.location.href = 'login.jsp';
          } else {
              alert("身份证号或用户名无效!");
          } 
       });
     
    }); 
    </script>
</body>
</html>