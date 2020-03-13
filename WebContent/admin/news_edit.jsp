<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>编辑公告</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="outer">
	<div class="inner">
	<form class="form-horizontal" action="newsUpdate.action" method="post">
		<input type="hidden" name="news.id" value="${news.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="news.title" value="${news.title}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">内容</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="news.content" value="${news.content}" required="required">
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