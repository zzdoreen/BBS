<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>编辑话题</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="outer">
	<div class="inner">
	<form class="form-horizontal" action="topicUpdate.action" method="post">
		<input type="hidden" name="topic.id" value="${topic.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="topic.name" value="${topic.name}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-2 control-label">版块</label>
			<div class="col-sm-2">
				<select class="form-control" name="topic.module.id">
					<c:forEach var="module" items="${moduleList}">
						<c:if test="${topic.module.id==module.id}"><option value="${module.id}" selected="selected">${module.name}</option></c:if>
						<c:if test="${topic.module.id!=module.id}"><option value="${module.id}">${module.name}</option></c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
</div>
</div>	
</body>
</html>