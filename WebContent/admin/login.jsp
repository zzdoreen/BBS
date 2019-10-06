<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
    html,
    body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        overflow:hidden;
    }

    .bg {
        width: 105%;
        height: 105%;
        margin: -10px 0 0 -10px;
        overflow: hidden;
        position: relative;
        z-index:-1;
        filter:blur(10px);
    }
    #video {
        width: 100%;
        height: 100%;
        object-fit: cover
    }
    .container-form{
        position: absolute;
        width: 100%;
        top: 0;
        left: 0;
        text-align: center;
        z-index:2;
       
    }
    .form-signin {
        border: 1px solid white;
        margin: 10% auto;
        max-width: 40%;
        padding: 30px 40px 50px 40px;
        background: rgba(255,255 ,255, 0.5);
        border-radius: 15px;
        position:relative
    }
    .form-signin input {
        margin-bottom: 10px;
    }

    .form-signin .form-control {
        box-sizing: border-box;
        font-size: 16px;
        height: auto;
        padding: 10px;
        position: relative;
    }

    .form-signin .form-control:focus {
        z-index: 2;
    }

    .form-signin input[type="email"] {
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        margin-bottom: -1px;
    }

    .form-signin input[type="password"] {
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        margin-bottom: 10px;
    }
    .avatar{
        margin-top: -100px;
        margin-bottom: 20px;
        width: 150px;
        height: 150px;
        border: 5px solid white;
        border-radius: 50%;
    }
    
.radio-group{
	display:flex;
	justify-content:center;
	margin: 30px auto 10px 0;
}
label{
    line-height: 20px;
    display: inline-block;
    margin-left: 5px;
    margin-right:15px;
    color: #777;
    margin-right:10%;
    font-size:14px;
    font-weight:500;
}
.radio_type{
    width: 20px;
    height: 20px;
    appearance: none;
    position: relative;
}
.radio_type:before{
    content: '';
    width: 20px;
    height: 20px;
    border: 1px solid #ccc;
    display: inline-block;
    border-radius: 50%;
    vertical-align: middle;
}
.radio_type:checked:before{
    content: '';
    width: 20px;
    height: 20px;
    border: 1px solid #2e6da4;
    background:#2e6da4;;
    display: inline-block;
    border-radius: 50%;
    vertical-align: middle;
}
.radio_type:checked:after{
    content: '';
    width: 10px;
    height:5px;
    border: 2px solid white;
    border-top: transparent;
    border-right: transparent;
    text-align: center;
    display: block;
    position: absolute;
    top: 6px;
    left:5px;
    vertical-align: middle;
    transform: rotate(-45deg);
}
.radio_type:checked+label{
    color: #2e6da4;
}
.errorInfo{
	position:absolute;
	bottom:0;
	color:red;
	left:50%;
	transform:translateX(-50%)
}
</style>
<body>
    <div class="bg">
        <video id="video" src="video/test.mp4" loop muted autoplay></video>
    </div>
    <div class="container-form">
         <form class="form-signin" action="login.action" method="post">
            <img src="images/avatar.jpg" class="avatar" alt="">
            <input type="text" name="admin.username"  class="form-control" placeholder="用户" required autofocus>
            <input type="password" name="admin.password" class="form-control" placeholder="密码" required>
            <div class="radio-group">
            	<input class="check radio_type" type="radio" name="admin.role" value="1" checked="checked"><label>超级管理员</label>
				<input class="check radio_type" type="radio" name="admin.role" value="2"><label>管理员</label>
				<input class="check radio_type" type="radio" name="admin.role" value="3"><label>版主</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        	<p class='errorInfo'>${msg}</p>
        </form>

    </div>
</body>

</html>