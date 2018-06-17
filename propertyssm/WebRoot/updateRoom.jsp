<%@page import="com.sau.ums.bean.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>房产管理</a></li>
                <li>></li>
                <li><a>修改房产信息</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form id="updateForm" action="updateRoom.do" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号</label>
                    <input type="hidden" name="room" value="${rm.room }">
                    <div class="col-sm-3" style="margin-top: 5px;">
                        ${rm.room }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">户型</label>
                    <div class="col-sm-3">
                    <select name="roomtype" id="roomtype" class="form-control">    
                    <option value="A1"<c:if test="${rm.roomtype eq 'A1'}">selected</c:if> >A1</option>
                    <option value="A2" <c:if test="${rm.roomtype eq 'A2' }"> selected </c:if>>A2</option>
                    <option value="B1" <c:if test="${rm.roomtype eq 'B1' }"> selected </c:if>>B1</option>

                    <option value="B2" <c:if test="${rm.roomtype eq 'B2' }"> selected </c:if>>B2</option>

                    <option value="B3" <c:if test="${rm.roomtype eq 'B3' }"> selected </c:if>>B3</option>

                    <option value="C1" <c:if test="${rm.roomtype eq 'C1' }"> selected </c:if>>C1</option>

                    <option value="C2" <c:if test="${rm.roomtype eq 'C2' }"> selected </c:if>>C2</option>

                    <option value="C3" <c:if test="${rm.roomtype eq 'C3' }"> selected </c:if>>C3</option>

                    <option value="C4" <c:if test="${rm.roomtype eq 'C4' }"> selected </c:if>>C4</option>
  
                    <option value="C5" <c:if test="${rm.roomtype eq 'C5' }"> selected </c:if>>C5</option>
 
                    <option value="C6" <c:if test="${rm.roomtype eq 'C6' }"> selected </c:if>>C6</option> 

                    <option value="D" <c:if test="${rm.roomtype eq 'D' }"> selected </c:if>>D</option>  
                                                
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">公摊面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="publicarea"
                         value=${rm.publicarea } >
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">套内面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="roomarea"
                        value=${rm.roomarea }>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">户型面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="area"
                        value=${rm.area }>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">阁楼面积</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="loftarea"
                        value=${rm.loftarea }>
                    </div>
                </div>
                
                
                
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
                        <button type="reset" class="btn btn-default">重置</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
    function getRoomInfoById(room) {
           $.ajax({
              type:"get",
              url: "<%= basePath%>propertyssm/getRoomInfoById.do",
              data: {"room":room},
              success:function(result) {
                   alert("success");
              },
              error: function(result) {
                   alert("fail");
              }
           });
       }
    
    $("#submit").click(function(){
       $("#updateForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("修改成功");
                    window.location.href = 'listRoom.do';
                } else if (response.tip == "error") {
                    alert("修改失败!");
                } 
       });
     
    }); 
    </script>
    
</body>
</html>