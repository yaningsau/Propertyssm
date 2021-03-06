<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>人事管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap-3.3.5-dist/css/content_l.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome-4.5.0/css/font-awesome.min.css">
<!-- <script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script> -->
<!-- <script src="<%=basePath%>bootstrap-3.3.5-dist/js/jquery.form.js"></script> -->
<!-- <script src="<%=basePath%>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function(){
	$( 'li#dropdown_menu1' ).click( function(){
		$("#sub1").slideToggle("slow");
	});
	$( 'li#dropdown_menu2' ).click( function(){
		$("#sub2").slideToggle("slow");
	});
	$( 'li#dropdown_menu3' ).click( function(){
        $("#sub3").slideToggle("slow");
    });
	$( 'li#dropdown_menu4' ).click( function(){
        $("#sub4").slideToggle("slow");
    });
    $( 'li#dropdown_menu5' ).click( function(){
        $("#sub5").slideToggle("slow");
    });
     $( 'li#dropdown_menu6' ).click( function(){
        $("#sub6").slideToggle("slow");
    });
     $( 'li#dropdown_menu7' ).click( function(){
        $("#sub7").slideToggle("slow");
    });
    $( 'li#dropdown_menu8' ).click( function(){
        $("#sub8").slideToggle("slow");
    });
    $( 'li#dropdown_menu9' ).click( function(){
        $("#sub9").slideToggle("slow");
    });
    
});
</script>
</head>
<body>

<div id="content_l" class="col-sm-2">
		
		<div id="menu">
			<ul>
				<li class="dropdown_menu" id="dropdown_menu1">
	            	<a class="col-sm-offset-3"><span>用户管理 <b class="caret"></b></span></a>   
	            </li>      	
	            <div>
	                <dl class="sub" id="sub1">
	                    <dd><a href="listUser.do" class="col-sm-offset-3" ><span>查询用户</span></a></dd>
	                    <dd><a href="addUser.jsp" class="col-sm-offset-3" id="addUser"><span>添加用户</span></a></dd>
	            	</dl>
	            <div>
	            <li class="dropdown_menu" id="dropdown_menu2">
	            	<a class="col-sm-offset-3"><span>房产管理 <b class="caret"></b></span></a>   
	            </li>      	
	            <div>
	                <dl class="sub" id="sub2">
	                    <dd><a href="listRoom.do" class="col-sm-offset-3"><span>查询房产</span></a></dd>
	                    <dd><a href="addRoom.jsp" class="col-sm-offset-3"><span>添加房产</span></a></dd>
	            	</dl>
	            <div>
                
                <li class="dropdown_menu" id="dropdown_menu3">
                    <a class="col-sm-offset-3"><span>物业费管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub3">
                        <dd><a href="listPropertyfee.do" class="col-sm-offset-3"><span>查询物业费</span></a></dd>
                        
                    </dl>
                <div>
	            
	            <li class="dropdown_menu" id="dropdown_menu4">
                    <a class="col-sm-offset-3"><span>安防管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub4">
                        <dd><a href="listProtect.do" class="col-sm-offset-3"><span>查询安防</span></a></dd>
                        <dd><a href="addProtect.jsp" class="col-sm-offset-3"><span>添加安防</span></a></dd>
                    </dl>
                <div>
                
                 <li class="dropdown_menu" id="dropdown_menu5">
                    <a class="col-sm-offset-3"><span>采购管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub5">
                        <dd><a href="listPurchase.do" class="col-sm-offset-3"><span>查询采购</span></a></dd>
                        <dd><a href="addPurchase.jsp" class="col-sm-offset-3"><span>添加采购</span></a></dd>
                    </dl>
                <div>
                
                 <li class="dropdown_menu" id="dropdown_menu6">
                    <a class="col-sm-offset-3"><span>停车场管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub6">
                        <dd><a href="listPark.do" class="col-sm-offset-3"><span>查询停车位</span></a></dd>
                        <dd><a href="addPark.jsp" class="col-sm-offset-3"><span>添加停车位</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu7">
                    <a class="col-sm-offset-3"><span>门禁 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub7">
                        <dd><a href="listGuard.do" class="col-sm-offset-3"><span>外来人员查询</span></a></dd>
                        <dd><a href="addGuard.jsp" class="col-sm-offset-3"><span>外来人员记录</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu8">
                    <a class="col-sm-offset-3"><span>报修管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub8">
                        <dd><a href="listRepair.do" class="col-sm-offset-3"><span>报修查询</span></a></dd>
                        <dd><a href="addRepair.jsp" class="col-sm-offset-3"><span>报修</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu9">
                    <a class="col-sm-offset-3"><span>投诉管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub9">
                        <dd><a href="listComplain.do" class="col-sm-offset-3"><span>投诉查询</span></a></dd>
                        <dd><a href="addComplain.jsp" class="col-sm-offset-3"><span>投诉</span></a></dd>
                    </dl>
                <div>
                
                
                
	        </ul>
		</div>
	</div>



</body>
</html>