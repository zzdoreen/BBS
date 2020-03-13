<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户注册</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/reset.css">
	<style>
		.container {
			width: 60%;
			height: 600px;
			box-shadow: gray 0 0 10px;
			padding: 0;
			display: flex;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			margin: auto;
			margin-top: 3%;
			border-radius: 15px;
			animation: boxin cubic-bezier(0.25, 0.46, 0.45, 0.94) 1s
		}

		.left {
			border-top-left-radius: 15px;
			border-bottom-left-radius: 15px;
			flex: 0.9;
			background: rgba(0, 0, 0, .9);
			height: 100%;
			padding: 0 25px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			text-align: center;
		}

		.left h1 {
			color: aliceblue;
			font-size: 30px;
			margin-bottom: 10px;
		}

		.left input {
			margin: 15px 0;
			border-radius: 5px;
			height: 40px;
			line-height: 40px;
			padding-left: 10px;
			border: none;
		}

		.left button {
			margin: 5px 0;
		}

		.left button:last-child {
			margin-bottom: 50px;
		}

		.right {
			flex: 1.1;
			overflow: hidden;
			background: url('img/register.jpg') no-repeat top;
			background-size: cover;
		}

		body {
			height: 100%;
		}

		.filter-box {
			background: url('img/register.jpg') no-repeat top;
			background-size: cover;
			width: 100%;
			height: 100%;
			z-index: -1;
			filter: blur(15px)
		}
		@keyframes boxin{
			from{
				transform: translateY(-100%);
				opacity: 0;
			}
			to{
				opacity: 1;
				transform: translateY(0)
			}
		}
	</style>
</head>

<body>
	<div class="filter-box"></div>
	<div class="container">
		<form action="register.action" method="POST" class="left input-group">
			<h1>Welcome!</h1>
			<input type="text" name="user.avatar" required value="https://s2.ax1x.com/2020/03/04/3oa3h6.jpg" style='display:none'>
			<input type="text" placeholder="username" name="user.username" required id='username'>
			<p style="color: #d9534f;text-align: left;display: none;" id="checkName">请输入4-16位字符</p>
			<input type="password" placeholder="password" name="user.password" required id="password">
			<p style="color: #d9534f;text-align: left;display: none;" id="checkPassword">请输入6-20位包含数字和英文两种类型的字符</p>
			<input type="password" placeholder="check password" name="user.passwordNew" required id="passwordNew">
			<p style="color: #d9534f;text-align: left;display: none;" id="check2Password">两次密码不一致，请重新输入</p>
			<input type="text" placeholder="nickname" name="user.nickname" required="required" id="nickname">
			<p style="color: #d9534f;text-align: left;display: none;" id="checkNickName">请输入4-16位字符</p>
			<button type="submit" class="btn btn-primary" id="submitBtn">注册</button>
			<button type="reset" class="btn btn-danger">重置</button>
		</form>
		<div class="right"></div>
	</div>
	<script>
		var oUsername = document.getElementById('username')
		var oCheckName = document.getElementById('checkName')
		var submitBtn = document.getElementById('submitBtn')
		var oPassword = document.getElementById('password')
		var oCheckPassword = document.getElementById('checkPassword')
		var oPasswordNew = document.getElementById('passwordNew')
		var oCheck2Password = document.getElementById('check2Password')
		var oNickname = document.getElementById('nickname')
		var oCheckNickname = document.getElementById('checkNickName')
		
		var nameReg =  /^[a-zA-Z0-9_-]{4,16}$/
		var passwordReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/

		oUsername.onkeyup = function(){
			if(!nameReg.test(oUsername.value)){
				oUsername.style.border = '1px solid #d9534f'
				oCheckName.style.display = 'block'
				submitBtn.disabled = true
			}else{
				oUsername.style.border = 'none'
				oCheckName.style.display = 'none'
				submitBtn.disabled = false
			}
		}
		
		oPassword.onkeyup = function(){
			console.log(passwordReg.test(oPassword))
			if(!passwordReg.test(oPassword.value)){
				oPassword.style.border =  '1px solid #d9534f'
				oCheckPassword.style.display = 'block'
				submitBtn.disabled = true
			}else{
				oPassword.style.border =  'none'
				oCheckPassword.style.display = 'none'
				submitBtn.disabled = false
			}
		}

		oPasswordNew.onkeyup = function(){
			if(oPasswordNew.value !== oPassword.value){
				oPasswordNew.style.border = '1px solid #d9534f'
				oCheck2Password.style.display = 'block'
				submitBtn.disabled = true
			}else{
				oPasswordNew.style.border = 'none'
				oCheck2Password.style.display = 'none'
				submitBtn.disabled = false
			}
		}

		oNickname.onkeyup = function(){
			if(!nameReg.test(oNickname.value)){
				oCheckName.style.border = '1px solid #d9534f'
				oCheckNickname.style.display = 'block'
				submitBtn.disabled = true
			}else{
				oCheckName.style.border = 'none'
				oCheckNickname.style.display = 'none'
				submitBtn.disabled = false
			}
		}
	</script>
</body>

</html>