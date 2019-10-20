<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>${topic.name}</title>
<link href="css/style_1_common.css"rel="stylesheet" type="text/css">
<link href="css/style_1_forum_forumdisplay.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
	.article {
		margin-top: 50px;
	}
	.login-box{
		width: 100%;
		height: 150px;
		border-radius: 4px;
		border: 1px solid #ccc;
		display: flex
	}
	.login-box .login{
		margin: auto;
	}
	#fastpostsubmit{
		margin-top: 10px;
	}
	#pt{
		margin-bottom:10px;
	}
	.panel .panel-heading{
		background:#7394ba;
		color: white;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container" style="margin-top:150px">
			<div id="pt" class="bm cl">
				<div class="z">
					<a href="index.action" class="nvhm" title="首页">首页</a><em>&raquo;</em>
					<a href="index.action">论坛首页</a><em>&rsaquo;</em>
					<a href="module.action?module.id=${topic.module.id}">${topic.module.name}</a><em>&rsaquo;</em>
					<a href="topic.action?topic.id=${topic.id}">${topic.name}</a>
				</div>
			</div>
			<table class="table table-hover panel panel-default">
				<thead class='panel-heading'>
					<th colspan="2">标题</th>
					<td class="by">作者</td>
					<td class="num">回复</td>
					<td class="num">查看</td>
					<td class="by">最后回复</td>
				</thead>
				<c:forEach var="post" items="${postList}">
					<tbody id="post_${post.id}">
						<tr>
							<td>
								<a href="post.action?post.id=${post.id}" title="新窗口打开" target="_blank">
									<div style='width:64px;height:64px;background:black'></div>
								</a>
							</td>
							<th class="common">
								<a href="post.action?post.id=${post.id}" class="s xst">${post.title}</a>
							</th>
							<td class="by">
								<cite><a>${post.user.nickname}</a></cite>
								<em><span><span>${post.systimes}</span></span></em>
							</td>
							<td class="num">
								<a class="xi2">${post.replyCount}</a>
							</td>
							<td class="num">
								<em>${post.viewCount}</em>
							</td>
							<td class="by">
								<cite><a>${post.lastReply.user.nickname}</a></cite>
								<em><a><span>${post.lastReply.systimes}</span></a></em>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div>
				<c:if test="${page>1}">
					<a href="topic.action?topic.id=${topic.id}&page=${page-1}" class="nxt btn btn-primary">上一页</a>
				</c:if>
				<c:if test="${fn:length(postList)>=size}">
					<a href="topic.action?topic.id=${topic.id}&page=${page+1}" class="nxt btn btn-primary">下一页</a>
				</c:if>
			</div>

			<div class='panel panel-default'>
				<p class="panel-heading">快速发帖</p>
				<div class="panel-body">
					<form method="post" id="fastpostform" action="send.action">
						<input type="hidden" name="post.topic.id" value="${topic.id}">

						<div id="fastpostreturn" style="margin: -5px 0 5px"></div>

						<c:if test="${sessionScope.user==null}">
							<div class="">
								<div id="fastsmiliesdiv" class="y">
									<div id="fastsmiliesdiv_data">
										<div id="fastsmilies"></div>
									</div>
								</div>
								<div class="hasfsl" id="fastposteditor">
									<div class="login-box">
										<div class="login">
											您需要登录后才可以发帖
											<a href="login.jsp" class="xi2">登录</a> |
											<a href="register.jsp" class="xi2">立即注册</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>

						<c:if test="${sessionScope.user!=null}">
							<div class="pbt cl">
								<input type="text" id="subject" name="post.title" class="form-control"
									style="width:912px;" placeholder="请输入标题...">
							</div>
							<div class="cl">
								<div class="hasfsl" id="fastposteditor">
									<textarea rows="6" cols="80" name="post.content" id="fastpostmessage"
										class="form-control" placeholder="请输入内容..."></textarea>
								</div>
							</div>
							<button type="submit" name="topicsubmit" id="fastpostsubmit" value="topicsubmit"
								class="btn btn-primary">
								发表帖子
							</button>
						</c:if>
					</form>
				</div>
			</div>
	
</div>
</body>
</html>