<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>用户列表</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<meta charset="utf-8" />
	<style>
		.content{
			height:500px !important;
			padding-top:20px;
		}
		.add-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 1px solid #ccc;
            margin-bottom: 20px;
            box-shadow: 0 2px 2px 2px #ddd;
        }
        .cover::after{
            content: ' ';
            display: inline-block;
            width: 150px;
            height: 150px;
            transform: translateX(-100%);
            position: absolute;
            background: rgba(0,0,0,0.5);
            border-radius: 50%;
            border: 1px solid #ccc;
        }
        #editAvatar{
			width:150px;
			height:150px;
			margin-bottom:20px;
			border-radius:50%;
			border:1px solid #ccc;
			box-shadow: 0 2px 5px 2px #ccc;
			
		}
	</style>
</head>

<body>
	<%@include file="header.jsp" %>
	<div class="outer">
		<div class='inner'>
			<div class="am-btn-toolbar">
				<div class="am-btn-group am-btn-group-sm">
					<button class="am-btn am-btn-default ">
						<span class="glyphicon glyphicon-plus"></span>
						<a style="color:#444" id='addBtn'>新增用户</a>
					</button>
				</div>
			</div>
			<br />
			<table class="am-table am-table-striped am-table-hover table-main">
				<tr>
					<th width="10%">用户名</th>
					<th width="10%">昵称</th>
					<th width="10%">积分</th>
					<th width="10%">操作</th>
				</tr>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>
							<p>${user.username}</p>
						</td>
						<td>
							<p>${user.nickname}</p>
						</td>
						<td>
							<p>${user.score}</p>
						</td>
						<td>
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-sm">
									<button class="am-btn am-btn-default am-text-secondary">
										<span class="glyphicon glyphicon-pencil"></span>
										<a onClick=editFn() data-value='${user.id}' data-username='${user.username}' data-nickname='${user.nickname}' data-score='${user.score}'  data-avatar = '${user.avatar }'>编辑</a>
									</button>
									<button class="am-btn am-btn-default am-text-danger am-hide-sm-only">
										<span class="glyphicon glyphicon-trash"></span>
										<a class="am-text-danger" onClick='if(confirm("确定删除？")==false)return false' href="userDelete.action?user.id=${user.id}">删除</a>
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
	
	<form class="form-horizontal Form" action="userSave.action" method="post" id='addForm'>
		<div class='content'>
			<div class="cover">
	        	<img src='https://s2.ax1x.com/2020/03/04/3oa3h6.jpg' class='add-avatar' />
	    	</div>
			<input type='text' value='https://s2.ax1x.com/2020/03/04/3oa3h6.jpg' name="user.avatar"  required="required" style='display:none'/>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"  placeholder="请输入用户名" name="user.username" value="" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">密码</label>
				<div class="col-sm-8">
					<input type="password" class="form-control"  placeholder="请输入密码" name="user.password" value="" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">昵称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"   placeholder="请输入昵称" name="user.nickname" value="" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">积分</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="user.score" value="0" required="required">
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
	
	<form class="form-horizontal Form" action="userUpdate.action" method="post" id='editForm'>
		
		<input type="hidden" name="user.id" value="${user.id}" id='inputId'>
		<input type="hidden" name="user.username" value="${user.username}" id='inputUserName' > 
		<div class='content'>
			<img id='editAvatar' class='avatar' />
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" value="${user.username}" id='editUserName' required="required" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">密码</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="" name="user.password" value="" placeholder="请输入新密码">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">昵称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="editNickName" name="user.nickname" value="${user.nickname}" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">积分</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="editScore" name="user.score" value="${user.score}" required="required">
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
		var editBtn = document.getElementById('editBtn')
		var editForm = document.getElementById('editForm')
		var closeBtn = document.getElementById('close')
		var dataId = document.getElementById('inputId')
		var dataUserName = document.getElementById('inputUserName')
		var avatar = document.getElementById('editAvatar')
		
		function editFn() {
			console.log(event.target)
			dataId.value = event.target.dataset.value
			dataUserName.value = event.target.dataset.username
			avatar.src = event.target.dataset.avatar
			document.getElementById('editUserName').value =  event.target.dataset.username
			document.getElementById('editNickName').value =  event.target.dataset.nickname
			document.getElementById('editScore').value =  event.target.dataset.score
			editForm.style.display = 'block'
		}
		closeBtn.onclick = function(){
			editForm.style.display = 'none'
		}
	</script>
</body>

</html>