<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>话题列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
	<style>
		.Form .content{
			height:350px!important;
		}
	</style>
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
			<br>
			<div class="am-btn-toolbar">
				<div class="am-btn-group am-btn-group-sm">
					<button class="am-btn am-btn-default ">
						<span class="glyphicon glyphicon-plus"></span>
						<a style="color:#444" id='addBtn' >新增话题</a>
					</button>
				</div>
			</div>
			<br>
			<table class="am-table am-table-striped am-table-hover table-main">
				<thead>
					<th width="10%">话题名称</th>
					<th width="10%">所属版块</th>
					<th width="10%">操作</th>
				</thead>

				<c:forEach var="topic" items="${topicList}">
					<tr>
						<td>
							<p>${topic.name}</p>
						</td>
						<td>
							<p>${topic.module.name}</p>
						</td>
						<td>
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-sm">
									<button class="am-btn am-btn-default am-text-secondary">
										<span class="glyphicon glyphicon-pencil"></span>
										<a onClick=editFn() data-value='${topic.id}' data-name='${topic.name}'>编辑</a>
									</button>
									<button class="am-btn am-btn-default am-text-danger am-hide-sm-only">
										<span class="glyphicon glyphicon-trash"></span>
										<a class="am-text-danger" onClick='if(confirm("确定删除？")==false)return false'
										 href="topicDelete.action?topic.id=${topic.id}&moduleid=${moduleid}">删除</a>
									</button>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>

			</table>
			${pageHtml}<br>
		</div>
	</div>
	
	<form class="form-horizontal Form" action="topicSave.action" method="post" id='addForm'>
		<div class="content">
		<div class="formTitle"></div>
		<div class="form-group">
			<label for="input_name" class="col-sm-3 control-label" >话题名称</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="input_name" name="topic.name" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-3 control-label">所属版块</label>
			<div class="col-sm-4">
				<select class="form-control" name="topic.module.id">
					<c:forEach var="module" items="${moduleList}">
						<c:if test="${moduleid==module.id}"><option value="${module.id}" selected="selected">${module.name}</option></c:if>
						<c:if test="${moduleid!=module.id}"><option value="${module.id}">${module.name}</option></c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" onClick='if(confirm("确定要添加吗？")==false)return false' class="am-btn am-btn-primary am-btn-block">提交</button>
				<button type="reset" id="resetBtn" class="am-btn am-btn-default am-btn-block">取消</button>
			</div>
		</div>
		</div>
	</form>
	
	<form class="form-horizontal Form" id='editForm' action="topicUpdate.action" method="post">
		<input type="hidden" name="topic.id" id='inputId'>
		<div class="content">
		<div class="formTitle"></div>
		<div class="form-group">
			<label for="input_name" class="col-sm-3 control-label">话题名称</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="editName" name="topic.name" value="${topic.name}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-3 control-label">所属版块</label>
			<div class="col-sm-4">
				<select class="form-control" name="topic.module.id">
					<c:forEach var="module" items="${moduleList}">
						<c:if test="${moduleid==module.id}"><option value="${module.id}" selected="selected">${module.name}</option></c:if>
						<c:if test="${moduleid!=module.id}"><option value="${module.id}">${module.name}</option></c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-sm-offset-1" >
				<button type="submit" onClick='if(confirm("确定要修改吗？")==false)return false' class="am-btn am-btn-primary am-btn-block">提交</button>
				<button type="reset" id="close" class="am-btn am-btn-default am-btn-block">取消</button>
			</div>
		</div>
		</div>
	</form>
	
	<script>
	// 编辑
	var editBtn = document.getElementById('editBtn')
	var editForm = document.getElementById('editForm')
	var closeBtn = document.getElementById('close')
	var dataId = document.getElementById('inputId')
	
	function editFn() {
		dataId.value = event.target.dataset.value
		document.getElementById('editName').value =  event.target.dataset.name
		editForm.style.display = 'block'
	}
	closeBtn.onclick = function(){
		editForm.style.display = 'none'
	}
	</script>
</body>

</html>