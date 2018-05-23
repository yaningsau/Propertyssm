<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>物业管理系统</title>
    
   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/font-awesome.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="family_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
    <div class="divide-50"> 
            <ul id="r_nav">
                <li>></li>
                <li><a>家属列表</a></li>
            </ul>
            
        </div>
        <div class="r_content">
            <table class="table table-bordered table-hover f" align="center" style="color:silver">
                <thead>
                    <tr class="active">
                        <th>#</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>身份证号</th>
                        <th>用户名</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                
                 <%--  <%
                    List<User> userlist = (List<User>)request.getAttribute("userlist");
                    
                    %> --%>
                   
                    <c:forEach items="${usertlist}" var="user" varStatus="st">
                        <tr>
                            <td>${st.index+1}</td>
                            <td>${user.getUser_name()}</td>
                            <td>${dept.getDept_name()}</td>
                            <td>${dept.getDept_type()}</td>
                            <td>${dept.getDept_tel()}</td>
                            <td>${dept.getDept_super()}</td>
                            <td>${dept.getDept_desc()}</td>
                            <td>${dept.getDept_setdate()}</td>
                            
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    
    </body>
</html>
