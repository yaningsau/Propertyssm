<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>人事管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/font-awesome.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_l.css" rel="stylesheet">
<link href="font-awesome-4.5.0/css/font-awesome.min.css">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

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
	                    <dd><a href="listUser.jsp" class="col-sm-offset-3"><span>查询用户</span></a></dd>
	                    <dd><a href="user_add.jsp" class="col-sm-offset-3"><span>添加用户</span></a></dd>
	            	</dl>
	            <div>
	            <li class="dropdown_menu" id="dropdown_menu2">
	            	<a class="col-sm-offset-3"><span>房产管理 <b class="caret"></b></span></a>   
	            </li>      	
	            <div>
	                <dl class="sub" id="sub2">
	                    <dd><a href="room_search.jsp" class="col-sm-offset-3"><span>查询房产</span></a></dd>
	                    <dd><a href="room_add.jsp" class="col-sm-offset-3"><span>添加房产</span></a></dd>
	            	</dl>
	            <div>
                
                <li class="dropdown_menu" id="dropdown_menu3">
                    <a class="col-sm-offset-3"><span>物业费管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub3">
                        <dd><a href="fee_search.jsp" class="col-sm-offset-3"><span>查询物业费</span></a></dd>
                        <dd><a href="fee_add.jsp" class="col-sm-offset-3"><span>添加物业费</span></a></dd>
                    </dl>
                <div>
	            
	            <li class="dropdown_menu" id="dropdown_menu4">
                    <a class="col-sm-offset-3"><span>安防管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub4">
                        <dd><a href="protect_search.jsp" class="col-sm-offset-3"><span>查询安防</span></a></dd>
                        <dd><a href="protect_add.jsp" class="col-sm-offset-3"><span>添加安防</span></a></dd>
                    </dl>
                <div>
                
                 <li class="dropdown_menu" id="dropdown_menu5">
                    <a class="col-sm-offset-3"><span>采购管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub5">
                        <dd><a href="purchase_search.jsp" class="col-sm-offset-3"><span>查询采购</span></a></dd>
                        <dd><a href="purchase_add.jsp" class="col-sm-offset-3"><span>添加采购</span></a></dd>
                    </dl>
                <div>
                
                 <li class="dropdown_menu" id="dropdown_menu6">
                    <a class="col-sm-offset-3"><span>停车场管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub6">
                        <dd><a href="park_search.jsp" class="col-sm-offset-3"><span>查询停车位</span></a></dd>
                        <dd><a href="park_add.jsp" class="col-sm-offset-3"><span>添加停车位</span></a></dd>
                        <dd><a href="usepark.jsp" class="col-sm-offset-3"><span>车位使用登记</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu7">
                    <a class="col-sm-offset-3"><span>门禁 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub7">
                        <dd><a href="/admin/guard_search.jsp" class="col-sm-offset-3"><span>外来人员查询</span></a></dd>
                        <dd><a href="/admin/guard_add.jsp" class="col-sm-offset-3"><span>外来人员记录</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu8">
                    <a class="col-sm-offset-3"><span>报修管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub8">
                        <dd><a href="/admin/repair_search.jsp" class="col-sm-offset-3"><span>报修查询</span></a></dd>
                        <dd><a href="/admin/repair_add.jsp" class="col-sm-offset-3"><span>报修</span></a></dd>
                    </dl>
                <div>
                
                <li class="dropdown_menu" id="dropdown_menu9">
                    <a class="col-sm-offset-3"><span>投诉管理 <b class="caret"></b></span></a>   
                </li>       
                <div>
                    <dl class="sub" id="sub9">
                        <dd><a href="/admin/complain_search.jsp" class="col-sm-offset-3"><span>投诉查询</span></a></dd>
                        <dd><a href="/admin/complain_add.jsp" class="col-sm-offset-3"><span>投诉</span></a></dd>
                    </dl>
                <div>
                
                
                
	        </ul>
		</div>
	</div>
</body>
</html>