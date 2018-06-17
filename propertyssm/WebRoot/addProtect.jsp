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
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>安防管理</a></li>
                <li>></li>
                <li><a>添加安防</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form action="addProtect.do" id="addProtectForm" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">位置</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="position"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">设备</label>
                    <div class="col-sm-3"  style="margin-top: 5px;">
                    <input type="checkbox" name="facility" value="灭火器"/>灭火器
                    <input type="checkbox" name="facility" value="烟雾报警器"/>烟雾报警器
                    <input type="checkbox" name="facility" value="防盗窗"/>防盗窗
                    </div>
                </div>
                    <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" name="ps"/></textarea>
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
    $("#submit").click(function(){
       $("#addProtectForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("添加成功");
                    window.location.href = 'listProtect.do';
                } else if (response.tip == "error") {
                    alert("添加失败!");
                } 
       });
     
    }); 
    </script>
    
</body>
</html>