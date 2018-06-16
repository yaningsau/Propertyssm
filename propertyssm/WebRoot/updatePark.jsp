<%@page import="com.sau.ums.bean.Park"%>
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
                <li>></li>
                <li><a>停车场管理</a></li>
                <li>></li>
                <li><a>停车位使用登记</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form id="updateForm" action="updatePark.do" method="post" class="form-horizontal"
                role="form">
                <div class="form-group">
                    <div>
                        <input type="hidden" class="form-control" name="carnum"
                            value=${park.carnum }>
                    </div>
                    <label class="col-sm-offset-3 col-sm-2 control-label">车位号</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                            ${park.carnum }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">开始使用时间</label>
                    <div class="col-sm-3">
                        <input type="date"class="form-control" name="begintime">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">结束时间</label>
                    <div class="col-sm-3">
                        <input type="date"class="form-control" name="endtime">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">所属房号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="room">
                    </div>
                </div>
                
                   <input type="hidden" class="form-control" name="status"
                            value="使用中"/>
                
                
                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
                    </div>
                </div>
            </form>

        </div>

    </div>

    <script type="text/javascript">
       function getParkInfoById(id) {
           $.ajax({
              type:"get",
              url: "<%= basePath%>propertyssm/getParkInfoById.do",
              data: {"id":id},
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
                    alert("登记成功");
                    window.location.href = 'listPark.do';
                } else if (response.tip == "error") {
                    alert("登记失败!");
                } 
       });
     
    }); 
   </script>

</body>
</html>