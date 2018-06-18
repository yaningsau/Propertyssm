<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <c:if test="${ loguser.kind == '管理员' }">
    <jsp:include page="admin_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '保安' }">
    <jsp:include page="security_l.jsp"></jsp:include>
    </c:if>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>门禁</a></li>
                <li>></li>
                <li><a>外来人员记录</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form action="addGuard.do" id="addGuardForm" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">姓名</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="idcard" id="idcard" onBlur="chkIdCard()"/><span id="tipCard"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">性别</label>
                    <div class="col-sm-3">
                                                          女<input type="radio" name="sex" value="女"/>
                                                          男<input type="radio" name="sex" value="男"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">电话</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="tel" id="tel" onBlur="chkTel()"/><span id="tiptel"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">车牌号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="lnum"/>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">进入时间</label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" name="time"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" placeholder="为什么要进入小区" name="ps"/></textarea>
                    </div>
                </div>
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default">提交</button>
                        <button type="reset" class="btn btn-default">重置</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
    
    //验证手机号
    function chkTel(){
    document.getElementById("tiptel").innerHTML = "";
    var idcard = document.getElementById("tel").value;
    var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
    
    if(idcard.match(reg)!=idcard){
       document.getElementById("tiptel").innerHTML = "<font color='red' size='-1'>输入的电话号码格式不正确</font>";
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
       $("#addGuardForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("添加成功");
                    window.location.href = 'listGuard.do';
                } else if (response.tip == "error") {
                    alert("添加失败!");
                } 
       });
     
    }); 
    </script>
    
</body>
</html>