<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>帖子列表</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8"/>
<style>
.post-list .post-head {
			height: 37px;
			line-height: 37px;
		}

		.row {
			border: 1px solid #ddd;
			height: 50px;
			text-align: center;
			text-overflow: ellipsis;
			overflow: hidden;
		}
		.row:hover{
			background:#eee;
			cursor:default;
		}
		.row div {
			padding-top: 7px;
			height: 100%;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
			border-right: 1px solid #ddd;
		}

		.post-head div {
			padding-top: 0;
			text-align: center;
			border: 1px solid #ddd;
			font-weight: 700;
		}
</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class="inner">
	<ul role="tablist" class="nav nav-tabs">
        <li role="presentation" <c:if test="${moduleid==0}">class='active'</c:if>>
        	<a href="postList.action">全部</a>
        </li>
		<c:forEach var="module" items="${moduleList}">
	        <li role="presentation" <c:if test="${moduleid==module.id}">class='active'</c:if>>
	        	<a href="postList.action?moduleid=${module.id}">${module.name}</a>
	        </li>
		</c:forEach>
    </ul>	
	<c:if test="${moduleid>0}">
		<ul role="tablist" class="nav nav-tabs">
	        <li role="presentation" <c:if test="${topicid==0}">class='active'</c:if>>
	        	<a href="postList.action?moduleid=${moduleid}">全部</a>
	        </li>
			<c:forEach var="topic" items="${topicList}">
		        <li role="presentation" <c:if test="${topicid==topic.id}">class='active'</c:if>>
		        	<a href="postList.action?moduleid=${moduleid}&topicid=${topic.id}">${topic.name}</a>
		        </li>
			</c:forEach>
	    </ul>
    </c:if>

	<div class="post-list">
				<div class="row post-head">
					<div class="col-xs-2">标题</div>
					<div class="col-xs-2">所属话题</div>
					<div class="col-xs-1">贴主</div>
					<div class="col-xs-2">时间</div>
					<div class="col-xs-1">查看数</div>
					<div class="col-xs-1">回复数</div>
					<div class="col-xs-3">操作</div>
				</div>
				<c:forEach var="post" items="${postList}">
					<div class="row">
						<div class="col-xs-2" title='${post.title}'>
							${post.title}
						</div>
						<div class="col-xs-2">【${post.topic.module.name}】<br />${post.topic.name}</div>
						<div class="col-xs-1" title="${post.user.username}">${post.user.username}</div>
						<div class="col-xs-2" title="${post.systime}">${post.systime}</div>
						<div class="col-xs-1" title="${post.viewCount}">${post.viewCount}</div>
						<div class="col-xs-1" title="${post.replyCount}">${post.replyCount}</div>
						<div class="col-xs-3">
							<a class="btn btn-primary"
								href="replyList.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}">查看评论</a>
							<a class="btn btn-danger"
								href="postDelete.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}">删除</a>
						</div>
					</div>
				</c:forEach>
			</div>
		
<br>${pageHtml}<br>
</div>
</div>
</body>
</html>