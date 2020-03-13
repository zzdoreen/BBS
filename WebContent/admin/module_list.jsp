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
			<div class="am-btn-toolbar">
				<div class="am-btn-group am-btn-group-sm" id='addBtn'>
					<button class="am-btn am-btn-default ">
						<span class="glyphicon glyphicon-plus"></span>
						<a style="color:#444" >新增版块</a>
					</button>
				</div>
			</div>
			<br>

			<table class="am-table am-table-striped am-table-hover table-main">

				<thead class="row">
					<th class="col-xs-9">版块名称</th>
					<th class="col-xs-3">操作</th>
				</thead>

				<c:forEach var="module" items="${moduleList}">
					<tr>
						<td>
							<p>${module.name}</p>
						</td>
						<td>
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-sm">
									<button class="am-btn am-btn-default am-text-secondary">
										<span class="glyphicon glyphicon-pencil"></span>
										<a  onClick=editFn() data-value='${module.id}' data-name='${module.name}' >编辑</a>
									</button>
									<button class="am-btn am-btn-default am-text-danger am-hide-sm-only">
										<span class="glyphicon glyphicon-trash"></span>
										<a class="am-text-danger" onClick='if(confirm("确定要删除？")==false)return false'
											href="moduleDelete.action?module.id=${module.id}">删除</a>
									</button>
								</div>
							</div>
					</tr>
				</c:forEach>
				
			</table>
			
			<form class="form-horizontal Form" action="moduleSave.action" method="post" id='addForm'>
				<div class="content">
					<div class="formTitle"></div>
					<div class="form-group">
						<label for="input_name" class="col-sm-3 control-label">版块名称:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" placeholder="请输入版块名称" name="module.name" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-1" >
							<button type="submit" onClick='if(confirm("确定要添加吗？")==false)return false' class="am-btn am-btn-primary am-btn-block">提交</button>
							<button type="reset" id="resetBtn" class="am-btn am-btn-default am-btn-block">取消</button>
						</div>
					</div>
				</div>
			</form>
			
			<form class="form-horizontal Form" action="moduleUpdate.action" method="post" id='editForm'>
				<input type="hidden" name="module.id" id='inputId'>
				<div class="content">
					<div class="formTitle"></div>
					<div class="form-group">
						<label for="input_name" class="col-sm-3 control-label">版块名称:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="editName" name="module.name" required="required">
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
			<br>${pageHtml}<br>
		</div>
	</div>
	<script>
	var editBtn = document.getElementById('editBtn')
	var editForm = document.getElementById('editForm')
	var closeBtn = document.getElementById('close')
	var dataId = document.getElementById('inputId')
	
	function editFn() {
		dataId.value = event.target.dataset.value
		document.getElementById('editName').placeholder =  event.target.dataset.name
		editForm.style.display = 'block'
	}
	closeBtn.onclick = function(){
		editForm.style.display = 'none'
	}
	</script>
</body>

</html>