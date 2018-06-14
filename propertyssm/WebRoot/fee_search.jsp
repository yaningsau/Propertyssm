<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<!-- <script src="bootstrap-3.3.5-dist/js/jquery-1.11.0.min.js"></script> -->
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>
<!-- 表单验证 -->
<script src="bootstrap-3.3.5-dist/js/validate/jquery.validate.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/validate/additional-methods.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="owner_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>物业费管理</a></li>
                <li>></li>
                <li><a>查询物业费</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form  action="listPropertyfee.do" id="addUserForm" method="post" class="form-horizontal">
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        1-1-20
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房屋物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        20
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">停车场物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                              10                            
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">总物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        30
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">缴费状态:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                                                                    未缴费                                                      
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">欠费金额:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        30
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                       
                    </div>
                </div>
                
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="缴费">缴费</button>
                       
                     </div>
                 </div>
            </form>
        </div>
    </div>

</body>
</html>