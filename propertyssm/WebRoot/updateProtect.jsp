<%@page import="com.sau.ums.bean.Protect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <li><a>安防管理</a></li>
                <li>></li>
                <li><a>修改安防信息</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form id="updateForm" action="updateProtect.do" method="post" class="form-horizontal"
                role="form">
                <div class="form-group">
                    <div>
                        <input type="hidden" class="form-control" name="id"
                            value=${protect.id }>
                    </div>
                    <label class="col-sm-offset-3 col-sm-2 control-label">位置</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                            <input type="text" class="form-control" name="position"
                            value=${protect.position }>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">设备</label>
                    <div class="col-sm-3"  style="margin-top: 5px;">
                    
                    <input type="checkbox" name="facility" value="灭火器" <c:if test="${fn:contains(protect.facility,'灭火器')}">checked="checked"</c:if> />灭火器
                    <input type="checkbox" name="facility" value="烟雾报警器" <c:if test="${fn:contains(protect.facility,'烟雾报警器')}">checked="checked"</c:if>/>烟雾报警器
                    <input type="checkbox" name="facility" value="防盗窗" <c:if test="${fn:contains(protect.facility,'防盗窗')}">checked="checked"</c:if>/>防盗窗
                    
                    </div>
                </div>
                
                
                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
                    </div>
                </div>
            </form>

        </div>

    </div>

    <script type="text/javascript">
       function getProtectInfoById(id) {
           $.ajax({
              type:"get",
              url: "<%= basePath%>propertyssm/getProtectInfoById.do",
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
                    alert("修改成功");
                    window.location.href = 'listProtect.do';
                } else if (response.tip == "error") {
                    alert("修改失败!");
                } 
       });
     
    }); 
   </script>

</body>
</html>