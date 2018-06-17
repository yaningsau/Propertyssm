<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物业管理系统</title>
<link href="bootstrap-3.3.5-dist/css/header.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="header">
	
	<div class="nav_l col-sm-4">
            <span style="color:#fff">欢迎您,${loguser.username}！</span>
        </div>


  <div class="nav_l col-sm-8">
    <font size=+5 color="#fff">蒲新教师公寓物业管理系统</font>
    <a data-toggle="modal" data-target="#myModal" style="color: white; margin-left: 180px;">修改密码</a>&nbsp;
    <a href="login.jsp" style="color: white" onclick="return confirm('确定注销登录吗?');">注销</a>
  </div>
    </div>
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改密码</h4>
      </div>
      <div class="modal-body">
		<div id="updateDiv" class="col-md-12 updateDiv" style="margin-top: 50px;">
		<input type="hidden" class="form-control" id="username" name="username" value="${loguser.username}" />
			<div class="form-group">
				<div>
					<label class="col-sm-offset-3 col-sm-2 control-label">原始密码</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="originalPw"
							name="originalPw" />
					</div>
				</div>
	
				<div style="padding-top: 50px;">
					<label class="col-sm-offset-3 col-sm-2 control-label">新密码</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="newPw" name="newPw" onblur="checkPwd()" />
						<div id="tippwd"></div>
					</div>
				</div>
				<div style="padding-top: 50px;">
					<label class="col-sm-offset-3 col-sm-2 control-label">确认密码</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="confirmPw"
							name="confirmPw" onBlur="checkPwd2()" />
							<div id="tippwd2"></div>
					</div>
				</div>
			</div>
	   </div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

   function tipPwd(){
     document.getElementById("tippwd").innerHTML = "<font color='red' size='-1'>请输入6位以上的密码</font>";
   }

   //验证密码长度
   function checkPwd(){
      document.getElementById("tippwd").innerHTML = "&nbsp;";
      var password = document.getElementById("newPw").value;
      if(password.length<6||password.length>10){
          document.getElementById("tippwd").innerHTML = "<font color='red' size='-1'>请输入6~10位的密码</font>";
          document.getElementById("newPw").value="";
          document.getElementById("newPw").focus();
      }
    }

   function checkPwd2(){
      document.getElementById("tippwd2").innerHTML = "&nbsp;"
      var password1 = document.getElementById("newPw");
      var password2 = document.getElementById("confirmPw");
      if(password1.value!=password2.value){
         document.getElementById("tippwd2").innerHTML = "<font color='red' size='-1'>两次密码输入不一致</font>";
          password2.value="";
      }
    }


    $("#saveBtn").click(function() {
    var username = $("#username").val();
    var originalPw = $("#originalPw").val();
    var newPw = $("#newPw").val();
    
        $.ajax({
              type:"get",
              url: "<%= basePath%>/updatePasswd.do",
              data: {"originalPw":originalPw, "newPw":newPw, "username":username},
              success:function(result) {
                   if (result.success) {
                        alert("修改密码成功，请重新登录！");
                        window.location.href = 'login.jsp';
                   } else {
                        alert("修改密码失败！");
                   }
              },
              error: function(result) {
                   alert("修改密码失败！[error]");
              }
           });
    });
</script>
</body>
</html>