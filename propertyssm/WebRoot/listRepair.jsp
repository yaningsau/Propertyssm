<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <c:if test="${ loguser.kind == '管理员' }">
    <jsp:include page="admin_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '业主' }">
    <jsp:include page="owner_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '家属' }">
    <jsp:include page="family_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '保安' }">
    <jsp:include page="security_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '其他' }">
    <jsp:include page="other_l.jsp"></jsp:include>
    </c:if>
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
            <form action="listRepair.do" method="post" role="form" class="form-inline pull-right">
             <font color="#545454"> 报修人：</font>
                <input type="text" class="form-control" placeholder="name" name="name"/>
             <font color="#545454">  房号：</font>   
                <input type="text" class="form-control" placeholder="room" name="room"/>
                <font color="#545454"> 修理状态 ：</font>   
                <input type="text" class="form-control" placeholder="status" name="status"/>
                <input type="button" class="form-control" id="target" value="搜索" onClick="document.forms[0].submit()">
            </form>
            <div class="divide-60"></div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover fff" style="color:#545454">
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
                            <c:if test="${ loguser.kind == '管理员' }">
                            <th colspan="2">操作</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:if test="${empty page.list}">
                            <tr><td colspan="10">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:if test="${not empty page.list}">
                            <c:forEach items="${page.list}" var="repair" varStatus="st">
                                <tr>
                                    <td>${st.index+1}</td>
                                    <td>${repair.room}</td>
                                    <td>${repair.name}</td>
                                    <td>${repair.position}</td>
                                    <td>${repair.facility}</td>
                                    <td>${repair.tel}</td>
                                    <td>${repair.status}</td>
                                    <td>${repair.ps}</td>
                                   <c:if test="${ loguser.kind == '管理员' }">
                                    <td>
                                    <a href=>修改</a>
                                    <a onClick=>删除</a>
                                    </td>
                                    </c:if>
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
