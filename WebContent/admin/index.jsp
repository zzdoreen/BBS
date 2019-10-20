<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
body{
	height:100vh;
	background:radial-gradient(#bfe9ff,#314755);
	overflow:hidden;
}
.success {
	background: white;
	overflow: hidden;
	position: absolute;
	height: 300px;
	width: 750px;
	left:50%;
	top:50%;
	margin-left:-350px;
	margin-top:-175px;
	border-radius:15px;
	box-shadow:0px 0px 10px #314755;
	text-algin:center;
}

.success img {
	width: 45%;
	position: absolute;
	bottom: 0;
	left: 0;
	animation: move 2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.success .content {
	position: absolute;
	left: 50%;
	top: 30%;
	font-size: 50px;
	font-weight: 700;
	animation: move 2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@keyframes move {
	0% {
		transform: scale(1) translateX(-100%)
	}
	50% {
		transform: scale(1.2)
	}
	100% {
		transform: scale(1)
	}
}

.content .glyphicon {
	color: lightblue;
	opacity: 0;
	animation: updown 2s infinite linear 2s;
}

@keyframes updown {
	from {
		opacity: 1;
		transform: rotate(360deg)
	}
	to {
		opacity: 1;
		transform: rotate(0)
	}
}


.pulse-container {
	width: 100px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin:auto;
}

.pulse-bubble {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: #314755;
}
.pulse-bubble-1 {
	animation: pulse .4s ease 0s infinite alternate;
}
.pulse-bubble-2 {
	animation: pulse .4s ease .2s infinite alternate;
}
.pulse-bubble-3 {
	animation: pulse .4s ease .4s infinite alternate;
}
@keyframes pulse {
	from {
		opacity: 1;
		transform: scale(1);
	}
	to {
		opacity: .25;
		transform: scale(.75);
	}
}
</style>
</head>
<body>

	<div class="success">
		<img src="images/admin-login.jpeg" alt="">
		<div class="content">
			welcome!
			<br/>
			<div class="spinner-box">
				<div class="pulse-container">
					<div class="pulse-bubble pulse-bubble-1"></div>
					<div class="pulse-bubble pulse-bubble-2"></div>
					<div class="pulse-bubble pulse-bubble-3"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
	setTimeout(()=>{
		window.open('moduleList.action','_self')
	},5000)
	</script>
</body>
</html>