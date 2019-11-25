<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>添加用户</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<style>
.add-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 1px solid #ccc;
            position: relative;
            margin-left: 35%;
            margin-bottom: 20px;
            box-shadow: 0 2px 2px 2px #ddd;
        }
        .cover::after{
            content: ' ';
            display: inline-block;
            width: 150px;
            height: 150px;
            transform: translateX(-100%);
            position: absolute;
            background: rgba(0,0,0,0.5);
            border-radius: 50%;
            border: 1px solid #ccc;
        }
</style>
<body>
	<%@include file="header.jsp"%>
	<div class="outer">
	<div class="inner">
	<form class="form-horizontal" action="userSave.action" method="post">
		<div class="cover">
        <img src='https://pic3.zhimg.com/80/v2-465e3d5c27309808554edc5230bc53bb_hd.jpg' class='add-avatar' />
    </div>
		<input type='text' value='https://pic3.zhimg.com/80/v2-465e3d5c27309808554edc5230bc53bb_hd.jpg' name="user.avatar"  required="required" style='display:none'/>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="user.username" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="user.password" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">昵称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="user.nickname" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">积分</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="user.score" value="0" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">添加</button>
			</div>
		</div>
	</form>
	
	<c:if test="${msg!=null}"><div class="alert alert-danger">${msg}</div></c:if>
	</div>
</div>	
</body>
</html>