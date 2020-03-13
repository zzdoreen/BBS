window.onload = function(){
	// 添加
	var addBtn = document.getElementById('addBtn')
	var addForm = document.getElementById('addForm')
	var resetBtn = document.getElementById('resetBtn')
	
	addBtn.onclick = function () {
		addForm.style.display = 'block'
	}
	resetBtn.onclick = function(){
		addForm.style.display = 'none'
	}
}
