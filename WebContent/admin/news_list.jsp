<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>公告列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
</head>

<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class="inner">
			<div>
				<a class="btn btn-warning" href="newsAdd.action">添加公告</a>
			</div>
			<br>
			<table class="table table-bordered table-hover">

				<thead class="row">
					<th class="col-xs-5">公告名称</th>
					<th class="col-xs-5">公告内容</th>
					<th class="col-xs-2">操作</th>
				</thead>

				<c:forEach var="news" items="${newsList}">
					<tr>
						<td>
							<p>${news.title}</p>
						</td>
						<td>
							<p>${news.content}</p>
						</td>
						<td>
							<a class="btn btn-success" href="newsEdit.action?news.id=${news.id}">修改</a>
							<a class="btn btn-danger" href="newsDelete.action?news.id=${news.id}">删除</a>
						</td>
					</tr>
				</c:forEach>

			</table>

			<br>${pageHtml}<br>
		</div>
	</div>
</body>

</html>