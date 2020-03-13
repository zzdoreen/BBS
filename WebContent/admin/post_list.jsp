<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>帖子列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
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
					<li role="presentation" <c:if test="${topicid==0}">class='active'
			</c:if>>
			<a href="postList.action?moduleid=${moduleid}">全部</a>
			</li>
			<c:forEach var="topic" items="${topicList}">
				<li role="presentation" <c:if test="${topicid==topic.id}">class='active'</c:if>>
					<a href="postList.action?moduleid=${moduleid}&topicid=${topic.id}">${topic.name}</a>
				</li>
			</c:forEach>
			</ul>
			</c:if>
			<br>
			<table class="post-list am-table am-table-striped am-table-hover table-main">
				<thead class="row post-head">
					<th colspan='2'>标题</th>
					<th colspan='2'>所属话题</th>
					<th>贴主</th>
					<th colspan='2'>时间</th>
					<th>查看数</th>
					<th>回复数</th>
					<th colspan='3'>操作</th>
				</thead>
				<c:forEach var="post" items="${postList}">
					<tr>
						<td colspan='2'  style='overflow:hidden;max-width:200px' title='${post.title}'>
							${post.title}
						</td>
						<td colspan='2'>【${post.topic.module.name}】<br />${post.topic.name}</td>
						<td title="${post.user.nickname}">${post.user.nickname}</td>
						<td colspan='2' title="${post.systime}">${post.systime}</td>
						<td title="${post.viewCount}">${post.viewCount}</td>
						<td title="${post.replyCount}">${post.replyCount}</td>
						<td colspan='3'>
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-sm">
									<button class="am-btn am-btn-default am-text-secondary">
										<span class="glyphicon glyphicon-pencil"></span>
										<a href="replyList.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}">查看评论</a>
									</button>
									<button class="am-btn am-btn-default am-text-danger am-hide-sm-only">
										<span class="glyphicon glyphicon-trash"></span>
										<a class="am-text-danger" onClick='if(confirm("确定删除？")==false)return false'
										href="postDelete.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}"
										>删除</a>
											
									</button>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>

			<br>${pageHtml}<br>
		</div>
	</div>
</body>

</html>