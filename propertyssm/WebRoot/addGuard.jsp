<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <c:if test="${ loguser.kind == '管理员' }">
    <jsp:include page="admin_l.jsp"></jsp:include>
    </c:if>
    <c:if test="${ loguser.kind == '保安' }">
    <jsp:include page="security_l.jsp"></jsp:include>
    </c:if>
    <div id="content_r" class="col-sm-10" style="color:silver">
        <div class="divide-50"> 
            <ul id="r_nav">
                <li>> </li>
                <li><a>门禁</a></li>
                <li>></li>
                <li><a>外来人员记录</a></li>
            </ul>
        </div>
        <div class="r_content">
            <form action="addGuard.do" method="post" class="form-horizontal" role="from">
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">姓名</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="idcard"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">性别</label>
                    <div class="col-sm-3">
                                                          女<input type="radio" name="sex" value="女"/>
                                                          男<input type="radio" name="sex" value="男"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">电话</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="tel"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">车牌号</label>
                    <div class="col-sm-3">
                        <input type="text"class="form-control" name="lnum"/>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">进入时间</label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" name="time"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-3 col-sm-2 control-label">备注</label>
                    <div class="col-sm-3">
                        <textarea class="form-control" placeholder="为什么要进入小区" name="ps"/></textarea>
                    </div>
                </div>
                 <div class="form-group">
                     <div class="col-sm-offset-5 col-sm-4">
                        <button type="submit" class="btn btn-default">submit</button>
                        <button type="reset" class="btn btn-default">reset</button>
                     </div>
                 </div>
            </form>
        </div>
    </div>
</body>
</html>