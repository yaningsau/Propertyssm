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
<link href="bootstrap-3.3.5-dist/css/content_l.css" rel="stylesheet">
<link href="font-awesome-4.5.0/css/font-awesome.min.css">
<!-- <script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function(){
    $( 'li#dropdown_menu1' ).click( function(){
        $("#sub1").slideToggle("slow");
    });
    $( 'li#dropdown_menu2' ).click( function(){
        $("#sub2").slideToggle("slow");
    });
    
     
});
</script>
</head>
<body>
<div id="content_l" class="col-sm-2">
        
        <div id="menu">
            <ul>
                
                
                <li class="dropdown_menu" id="dropdown_menu1">
                    <a class="col-sm-offset-3"><span>报修管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub1">
                        <dd><a href="listRepair.do" class="col-sm-offset-3"><span>查询报修</span></a></dd>
                        <dd><a href="addRepair.jsp" class="col-sm-offset-3"><span>报修</span></a></dd>
                    </dl>
                <div>
                
                
                 <li class="dropdown_menu" id="dropdown_menu2">
                    <a class="col-sm-offset-3"><span>投诉管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub2">
                        <dd><a href="listComplain.do" class="col-sm-offset-3"><span>查询投诉</span></a></dd>
                        <dd><a href="addComplain.jsp" class="col-sm-offset-3"><span>投诉</span></a></dd>
                    </dl>
                <div>
                
                 
                
            </ul>
        </div>
    </div>
</body>
</html>
