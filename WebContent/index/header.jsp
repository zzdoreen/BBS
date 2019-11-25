<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>header</title>
<link rel="stylesheet" href="live2d/css/live2d.css" />
</head>
<style>
.head {
	z-index: 200;
	height: 42px;
	color: #222;
	background: hsla(0, 0%, 100%, .4);
	box-shadow: 0 1px 5px rgba(0, 0, 0, .3);
	line-height: 42px;
}

nav.container {
	margin: 0 auto;
}

ul {
	display: flex;
	justify-content: space-between
}

.navbar ul>li:hover,.navbar a:hover {
	color: white;
	margin-top: 1px;
	cursor: pointer;
	text-decoration: none;
}

.bg {
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	width: 100%;
	height: 200px;
	background-image: url('img/bg.png');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .9);
}

.icon {
	width: 40px;
	height: 25px;
	margin-right: 15px;
	vertical-align: center
}
.userinfo{
	width:85%;
	white-space: nowrap;
}
.head-avatar {
	line-height: 42px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	vertical-align: top;
}
.userinfo .name{
	width:calc(70% - 40px);
	overflow:hidden;
	display:inline-block;
	white-space:nowrap;
	text-overflow:ellipsis;
	text-align:right;
}
.navbar a {
	color: #222
}
a:hover{
	cursor: pointer;
	text-decoration: none;
}
.search {
	margin-top:100px;
	display: flex;
	justify-content: flex-end;
	margin-right: 200px;
	z-index:200;
}

.search .search-value {
	width: 300px;
	background: rgba(255, 255, 255, 0.7);
}

.search .box {
	position: relative;
}

#search-btn {
	position: absolute;
	right: 10px;
	line-height: 35px;
}

#search-btn:hover {
	color: rgba(64, 109, 149, .8);
}
</style>
<script>
	window.onload = function() {
		var oBtn = document.getElementById('search-btn')
		var oValue = document.getElementsByClassName('search-value')[0]
		var box = document.getElementsByClassName('search')[0]
		oBtn.onclick = function() {
			window.open('search.action#' + oValue.value, '_self');
		}

	}
</script>
<body>
	<div class="bg "></div>
	<header class="head navbar">
		<nav class="row container">
			<div class="col-sm-8">
				<ul>
					<li><a href="index.action"><img class="icon"
							src="img/icon1.png" alt="">首页</a></li>
					<c:forEach var="module" items="${moduleList}">
						<li><a href="module.action?module.id=${module.id}">${module.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-sm-4">
				<div class="row">

					<c:if test="${sessionScope.user==null}">
						<div class=" col-sm-8"></div>
						<div class="col-sm-4">
							<ul>
								<li><a href="login.jsp">登陆</a></li>
								<li><a href="register.jsp">注册</a></li>
							</ul>
						</div>
					</c:if>

					<c:if test="${sessionScope.user!=null}">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<ul>
								<li class='userinfo'>
								<span class='name' title='${sessionScope.user.nickname}'>${sessionScope.user.nickname}</span> 
								<a href='user.action?id=${sessionScope.user.id}'>
								<img class="head-avatar"
									src="${sessionScope.user.avatar}" alt="avatar"
									title="积分：${sessionScope.user.score}"></a>
								</li>
								<li><a href="logout.action">退出</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</nav>
	</header>
	<div class='search'>
			<div class='box'>
				<input type='search' class='search-value form-control ' /> <i
				id='search-btn' class='glyphicon glyphicon-search'></i>
			</div>
		</div>
	<div id="landlord" style="left:5px;bottom:0px;">
    <div class="message" style="opacity:0"></div>
    <canvas id="live2d" width="500" height="560" class="live2d"></canvas>
    <div class="live_talk_input_body">
    	<!--
    	<div class="live_talk_input_name_body">
        	<input name="name" type="text" class="live_talk_name white_input" id="AIuserName" autocomplete="off" placeholder="你的名字" />
        </div> -->
        <div class="live_talk_input_text_body">
        	<input name="talk" type="text" class="live_talk_talk white_input" id="AIuserText" autocomplete="off" placeholder="要和我聊什么呀？"/>
            <button type="button" class="live_talk_send_btn" id="talk_send">发送</button>
        </div>
    </div>
    <input name="live_talk" id="live_talk" value="1" type="hidden" />
    <div class="live_ico_box">
    	<div class="live_ico_item type_info" id="showInfoBtn"></div>
    	<div class="live_ico_item type_talk" id="showTalkBtn"></div>
        <div class="live_ico_item type_music" id="musicButton"></div>
        <!-- <div class="live_ico_item type_youdu" id="youduButton"></div> -->
        <div class="live_ico_item type_quit" id="hideButton"></div>
        <input name="live_statu_val" id="live_statu_val" value="0" type="hidden" />
        <audio src="" style="display:none;" id="live2d_bgm" data-bgm="0" preload="none"></audio>
        <input name="live2dBGM" value="https://m10.music.126.net/20191125162450/1779095d54742f1166ab0538097d59b2/yyaac/5158/0008/5559/f2432914627b81b9320bb39cae2c769a.m4a" type="hidden">
        <input name="live2dBGM" value="https://m10.music.126.net/20191125162605/9c573d687f9fea42962339ae4c8071c0/yyaac/545d/0f0f/070e/c7fb8907598e5ca8e29e0d81abd5e0b5.m4a" type="hidden">
        <input id="duType" value="douqilai,l2d_caihong" type="hidden">
    </div>
</div>
<div id="open_live2d">召唤蕾姆</div>
<script type="text/javascript" src="live2d/js/jquery-3.3.1.min.js"></script>
<script>
var message_Path = '/ssh_bbs/index/live2d/';//资源目录，如果目录不对请更改
var talkAPI = "http://www.tuling123.com/openapi/api";//如果有类似图灵机器人的聊天接口请填写接口路径
</script>
<script type="text/javascript" src="live2d/js/live2d.js"></script>
<script type="text/javascript" src="live2d/js/message.js"></script>
</body>
</html>