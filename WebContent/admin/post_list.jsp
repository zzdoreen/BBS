<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>帖子列表</title>
<meta charset="utf-8"/>
<style>
.outer .table-head th{
	background: #eee;
	text-align:center;
	vertical-align:middle;
}

.outer .table>tbody>tr>td{
	vertical-align: middle;
	text-align:center;
	border-top: 1px dashed #ddd;
	text-overflow: ellipsis;
	width:10%
}
.text{
	width:100%;
	background:red;
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

	<table class='table table-striped table-hover'>

	<tr>
		<th >标题</th>
		<th>所属话题</th>
		<th >创建用户</th>
		<th >创建时间</th>
		<th>查看数量</th>
		<th >回复数量</th>
		<th >操作</th>
	</tr>
	
	<c:forEach var="post" items="${postList}">
         <tr>
         	<td><p>${post.title}</p></td>
         	<td><p>【${post.topic.module.name}】<br>${post.topic.name}</p></td>
         	<td><p>${post.user.username}</p></td>
         	<td><p>${post.systime}</p></td>
         	<td><p>${post.viewCount}</p></td>
         	<td><p>${post.replyCount}</p></td>
			<td>
				<a class="btn btn-link" href="replyList.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}">查看评论</a>
				<a class="btn btn-danger" href="postDelete.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}">删除</a>
			</td>
       	</tr>
     </c:forEach>
</table>

<br>${pageHtml}<br>
</div>
</div>
</body>
</html>