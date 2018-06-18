<%@page import="com.sau.ums.bean.Propertyfee"%>
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
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<!-- <script src="bootstrap-3.3.5-dist/js/jquery-1.11.0.min.js"></script> -->
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>CSS/js/jqPaginator.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery.form.js"></script>

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <c:if test="${ loguser.kind == '业主' }">
    <jsp:include page="owner_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '家属' }">
    <jsp:include page="family_l.jsp"></jsp:include>
    </c:if>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>物业费管理</a></li>
                <li>></li>
                <li><a>查询物业费</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form  action="Propertyfee.do" id="addUserForm" method="post" class="form-horizontal">
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                    <input type="hidden" class="form-control" name="room"
                            value=${propertyfee.room }>
                        ${propertyfee.room }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房屋物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        ${propertyfee.housefee }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">停车场物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                              ${propertyfee.parkfee }                            
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">总物业费:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        ${propertyfee.payment }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">缴费状态:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">            
                           ${propertyfee.status }                                                      
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">欠费金额:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                        ${propertyfee.arrearage }
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                       ${propertyfee.ps }
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">请输入缴费金额:</label>
                    <div class="col-sm-3" style="margin-top: 5px;">
                       <input type="text" class="form-control" name="fee" id="fee" > 
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
<script type="text/javascript">

    function getHousefee(room) {
           $.ajax({
              type:"get",
              url: "<%= basePath%>propertyssm/getHousefee.do",
              data: {"room":room},
              success:function(result) {
                   alert("success");
              },
              error: function(result) {
                   alert("fail");
              }
           });
       }
      </script>
</html>