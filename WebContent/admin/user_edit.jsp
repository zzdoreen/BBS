<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>编辑用户</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="outer">
	<div class="inner">
	<form class="form-horizontal" action="userUpdate.action" method="post">
		<input type="hidden" name="user.id" value="${user.id}">
		<input type="hidden" name="user.username" value="${user.username}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" value="${user.username}" required="required" disabled="disabled">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" name="user.password" value="" placeholder="请输入新密码">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">昵称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" name="user.nickname" value="${user.nickname}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">积分</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="" name="user.score" value="${user.score}" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
	</div>
</div>	
</body>
</html>