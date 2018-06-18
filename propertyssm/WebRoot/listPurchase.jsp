<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                <li><a>采购管理</a></li>
                <li>></li>
                <li><a>查询采购</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form action="listPurchase.do" method="post" role="form" class="form-inline pull-right" id="userform">
              <input type="hidden" name="pageNum" id="pageNum_1" value="" />
              <font color="#545454"> 商品名称：</font>
                <input type="text" class="form-control" placeholder="sname" name="sname"/>
                <input type="button" class="form-control" id="target" value="搜索" onClick="fnSearch()">
            </form>
            <div class="divide-60"></div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover fff" style="color:#545454">
                    <thead>
                        <tr class="active">
                            <th>#</th>
                            <th>商品名称</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>总价</th>
                            <th>用途</th>
                            <th>采购时间</th>
                            <th>备注</th>
                            <th colspan="2">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:if test="${empty page.list}">
                            <tr><td colspan="10">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:if test="${not empty page.list}">
                            <c:forEach items="${page.list}" var="purchase" varStatus="st">
                                <tr>
                                    <td>${st.index+1}</td>
                                    <td>${purchase.sname}</td>
                                    <td>${purchase.price}</td>
                                    <td>${purchase.number}</td>
                                    <td>${purchase.total}</td>
                                    <td>${purchase.uses}</td>
                                    <td><fmt:formatDate value="${purchase.time}" pattern="yyyy-MM-dd" /></td>
                                    <td>${purchase.ps}</td>
                                    <td>
                                    <a href='getPurchaseInfoById.do?id=${purchase.id}'>修改</a>
                                    <a onClick='return delPurchase(this);' href='delPurchase.do?id=${purchase.id}'>删除</a>
                                    </td>
                                 </tr>
                            </c:forEach>
                        </c:if>
                        <p>
                            <!-- 保存分页信息 -->
                        <form id="condition">
                            <!-- 分页查询条件 -->
                            <input type="hidden" name="sname" id="sname"
                                value="${condition.sname}" /> 
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
    function fnSearch(){
        $("#userform").attr("action","listP.do");
        $("#pageNum_1").val($("#pageNum").val());
        $("#userform").submit();
        }
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
        function delPurchase(obj){
        var msg = "是否删除该采购";
        if(confirm(msg) == true){
            var purchase =  $(obj).parent("td").attr("purchase");
            $.post("delPurchase.do",{"purchase":purchase},function(response){
                if(response.tip=="success"){
                    alert("采购删除成功");
                    window.location.href='listPurchase.do';
                }
                else if(response.tip=="error"){
                    alert("采购删除失败!"+response.msg);
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
