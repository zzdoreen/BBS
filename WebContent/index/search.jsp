<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
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
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container" style="margin-top:170px">
	<div class='search-box'>
		<input type='search' class='form-control search-content' />
		<button class='btn btn-primary search-btn'><i class='glyphicon glyphicon-search'></i> &nbsp;&nbsp;搜索</button>
	</div>
	<img class='empty' src='images/empty.png' />
	<table class="table table-hover panel panel-default">
				<thead class='panel-heading'>
					<td colspan="2">标题</td>
					<td class="by">作者</td>
					<td class="num">回复</td>
					<td class="num">查看</td>
					<td class="by">最后回复</td>
				</thead>
				<c:forEach var="post" items="${postList}">
					<tbody id="post_${post.id}" class='postlist'>
						<tr>
							<td>
								<a href="post.action?post.id=${post.id}" title="新窗口打开" target="_blank">
									<img src='${ post.user.avatar }' class='post-avatar'/>
								</a>
							</td>
							<th class="common">
								<a href="post.action?post.id=${post.id}" class="s xst post-title">${post.title}</a>
							</th>
							<td class="by">
								<cite><a>${post.user.nickname}</a></cite>
								<em><span><span>${post.systimes}</span></span></em>
							</td>
							<td class="num">
								<a class="xi2">${post.replyCount}</a>
							</td>
							<td class="num">
								<em>${post.viewCount}</em>
							</td>
							<td class="by">
								<cite><a>${post.lastReply.user.nickname}</a></cite>
								<em><a><span>${post.lastReply.systimes}</span></a></em>
							</td>
						</tr>
					</tbody>
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