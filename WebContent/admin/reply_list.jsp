<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>评论列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
</head>
<style>
	.replyList {
		max-height: 60px;
		overflow: hidden;
	}
	.replyList td p {
		max-height: 30px;
		overflow: hidden;
	}

	.am-btn-default {
		background: white;
	}
</style>

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
			<table class="am-table am-table-striped am-table-hover table-main">

				<thead>
					<th width="30%">评论内容</th>
					<th width="10%">时间</th>
					<th width="10%">操作</th>
				</thead>

				<c:forEach var="reply" items="${replyList}">
					<tr class='replyList'>
						<td>${reply.content}</td>
						<td>
							<p>${reply.systimes}</p>
						</td>
						<td>
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-sm">
									<button class="am-btn am-btn-default am-text-danger am-hide-sm-only">
										<span class="glyphicon glyphicon-trash"></span>
										<a class="am-text-danger" onClick='if(confirm("确定删除？")==false)return false'
											href="replyDelete.action?reply.id=${reply.id}&post.id=${post.id}&moduleid=${moduleid}&topicid=${topic.id}">删除</a>
									</button>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			${pageHtml}<br />
		</div>
	</div>
</body>

</html>