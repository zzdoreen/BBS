<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src='js/jquery-3.3.1.min.js'></script>
</head> 
<style>
        .bg {
            background-image: url('img/t.jpg')!important; 
            background-position: 0% 30% !important;         
        }

        .container.box {
            margin-top: 70px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .container .user-avatar {
            margin-top: -180px;
            width: 100%;
        }

        .user-avatar img {
            border-radius: 50%;
            border: 5px solid #ccc;
            width: 150px;
            height: 150px;
            margin-left: 50%;
            transform: translateX(-75px);
        }

        .nav {
            width: 100%;
            display: flex;
            height: 50px;
            line-height: 50px;
            border: 1px solid rgb(86, 152, 159);
            background: rgb(86, 152, 159);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .nav .item {
            flex-grow: 1;
            text-align: center;
            text-decoration: none;
            color: white;
            letter-spacing: 15px;
        }

        .nav .item:hover {
            border-bottom: 3px solid rgb(35, 118, 183);
            padding: 2px;
        }

        .info,
        .setting {
            width: 100%;
            background: rgb(240, 240, 240);
            padding: 20px;
            color: rgb(35, 118, 183);
            display: flex;
            justify-content: space-around;

        }

        /* 内容部分的样式 */
        .info .users {
            width:30%;
            margin-right: 10px;
            text-align: center;
            margin-top: 20px;
        }

        .info .post {
            width:70%
        }

        .info .title {
            font-weight: 700;
            font-size: 15px;
        }

        .info .title::after {
            content: '';
            display: block;
            margin-top: 10px;
            border-bottom: 2px dashed rgb(35, 118, 183);
        }

        .users .avatar {
            width: 100px;
            height: 100px;
            border: 3px solid rgb(35, 118, 183);
            box-shadow: 0 0 2px #333;
        }

        .users .user-info {
            text-align: left;
            margin-top: 20px;
            margin-left:20%;
            display: flex;
            flex-direction: column;
        }

        .user-info li {
            padding: 5px;
            list-style: none;
        }
        .user-info li span{
        	margin-right:20px;
        }
        .post-item {
            margin: 10px;
            background: rgb(86, 152, 159);
            position: relative;
            border-radius: 10px;
            padding: 5px;
            color: #f5f5f5;
            padding:10px;
        }

        .post-item::before {
            content: '';
            display: block;
            border: 10px solid transparent;
            border-right-color: rgb(86, 152, 159);
            position: absolute;
            left: -20px;
            top: 10px;
        }

        /* 设置部分的样式 */

        .setting .reset-avatar {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-content: center;
            text-align: center;
            padding: 20px;
            margin-left: 10%;
        }

        .setting .reset-info {
            flex-grow: 2;
            padding: 20px;
            margin-left: -10%;
        }

        .setting .reset-info .btn {
            margin-top: 10px;
            margin-right: 20px;
        }

        .setting .reset-info label {
            margin-top: 10px;
        }

        .file {
            position: relative;
            display: inline-block;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
            width: 150px;
            margin-top: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .reset-avatar img {
            width: 150px;
            height: 150px;
            overflow: hidden;
            border: 2px solid #004974;
            box-shadow: 0 0 3px #333;
            margin-top: -50px;
        }
        .information {
        	display:block;
        	color:#f5f5f5
        }
    </style>
<body>
	<jsp:include page="header.jsp" />
	<div class="container box"> 
        <div class="user-avatar">
            <img src='${user.avatar}' alt="">
        </div>
        <nav class="nav">
            <a href="user.action?id=${user.id}" class="item"><i class="glyphicon glyphicon-home"></i>主页</a>
            <a href="edit.action?user.id=${user.id}" class="item"><i class="glyphicon glyphicon-cog"></i> 设置</a>
        </nav>
        <section class="info">
            <div class="users">
                <img src='${user.avatar}' class="avatar" />
                <ul class="user-info">
                    <li><span class="label label-primary">用户ID</span>&nbsp;${sessionScope.user.id}</li>
                    <li><span class="label label-primary">用户名</span>&nbsp;${sessionScope.user.username} </li>
                    <li><span
                            class="label label-primary">昵&nbsp;&nbsp;&nbsp;&nbsp;称</span>&nbsp;${sessionScope.user.nickname}
                    </li>
                    <li><span class="label label-warning">经验值</span>&nbsp;${sessionScope.user.score}</li>
                </ul>
            </div>
            <div class="post">
                <h5 class="title">帖子</h5>
                <div class="content">
                	<c:forEach var="post" items="${postList}">
                	<c:if test="${post.user.id == sessionScope.user.id}">
                		<div class="post-item">
                			<c:if test="${post.topic.module.id == 1}">
                				<i class="glyphicon glyphicon-play-circle"></i>&nbsp;&nbsp;动画
                			</c:if>
                			<c:if test="${post.topic.module.id == 2}">
                				<i class="glyphicon glyphicon-duplicate"></i>&nbsp;&nbsp;漫画
                			</c:if>
                			<c:if test="${post.topic.module.id == 3}">
                				<i class="glyphicon glyphicon-knight"></i>&nbsp;&nbsp;游戏
                			</c:if>
                			<c:if test="${post.topic.module.id == 4}">
                				<i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;小说
                			</c:if>
                			<a href="post.action?post.id=${post.id}" class="information">【${post.topic.name}】${post.title}</a>
                		</div>
                	</c:if>
                	</c:forEach>
                    
                </div>
            </div>
		</section>
    </div>
</body>
</html>