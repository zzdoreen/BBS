<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>用户列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/> 
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class='inner'>
			<div>
				<a class="btn btn-warning" href="userAdd.action">添加用户</a>
			</div>
			<br/>
			<table class="table table-bordered table-hover">
				<tr>
					<th width="10%">用户名</th>
					<th width="10%">昵称</th>
					<th width="10%">积分</th>
					<th width="10%">操作</th>
				</tr>
				<c:forEach var="user" items="${userList}">
         			<tr>
         				<td><p>${user.username}</p></td>
         				<td><p>${user.nickname}</p></td>
         				<td><p>${user.score}</p></td>
						<td>
							<a class="btn btn-success" href="userEdit.action?user.id=${user.id}">修改</a>
							<a class="btn btn-danger" href="userDelete.action?user.id=${user.id}">删除</a>
						</td>
       				</tr>
     			</c:forEach>
			</table>
			<br>${pageHtml}<br>
		</div>
	</div>
</body>
</html>