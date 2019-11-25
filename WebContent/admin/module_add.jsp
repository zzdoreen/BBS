<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>添加版块</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8" />
</head>
<body>
	<%@include file="header.jsp"%>
<div class="outer">
<div class='inner'>
	<form class="form-horizontal" action="moduleSave.action" method="post">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label" >名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="module.name" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">添加</button>
			</div>
		</div>
	</form>
	</div>
</div>	
</body>
</html>