<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>【${post.topic.name}】${post.title}</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="fonts/iconfont.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style>
		.login-box {
			width: 100%;
			height: 150px;
			border-radius: 4px;
			border: 1px solid #ccc;
			display: flex
		}

		.login-box .login {
			margin: auto;
		}
		.head-right{
			float: right;
		}
		.head-right span{
			margin-left: 10px;
			font-size:12px;
			color: white;
		}
		.avatar {
			width:20%;
			padding:auto 0;
			background:#98a2b9;
			text-align: center;
			color: white;
		}

		.avatar img {
			width:126px;
			height:126px;
			margin-top: 15px;
			margin-bottom: 10px;
			border-radius: 50%;
			border: 3px solid white;
			box-shadow: 0 3px 5px #333;
		}

		.author {
			border-bottom: 1px dashed #ccc;
			display:flex;
		}
		.container{
			padding:0;
		}
		.content {
			flex-grow:1;
			white-space: wrap;
			padding:10px 20px 50px 20px;
			position: relative;
		}

		.content .time {
			position: absolute;
			right: 20px;
			font-size: 12px;
			bottom: 10px;
		}
		.quick-post {
			display: flex;
			width: 50%;
			position: absolute;
			left: 20px;
			font-size: 12px;
			bottom: 10px;
		}

		.commit-title {
			font-size: 20px;
		}

		.user {
			margin-top: 50px;
		}

		.submit-btn {
			margin-top: 10px;
		}

		.panel .panel-heading {
			background: #7394ba;
			color: white;
			border: none;
		}

	</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<!-- <div class="container" style="margin-top:150px">
				<div id="pt" class="ibm cl ">
					<div class="z">
						<a href="index.action" class="nvhm" title="首页">首页</a><em>&raquo;</em>
						<a href="index.action">论坛首页</a><em>&rsaquo;</em>
						<a
							href="module.action?module.id=${post.topic.module.id}">${post.topic.module.name}</a><em>&rsaquo;</em>
						<a href="topic.action?topic.id=${post.topic.id}">${post.topic.name}</a><em>&rsaquo;</em>
						<a href="post.action?post.id=${post.id}">${post.title}</a>

					</div>
				</div>
			</div> -->
	<div style="margin-top:170px" class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				【${post.topic.name}】${post.title}
				<div class="head-right">
					<span class="iconfont icon-huifu">&nbsp;${post.replyCount}</span>
					<span class="iconfont icon-check-line">&nbsp;${post.viewCount}</span>
				</div>

			</div>
			<!-- 楼主part -->
			<div class="container">
				<div class="author">
					<div class="avatar">
						<a target="_blank" href='home.action?user.id=${post.user.id}'  style='display:block'>
							<img src='${post.user.avatar}'>
						</a>
						<span class="label label-danger">楼主</span>
						<p class="nickname">
							<a href="home.action?user.id=${post.user.id}" target="_blank" title='${post.user.nickname}'>${post.user.nickname}</a>
						</p>
						<p>积分: ${post.user.score}</p>
					</div>
					
					<div class="content">
						<span class='post-content'>${post.content}</span>
						<c:if test="${sessionScope.user!=null}">
							<form method="post" autocomplete="off" action="reply.action">
								<div class="quick-post">
									<input name="reply.post.id" value="${post.id}" type="hidden">
									<input name="reply.content" class="form-control" type="text">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn btn-primary" name="replysubmit" id="vreplysubmit"
										value="true">
										${post_newreply}快速发表
									</button>
								</div>
							</form>
						</c:if>					
						<div class="time">
							发表于 <span>${post.systimes}</span>
						</div>
						</div>					
				</div>
			</div>

			<!-- 评论part -->
			<div class="commit">
				<c:forEach var="reply" items="${replyList}" varStatus="status">
					<div class="container">
						<div class="author">
							<div class="avatar">
								<a target="_blank" href='home.action?user.id=${reply.user.id}'><img src='${reply.user.avatar}'></a>
								<p class="name">
									<a title='${reply.user.nickname}'
										target="_blank">${reply.user.nickname}</a>
								</p>
								<p>积分: ${reply.user.score}</p>
							</div>
							<div class="content">
								<span class='post-content'>${reply.content}</span>
								<div class="time">
									<c:if test="${status.count==1}">沙发</c:if>
									<c:if test="${status.count>=2}">${status.count}楼</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;
									发表于 <span>${reply.systimes}</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 换页 -->
		<div class="page">
			<c:if test="${page>1}">
				<a href="post.action?post.id=${post.id}&page=${page-1}" class="btn btn-primary">上一页</a>
			</c:if>
			<c:if test="${fn:length(replyList)>=size}">
				<a href="post.action?post.id=${post.id}&page=${page+1}" class="btn btn-primary">下一页</a>
			</c:if>
		</div>

		<!-- 用户评论 -->
		<div class="panel panel-default user">
			<div class="panel-heading">发表评论</div>
			<div class="panel-body">
				<form method="post" id="fastpostform" action="reply.action">
					<input type="hidden" name="reply.post.id" value="${post.id}">

					<div id="fastpostreturn" style="margin: -5px 0 5px"></div>

					<c:if test="${sessionScope.user==null}">
						<div class="cl">
							<div id="fastsmiliesdiv" class="y">
								<div id="fastsmiliesdiv_data">
									<div id="fastsmilies"></div>
								</div>
							</div>
							<div class="hasfsl" id="fastposteditor">
								<div class="login-box">
									<div class="login">
										您需要登录后才可以评论
										<a href="login.jsp" class="xi2">登录</a> |
										<a href="register.jsp" class="xi2">立即注册</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${sessionScope.user!=null}">
						<div class="cl">
							<div class="hasfsl" id="fastposteditor">
								<div class="area">
									<textarea rows="6" cols="80" name="reply.content" id="fastpostmessage"
										class="form-control" placeholder="请输入回复内容..."></textarea>
								</div>
							</div>
						</div>

						<button type="submit" id="vreplysubmit" name="topicsubmit" value="topicsubmit"
							class="btn btn-primary submit-btn">
							发表评论
						</button>

					</c:if>
				</form>
			</div>
		</div>

	</div>
</body>
</html>