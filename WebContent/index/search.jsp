<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索页面</title>
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src='js/jquery-3.3.1.min.js'></script>
<style>
	.article {
		margin-top: 50px;
	}
	.login-box{
		width: 100%;
		height: 150px;
		border-radius: 4px;
		border: 1px solid #ccc;
		display: flex
	}
	.login-box .login{
		margin: auto;
	}
	#fastpostsubmit{
		margin-top: 10px;
	}
	#pt{
		margin-bottom:10px;
	}
	.panel .panel-heading{
		background:#7394ba;
		color: white;
	}
	.common .s{
		width:650px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
		display:inline-block;
	}
	.post-avatar{
		width:64px;
		height:64px;
		border-radius:50%;
		border:1px solid #ccc;
		box-shadow:0 0 2px 2px #7394ba;
	}
	.search-box{
		margin-top:-100px;
		margin-bottom:60px;
		display:flex;
		justify-content:center
	}
	.search-box .form-control{
		margin:0 20px;
		flex-basis:250px;
	}
	.empty{
		width:40%;
		position:absolute;
		left:50%;
		transform:translateX(-50%);
		display:none;
	}
	.search{
		display: none !important;
	}
	.table tbody tr th,.table,.table tbody tr td ,.table>tbody {
		border: none;
	}
	.table tbody tr{
		border-bottom: #7394ba 1px dashed;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container" style="margin-top:170px">
	<div class='search-box'>
		<input type='search' class='form-control search-content' />
		<button class='btn btn-primary search-btn'><i class='glyphicon glyphicon-search'></i> &nbsp;&nbsp;搜索</button>
	</div>
	<img class='empty' src='img/empty.png' />
	<table class="table table-hover panel panel-default">
				<thead class='panel-heading'>
					<td colspan="2">标题</td>
					<td class="by">作者</td>
					<td class="num">回复</td>
					<td class="num">查看</td>
				</thead>
				<c:forEach var="post" items="${postList}">
						<tr class='postlist'>
							<td>
								<a href="post.action?post.id=${post.id}" title="新窗口打开" target="_blank">
									<img src='${ post.user.avatar }' class='post-avatar'/>
								</a>
							</td>
							<th class="common">
								<a href="post.action?post.id=${post.id}" class="s xst post-title">【${post.topic.name}】${post.title}</a>
							</th>
							<td class="by">
								<a>${post.user.nickname}</a>
							</td>
							<td class="num">
								<span>${post.replyCount}</span>
							</td>
							<td class="num">
								<span>${post.viewCount}</span>
							</td>
						</tr>
				</c:forEach>
			</table>
	</div>
	<script>
	
	var list = document.getElementsByClassName('postlist');
	var title = document.getElementsByClassName('post-title');
	var content = document.getElementsByClassName('search-content')[0];
	var btn = document.getElementsByClassName('search-btn')[0];
	var table = document.getElementsByClassName('table')[0];
	var empty = document.getElementsByClassName('empty')[0]
	var key = decodeURI(location.hash.slice(1))
	var show = false
	content.value = key
	for(let i =0; i<list.length;i++){
		if(!title[i].innerText.includes(key)){
			list[i].style.display = 'none'
		}else{
			list[i].style.display = ''
			show = true
		}
		if(!show){
			table.style.display = 'none';
			empty.style.display='block'
		}else{
			table.style.display = '';
			empty.style.display='none'
		}
	}
	
	btn.onclick = function(){
		key = content.value
		show = false
		location.hash = '#'+key;
		for(let i =0; i<list.length;i++){
			if(!title[i].innerText.includes(key)){
				list[i].style.display = 'none'
			}else{
				list[i].style.display = ''
					show = true
			}
		}
		if(!show){
			table.style.display = 'none';
			empty.style.display='block'
		}else{
			table.style.display = '';
			empty.style.display='none'
		}
	}
	

</script>
</body>
</html>