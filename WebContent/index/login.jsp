<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>用户登录</title>
	<link href="css/style_1_common.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_index.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_forumdisplay.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/reset.css">
	<style>
		.container {
			width: 60%;
			height: 500px;
			box-shadow: gray 0 0 10px;
			padding: 0;
			display: flex;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			margin: auto;
			margin-top: 5%;
			border-radius: 15px;
			animation: boxin cubic-bezier(0.25, 0.46, 0.45, 0.94) 1s
		}
		@keyframes boxin{
			from{
				transform: translateY(-100%);
				opacity: 0;
			}
			to{
				opacity: 1;
				transform: translateY(0)
			}
		}
		.left {
			border-top-left-radius: 15px;
			border-bottom-left-radius: 15px;
			flex: 0.9;
			background:rgba(33, 33, 33, .9);
			height: 100%;
			padding: 0 25px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			text-align: center;
		}
		.left h1{
			color: aliceblue;
			font-size: 30px;
			margin-bottom: 30px;
		}
		.left input{
			margin: 15px 0;
			border-radius: 5px;
			height: 40px;
			line-height: 40px;
			padding-left: 10px;
			border: none;
		}
		.left button{
			margin: 5px 0;
		}
		.left button:last-child{
			margin-bottom: 50px;
		}
		.right {
			flex: 1.1;
			overflow: hidden;
			background: url('images/login_right.jpg') no-repeat center;
			background-size: cover;
		}

		body {
			height: 100%;
		}

		.filter-box {
			background: url('images/login_right.jpg') no-repeat center;
			background-size: cover;
			width: 100%;
			height: 100%;
			z-index: -1;
			filter: blur(15px)
		}
	</style>
</head>

<body>
	<div class="filter-box"></div>
	<div class="container">
		<form action="login.action" method="POST" class="left input-group">
			<h1>Welcome!</h1>
			<input type="text"  placeholder="Username" name="user.username">
			<input type="password"  placeholder="password" name="user.password">
			<button type="submit" class="btn btn-primary">提交</button>
			<a class="btn btn-primary" href="register.jsp">注册</a>
			<button type="reset" class="btn btn-danger">重置</button>
		</form>
		<div class="right"></div>
	</div>
</body>

</html>