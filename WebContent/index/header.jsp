<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>header</title>
</head>
<style>
.head {
	z-index: 200;
	height: 42px;
	color: #222;
	background: hsla(0, 0%, 100%, .4);
	box-shadow: 0 1px 5px rgba(0, 0, 0, .3);
	line-height: 42px;
}

nav.container {
	margin: 0 auto;
}

ul {
	display: flex;
	justify-content: space-between
}

ul>li:hover, a:hover {
	color: white;
	margin-top: 1px;
	cursor: pointer;
	text-decoration: none;
}

.bg {
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	width: 100%;
	height: 200px;
	background-image: url('img/bg.png');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .9);
}

.icon {
	width: 40px;
	height: 25px;
	margin-right: 15px;
	vertical-align: center
}

.head-avatar {
	line-height: 42px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
}
a {
	color: #222
}
</style>

<body>
	<div class="bg "></div>
	<header class="head navbar">
		<nav class="row container">
			<div class="col-sm-8">
				<ul>
					<li><a href="index.action"><img class="icon"
							src="img/icon1.png" alt="">首页</a></li>
					<c:forEach var="module" items="${moduleList}">
						<li><a href="module.action?module.id=${module.id}">${module.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-sm-4">
				<div class="row">

					<c:if test="${sessionScope.user==null}">
						<div class=" col-sm-8"></div>
						<div class="col-sm-4">
							<ul>
								<li><a href="login.jsp">登陆</a></li>
								<li><a href="register.jsp">注册</a></li>
							</ul>
						</div>
					</c:if>

					<c:if test="${sessionScope.user!=null}">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<ul>
								<li>${sessionScope.user.nickname} <img class="head-avatar"
									src="img/avatar.jpg" alt="avatar"
									title="积分：${sessionScope.user.score}">
								</li>
								<li><a href="logout.action">退出</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>