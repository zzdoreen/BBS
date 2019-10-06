<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>提示信息</title>
	<meta charset="utf-8" />
	<link href="css/style_1_common.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_index.css" rel="stylesheet" type="text/css">
	<link href="css/style_1_forum_forumdisplay.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style>
		.box {
			width: 50%;
			margin-left: 50%;
			transform: translateX(-50%);
			display: flex;
			flex-direction: column;
			background: #7394ba;
			box-shadow: 0 5px 5px #ccc;
			border-radius: 15px;
			padding: 20px;
			animation: in .7s ;
		}
		@keyframes in{
			0%{
				transform: scale(1) translateX(-50%)
			}
			50%{
				transform: scale(1.2) translateX(-50%);
			}
			100%{
				transform: scale(1) translateX(-50%);
			}
		}
		.box span,p {
			z-index:10000;
			margin: auto;
			color: white;
		}
		.box span {
			font-size: 60px;
			margin-bottom: 10px;
			color: white;
		}
		.box a{
			display: inline-block;
			color: white;
			margin-bottom: 20px;
		}
		
	</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div id="ct" class="wp cl w">
		<div class="nfl">
			<div class="box">
				<span class="glyphicon glyphicon-ok"></span>
				<p>${msg}</p>
				<p class="alert_btnleft">
					<a href="${reurl}">如果您的浏览器没有自动跳转，请点击此链接</a>
					<script type="text/javascript">setTimeout( "window.location.href ='${reurl}';", 1000);</script>
				</p>
			</div>
		</div>
	</div>



</body>

</html>