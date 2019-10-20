<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>用户注册</title>
	<link href="css/style_1_common.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_index.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_forumdisplay.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/reset.css">
	<style>
		.container {
			width: 60%;
			height: 600px;
			box-shadow: gray 0 0 10px;
			padding: 0;
			display: flex;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			margin: auto;
			margin-top: 3%;
			border-radius: 15px;
			animation: boxin cubic-bezier(0.25, 0.46, 0.45, 0.94) 1s
		}

		.left {
			border-top-left-radius: 15px;
			border-bottom-left-radius: 15px;
			flex: 0.9;
			background: rgba(0, 0, 0, .9);
			height: 100%;
			padding: 0 25px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			text-align: center;
		}

		.left h1 {
			color: aliceblue;
			font-size: 30px;
			margin-bottom: 10px;
		}

		.left input {
			margin: 15px 0;
			border-radius: 5px;
			height: 40px;
			line-height: 40px;
			padding-left: 10px;
			border: none;
		}

		.left button {
			margin: 5px 0;
		}

		.left button:last-child {
			margin-bottom: 50px;
		}

		.right {
			flex: 1.1;
			overflow: hidden;
			background: url('img/register.jpg') no-repeat top;
			background-size: cover;
		}

		body {
			height: 100%;
		}

		.filter-box {
			background: url('img/register.jpg') no-repeat top;
			background-size: cover;
			width: 100%;
			height: 100%;
			z-index: -1;
			filter: blur(15px)
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
	</style>
</head>

<body>
	<div class="filter-box"></div>
	<div class="container">
		<form action="register.action" method="POST" class="left input-group">
			<h1>Welcome!</h1>
			<input type="text" placeholder="Username" name="user.avatar" required value="http://img0.imgtn.bdimg.com/it/u=401447366,3975072878&fm=26&gp=0.jpg" style='display:none'>
			<input type="text" placeholder="Username" name="user.username" required>
			<input type="password" placeholder="password" name="user.password" required>
			<input type="password" placeholder="check password" name="user.passwordNew" required>
			<input type="text" placeholder="name" name="user.nickname" required="required">
			<button type="submit" class="btn btn-primary">注册</button>
			<button type="reset" class="btn btn-danger">重置</button>
		</form>
		<div class="right"></div>
	</div>
</body>

</html>