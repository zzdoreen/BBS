<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>话题列表</title>
<meta charset="utf-8"/>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class='inner'>
	<ul role="tablist" class="nav nav-tabs">
        <li role="presentation" <c:if test="${moduleid==0}">class='active'</c:if>>
        	<a href="topicList.action">全部</a>
        </li>
		<c:forEach var="module" items="${moduleList}">
	        <li role="presentation" <c:if test="${moduleid==module.id}">class='active'</c:if>>
	        	<a href="topicList.action?moduleid=${module.id}">${module.name}</a>
	        </li>
		</c:forEach>
    </ul>
	<div>
		<a class="btn btn-warning" href="topicAdd.action?moduleid=${moduleid}">添加话题</a>
	</div>
	<table class="table table-bordered table-hover">
	<tr>
		<th width="10%">话题名称</th>
		<th width="10%">所属版块</th>
		<th width="10%">操作</th>
	</tr>
	
	<c:forEach var="topic" items="${topicList}">
         <tr>
         	<td><p>${topic.name}</p></td>
         	<td><p>${topic.module.name}</p></td>
			<td>
				<a class="btn btn-success" href="topicEdit.action?topic.id=${topic.id}">修改</a>
				<a class="btn btn-danger" href="topicDelete.action?topic.id=${topic.id}&moduleid=${moduleid}">删除</a>
			</td>
       	</tr>
     </c:forEach>
     
</table>
${pageHtml}<br>
</div>
</div>
</body>
</html>