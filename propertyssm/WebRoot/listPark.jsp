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
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>停车场管理</a></li>
                <li>></li>
                <li><a>查询停车位</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form action="listPark.do" method="post" role="form" class="form-inline pull-right">
                <font color="#545454">车位号：</font>
                <input type="text" class="form-control" placeholder="carnum" name="carnum"/>
                <font color="#545454"> 车位所属房号：</font>
                <input type="text" class="form-control" placeholder="room" name="room"/>
                <font color="#545454"> 使用状态：</font>
                <input type="text" class="form-control" placeholder="status" name="status"/>
                <input type="button" class="form-control" id="target" value="搜索" onClick="document.forms[0].submit()">
            </form>
            <div class="divide-60"></div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover fff" style="color:#545454">
                    <thead>
                        <tr class="active">
                            <th>#</th>
                            <th>车位号</th>
                            <th>开始使用时间</th>
                            <th>结束时间</th>
                            <th>所属房号</th>
                            <th>使用状态</th>
                            <th>备注</th>
                            <th colspan="2">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:if test="${empty page.list}">
                            <tr><td colspan="10">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:if test="${not empty page.list}">
                            <c:forEach items="${page.list}" var="park" varStatus="st">
                                <tr>
                                    <td>${st.index+1}</td>
                                    <td>${park.carnum}</td>
                                    <td>${park.begintime}</td>
                                    <td>${park.endtime}</td>
                                    <td>${park.status}</td>
                                    <td>${park.room}</td>
                                    <td>${park.ps}</td>
                                    <td>
                                    <a href=>修改</a>
                                    <a onClick=>删除</a>
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
