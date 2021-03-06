<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script> 
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>用户管理</a></li>
                <li>></li>
                <li><a>添加用户</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form  action="addUser.do" id="addUserForm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" placeholder="只需住户填写" name="room"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户姓名</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户性别</label>
                    <div class="col-sm-3">
                                                          女<input type="radio" name="sex" value="女"/>
                                                          男<input type="radio" name="sex" value="男"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-3" >
                        <input type="text"class="form-control" name="idcard" id="idcard" onBlur="chkIdCard()"/>
                        <div id="tipCard"></div>
                    </div>
                    
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户类别</label>
                    <div class="col-sm-3">
                    <select name="kind" id="kind" class="form-control">
                    <option value=""></option>
                    <option value="业主">业主</option>
                    <option value="家属">家属</option>
                    <option value="保安">保安</option>
                    <option value="其他">其他</option>                               
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">教师编号</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" placeholder="只需业主填写" name="num"/></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">在职状态</label>
                    <div class="col-sm-3">
                    <select name="status" id="status" class="form-control">
                    <option value="" selected = "selected">只需业主填写</option>
                    <option value="退休">退休</option>
                    <option value="在职">在职</option>                              
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" name="ps"/></textarea>
                    </div>
                </div>
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="botton" id="submit" class="btn btn-default" value="提交">提交</button>
                        <button type="reset" class="btn btn-default" value="重置">重置</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
	<script type="text/javascript">
	
	//验证身份证号码
    function chkIdCard(){
    document.getElementById("tipCard").innerHTML = "";
    var idcard = document.getElementById("idcard").value;
    var reg = /^\d{18}|\d{17}[xX]$/;
    
    if(idcard.match(reg)!=idcard){
       document.getElementById("tipCard").innerHTML = "<font color='red' size='-1'>输入的身份证号码格式不正确</font>";
    }   
   }
   
	  $("#submit").click(function(){
       $("#addUserForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("添加成功");
                    window.location.href = 'listUser.do';
                } else if (response.tip == "error") {
                    alert("用户已存在，添加失败!");
                    window.location.href = 'addUser.jsp';
                } 
       });
     
    }); 
	</script>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.5-dist/css/content_r.css" rel="stylesheet">
<script src="bootstrap-3.3.5-dist/js/jquery-3.0.0.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/jquery.form.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="admin_l.jsp"></jsp:include>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>用户管理</a></li>
                <li>></li>
                <li><a>添加用户</a></li>
            </ul>
        </div>
        <div class="r_content" style="color:#545454">
            <form  action="addUser.do" id="addUserForm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">房号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" placeholder="只需住户填写" name="room"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户姓名</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户性别</label>
                    <div class="col-sm-3">
                                                          女<input type="radio" name="sex" value="女"/>
                                                          男<input type="radio" name="sex" value="男"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="idcard" id="idcard" onBlur="chkIdCard()"/>
                        <div id="tipCard"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">用户类别</label>
                    <div class="col-sm-3">
                    <select name="kind" id="kind" class="form-control">
                    <option value=""></option>
                    <option value="业主">业主</option>
                    <option value="保安">保安</option>
                    <option value="其他">其他</option>                               
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">教师编号</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" placeholder="只需业主填写" name="num"/></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">在职状态</label>
                    <div class="col-sm-3">
                    <select name="status" id="status" class="form-control">
                    <option value="" selected = "selected">只需业主填写</option>
                    <option value="退休">退休</option>
                    <option value="在职">在职</option>                              
                    </select>                                                         
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" name="ps"/></textarea>
                    </div>
                </div>
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
                        <button type="reset" class="btn btn-default" value="重置">重置</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    //验证身份证号码
    function chkIdCard(){
    document.getElementById("tipCard").innerHTML = "";
    var idcard = document.getElementById("idcard").value;
    var reg = /^\d{18}|\d{17}[xX]$/;
    
    if(idcard.match(reg)!=idcard){
       document.getElementById("tipCard").innerHTML = "<font color='red' size='-1'>输入的身份证号码格式不正确</font>";
    }   
   }
    
    $("#submit").click(function(){
       $("#addUserForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("用户添加成功");
                    window.location.href = 'listUser.do';
                } else if (response.tip == "error") {
                    alert("用户添加失败!");
                } 
       });
     
    }); 
    </script>
</body>
</html>