package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Users;
import com.service.UserService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="userList", location="/admin/user_list.jsp"),
	@Result(name="userAdd", location="/admin/user_add.jsp"),
	@Result(name="userEdit", location="/admin/user_edit.jsp"),
	@Result(name="reuserList", type="redirect", location="userList.action"),
})	
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class UserAction extends BaseAction{
	
	private Users user;
	private List<Users> userList;
	
	@Autowired
	private UserService userService;
	
	
	/**
	 * 列表
	 * @return
	 */
	@Action("userList")
	public String userList(){
		userList = userService.getList(page, size);
		pageHtml = PageUtil.getPageTool(servletRequest, userService.getTotal(), page, size);
		return "userList";
	}
	
	/**
	 * 添加
	 * @return
	 */
	@Action("userAdd")
	public String userAdd(){
		return "userAdd";
	}
	
	/**
	 * 保存
	 * @return 
	 * 成功后重定向到列表页
	 */
	@Action("userSave")
	public String userSave(){
		if (userService.get(user.getUsername()) != null) {
			servletRequest.setAttribute("msg", "用户已经存在");
			return "userAdd";
		}
		userService.add(user);
		return "reuserList";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("userEdit")
	public String userEdit(){
		user = userService.get(user.getId());
		return "userEdit";
	}
	
	/**
	 * 更新
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("userUpdate")
	public String userUpdate(){
		userService.update(user);
		return "reuserList";
	}
	
	/**
	 * 删除
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("userDelete")
	public String userDelete(){
		userService.delete(user);
		return "reuserList";
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Users> getUserList() {
		return userList;
	}

	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}

	
}
