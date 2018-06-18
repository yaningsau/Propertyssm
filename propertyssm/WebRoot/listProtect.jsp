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
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/bootstrap.min.css"
    rel="stylesheet">
<link href="<%=basePath%>font-awesome-4.5.0/css/font-awesome.min.css"
    rel="stylesheet">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/content_r.css"
    rel="stylesheet">
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>CSS/js/jqPaginator.min.js"></script>
<script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery.form.js"></script>
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
                <li><a>安防管理</a></li>
                <li>></li>
                <li><a>查询安防</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form action="listProtect.do" method="post" role="form" class="form-inline pull-right" id="userform">
            <input type="hidden" name="pageNum" id="pageNum_1" value="" />
              <font color="#545454">设备名称：</font>
                <input type="text" class="form-control" placeholder="facility" name="facility"/>
                <input type="submit" class="form-control" id="target" value="搜索" onClick="fnSearch()">
            </form>
            <div class="divide-60"></div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover fff" style="color:#545454">
                    <thead>
                        <tr class="active">
                            <th>#</th> 
                            <th>楼号</th>
                            <th>设备名称</th>
                            <th>备注</th>
                            <th colspan="2">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:if test="${empty page.list}">
                            <tr><td colspan="10">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:if test="${not empty page.list}">
                            <c:forEach items="${page.list}" var="protect" varStatus="st">
                                <tr>
                                    <td>${st.index+1}</td>
                                    <td>${protect.position}</td>
                                    <td>${protect.facility}</td>
                                    <td>${protect.ps}</td>
                                    <td>
                                    <a href='getProtectInfoById.do?id=${protect.id}'>修改</a>
                                    <a onClick='return delProtect(this);' href='delProtect.do?position=${protect.position}'>删除</a>
                                    </td>
                                 </tr>
                            </c:forEach>
                        </c:if>
                        <p>
                            <!-- 保存分页信息 -->
                        <form id="condition">
                            <!-- 分页查询条件 -->
                            <input type="hidden" name="facility" id="facility"
                                value="${condition.facility}" /> 
                            <!-- 分页信息 -->
                            <input type="hidden" name="pageNum" id="pageNum"
                                value="${page.pageNum}" /> <input type="hidden" name="totalPages"
                                id="totalPages" value="${page.pages}" />
                        </form>
                        </p>
                    </tbody>
                </table>
                <div class="pull-right">
                    <ul id="page" class="pagination"></ul>
                    </div>
            </div>
        </div>
    </div>
    <script type='text/javascript' language='javascript'>
    $(function(){
    <!--设置权限查询条件-->
            $("#userform #kind").val($("#condition #kind").val());
            <!--初始化分页插件-->
            $("#page")
                    .jqPaginator(
                            {
                                totalPages : Number($("#totalPages").val()),
                                visiblePages : 4,
                                currentPage : Number($("#pageNum").val()),
                                prev : '<li class="prev"><a href="javascript:;">上一页</a></li>',
                                next : '<li class="next"><a href="javascript:;">下一页</a></li>',
                                page : '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                                first : '<li class="first"><a href="javascript:;">首页</a></li>',
                                last : '<li class="last"><a href="javascript:;">尾页</a></li>',
                                onPageChange : function(num, type) {
                                    if (type == "change") {
                                        $("#userform #pageNum_1").val(num);
                                        $("#userform").submit();
                                    }
                                }
                            });
    });
    function fnSearch(){
        $("#userform").attr("action","listPr.do");
        $("#pageNum_1").val($("#pageNum").val());
        $("#userform").submit();
        }
        function delProtect(obj){
        var msg = "是否删除该安防";
        if(confirm(msg) == true){
            var position =  $(obj).parent("td").attr("position");
            $.post("delProtect.do",{"position":position},function(response){
                if(response.tip=="success"){
                    alert("用户删除成功");
                    window.location.href='listProtect.do';
                }
                else if(response.tip=="error"){
                    alert("用户删除失败!"+response.msg);
                }
            });
            return true;
        }
        else{
          return false;
        }
    }
    </script>
</body>
</html>
