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
<style>
    .divide-60{ 
        height:60px;
    }
</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>报修管理</a></li>
                <li>></li>
                <li><a>查询报修</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form action="/hr/emp_search.do" method="post" role="form" class="form-inline pull-right">
                                    报修人：
                <input type="text" class="form-control" placeholder="name" name="name"/>
                                   房号：   
                <input type="text" class="form-control" placeholder="name" name="name"/>
                <input type="button" class="form-control" id="target" value="搜索" onClick="document.forms[0].submit()">
            </form>
            <div class="divide-60"></div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover fff" style="color:silver">
                    <thead>
                        <tr class="active">
                            <th>#</th> 
                            <th>房号</th>
                            <th>报修人</th>
                            <th>位置</th>
                            <th>报修设备</th>
                            <th>报修人电话</th>
                            <th>修理状态</th>
                            <th>备注</th>
                            <th colspan="2">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%--  <%
                        List<Emp> emplist = (List<Emp>)request.getAttribute("emplist");
                        %> --%>
                        <c:if test="${empty emplist}">
                            <tr><td colspan="10">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:if test="${not empty emplist}">
                            <c:forEach items="${emplist}" var="emp" varStatus="st">
                                <tr>
                                    <td>${st.index+1}</td>
                                    <td>${emp.getEmp_no()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>${emp.getEmp_name()}</td>
                                    <td>
                                    <a href='/hr/gotomodify.do?id=${dept.getId()}'>修改</a>
                                    <a onClick='return confirmOpe();'href='/hr/dept_del.do?id=${dept.getId()}'>删除</a>
                                    </td>
                                 </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
