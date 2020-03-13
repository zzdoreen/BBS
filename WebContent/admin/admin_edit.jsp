<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>管理员编辑</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8" />
<style type="text/css">
	.adminForm{
		margin-top:100px;
		text-algin:center
	}
</style>

</head>
<body>
	<%@include file="header.jsp"%>
<div class="outer">
	<div class='inner'>
		<form class="form-horizontal adminForm" action="adminUpdate.action" method="post">
			<input type="hidden" name="admin.id" value="${sessionScope.admin.id}">
			<div class="form-group">
				<label for="input_name" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="input_name" placeholder="请输入管理员名称"  name="admin.username" value="${sessionScope.admin.username}" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_pass" class="col-sm-2 control-label">原密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="admin.password"  placeholder="请输入原密码" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_pass_new" class="col-sm-2 control-label">新密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="admin.passwordNew" placeholder="请输入新密码" required="required">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1" >
					<button type="submit" onClick='if(confirm("确定要修改吗？")==false)return false' class="am-btn am-btn-primary am-btn-block">提交</button>
					<button type="reset" class="am-btn am-btn-default am-btn-block">取消</button>
				</div>
			</div>
			<p style="color:red;margin-left:50%;transform:translateX(-5%)">${msg}</p>
		</form>
	</div>
</div>	
</body>
</html>