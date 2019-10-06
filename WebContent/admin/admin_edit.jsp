<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>管理员编辑</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<%@include file="header.jsp"%>
<div class="outer">
<div class='inner'>
	<form class="form-horizontal" action="adminUpdate.action" method="post">
		<input type="hidden" name="admin.id" value="${sessionScope.admin.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="admin.username" value="${sessionScope.admin.username}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_pass" class="col-sm-2 control-label">原密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_pass" name="admin.password" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_pass_new" class="col-sm-2 control-label">新密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_pass" name="admin.passwordNew" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
	<p style="color:red;">${msg}</p>
	</div>
</div>	
</body>
</html>