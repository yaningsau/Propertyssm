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
                <li><a>房产管理</a></li>
                <li>></li>
                <li><a>添加房产</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form action="addRoom.do" id="addRoomForm" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="room"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">户型</label>
                    <div class="col-sm-3">
                    <select name="roomtype" id="roomtype" class="form-control">
                    <option value=""></option>
                    <option value="A1">A1</option>
                    <option value="A2">A2</option>
                    <option value="B1">B1</option>
                    <option value="B2">B2</option>
                    <option value="B3">B3</option>
                    <option value="C1">C1</option>
                    <option value="C2">C2</option>
                    <option value="C3">C3</option>
                    <option value="C4">C4</option>
                    <option value="C5">C5</option>
                    <option value="C6">C6</option> 
                    <option value="D">D</option>                               
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">公摊面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="publicarea"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">套内面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="roomarea"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">户型面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="area"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">阁楼面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="loftarea"/>
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
       $("#addRoomForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("添加成功");
                    window.location.href = 'listRoom.do';
                } else if (response.tip == "error") {
                    alert("添加失败!");
                } 
       });
     
    }); 
    </script>
    
</body>
</html>