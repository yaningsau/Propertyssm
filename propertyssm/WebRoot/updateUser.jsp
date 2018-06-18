<%@page import="com.sau.ums.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<li>></li>
				<li><a>用户管理</a></li>
				<li>></li>
				<li><a>修改用户信息</a></li>
			</ul>
		</div>
		<div class="r_content" style="color:#545454">
			<form id="updateForm" action="updateUser.do" method="post" class="form-horizontal"
				role="form">
				<div class="form-group">
				    <div>
				        <input type="hidden" class="form-control" name="id"
                            value=${user.id }>
				    </div>
					<label class="col-sm-offset-3 col-sm-2 control-label">用户姓名</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="name"
							value=${user.name }>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-offset-3 col-sm-2 control-label">用户性别</label>
					<div class="col-sm-3">
					
					<input type="radio" name="sex" value="男" <c:if test="${user.sex== '男'}">checked="checked"</c:if>/>男
                    <input type="radio" name="sex" value="女" <c:if test="${user.sex== '女'}">checked="checked"</c:if>/>女
					   <%-- <C:if test="${user.sex eq '女'}">
						          女<input type="radio" name="sex" value="女" checked="checked" /> 
					   </C:if>
					   <C:if test="${user.sex eq '男' }">
						      男<input type="radio" name="sex" value="男"  />
					   </C:if> --%>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="idcard" value=${user.idcard } />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-offset-3 col-sm-2 control-label">用户类别</label>
					<div class="col-sm-3">
						<select name="kind" id="kind" class="form-control">
						    <option value="业主" <c:if test="${user.kind eq '业主'}">selected</c:if> >业主</option>
						    <option value="家属" <c:if test="${user.kind eq'家属'}">selected</c:if> >家属</option>
						    <option value="保安" <c:if test="${user.kind eq '保安'}">selected</c:if> >保安</option>
						    <option value="其他" <c:if test="${user.kind eq '其他'}">selected</c:if> >其他</option>
						  <%-- <C:if test="${user.kind eq '业主' }">
								<option value="业主">业主</option>
							</C:if>
							<C:if test="${user.kind eq '家属' }">
								<option value="家属">家属</option>
							</C:if>
							<C:if test="${user.kind eq '保安' }">
								<option value="保安">保安</option>
							</C:if>
							<C:if test="${user.kind eq '其他' }">
								<option value="其他">其他</option>
							</C:if> --%>
							<!-- <option value=""></option>
							<option value="业主">业主</option>
							<option value="家属">家属</option>
							<option value="保安">保安</option>
							<option value="其他">其他</option> -->
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-offset-3 col-sm-2 control-label">教师编号</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="num" value=${user.num }>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
					<div class="col-sm-3">
						<textarea class="form-control" name="ps" value=${user.ps }>${user.ps }</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-4">
						<button type="button" id="submit" class="btn btn-default" value="提交">提交</button>
						
					</div>
				</div>
			</form>

		</div>

	</div>

	<script type="text/javascript">
	   function getUserInfoById(id) {
	       $.ajax({
	          type:"get",
	          url: "<%= basePath%>propertyssm/getUserInfoById.do",
	          data: {"id":id},
	          success:function(result) {
	               alert("success");
	          },
	          error: function(result) {
	               alert("fail");
	          }
	       });
	   }
	   
	   $("#submit").click(function(){
       $("#updateForm").ajaxSubmit(function(response){
            if (response.tip == "success") {
                    alert("修改成功");
                    window.location.href = 'listUser.do';
                } else if (response.tip == "error") {
                    alert("修改失败!");
                } 
       });
     
    }); 
   </script>

</body>
</html>