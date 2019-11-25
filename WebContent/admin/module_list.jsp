<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>版块列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
</head>

<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class="inner">
			<div>
				<a class="btn btn-warning" href="moduleAdd.action">添加版块</a>
			</div>

			<br>

			<table class="table table-bordered table-hover">

				<thead class="row">
					<th class="col-xs-10">版块名称</th>
					<th class="col-xs-2">操作</th>
				</thead>

				<c:forEach var="module" items="${moduleList}">
					<tr>
						<td>
							<p>${module.name}</p>
						</td>
						<td>
							<a class="btn btn-success" href="moduleEdit.action?module.id=${module.id}">修改</a>
							<a class="btn btn-danger" href="moduleDelete.action?module.id=${module.id}">删除</a>
						</td>
					</tr>
				</c:forEach>

			</table>

			<br>${pageHtml}<br>
		</div>
	</div>
</body>

</html>