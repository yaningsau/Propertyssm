<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="owner_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>家属管理</a></li>
                <li>></li>
                <li><a>添加家属</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form action="addFamily.do" id="addForm" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="room"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">姓名</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="name"/>
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
                    <label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="idcard" id="idcard" onBlur="chkIdCard()"/><span id="tipCard"></span>
                    </div>
                </div>
                <input type="hidden" class="form-control" name="kind"
                            value="家属">
                <input type="hidden" class="form-control" name="status"
                            value= ${loguser.status }>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" name="ps"/></textarea>
                    </div>
                </div>
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
                        <button type="reset" class="btn btn-default" value="重置">重置</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
    //验证身份证号码
    function chkIdCard(){
    document.getElementById("tipCard").innerHTML = "&nbsp;";
    var idcard = document.getElementById("idcard").value;
    var reg = /^\d{18}|\d{17}[xX]$/;
    
    if(idcard.match(reg)!=idcard){
       document.getElementById("tipCard").innerHTML = "<font color='red' size='-1'>输入的身份证号码格式不正确</font>";
    }   
   }
    
    $("#submit").click(function(){
       $("#addForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("用户添加成功");
                    window.location.href = 'Prpertyfee.do';
                } else if (response.tip == "error") {
                    alert("用户添加失败!");
                } 
       });
     
    }); 
    </script>
</body>
</html>