package com.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Admin;
import com.service.AdminService;

@Namespace("/admin")
@Results({
	@Result(name="login", location="/admin/login.jsp"),
	@Result(name="index", location="/admin/index.jsp"),
	@Result(name="adminEdit", location="/admin/admin_edit.jsp"),
	@Result(name="readmin", type="redirect", location="index.action"),


})	
@SuppressWarnings("serial")
public class AdminAction extends BaseAction{
	
	private Admin admin;
	
	private String msg;
	
	@Autowired
	private AdminService adminService;
	
	
	
	/**
	 * 登录
	 * @return
	 */
	@Action("login")
	public String login(){
		Admin loginAdmin = adminService.get(admin.getUsername(), admin.getPassword(),admin.getRole());
		if (loginAdmin==null) {
			msg = "用户名或密码或身份错误";
			return "login";
		}
		// 将登录用户信息存入session
		getSession().setAttribute("admin", loginAdmin);
		/*if(admin.getRole()==1) {
			return "readmin"; // 重定向到管理首页	
		}else if(admin.getRole()==2){
			msg="登陆成功";
			return "s_admin";
		}else {
			return "m_admin";
		}*/
		return "readmin";
		
	}

	/**
	 * 后台首页
	 * @return
	 */
	@Action("index")
	public String index(){
		msg = "恭喜你! 登录成功了";
		return "index";
	}
	
	/**
	 * 管理员编辑
	 * @return
	 */
	@Action("adminEdit")
	public String adminEdit(){
		return "adminEdit";
	}
	
	/**
	 * 管理员更新
	 * @return
	 */
	@Action("adminUpdate")
	public String adminUpdate(){
		if (admin.getPassword()==null || admin.getPassword().trim().isEmpty()) {
			msg = "原密码不能为空";
			return "adminEdit";
		}
		if (!adminService.check(admin.getId(), admin.getPassword(),admin.getRole())) {
			msg = "原密码错误";
			return "adminEdit";
		}
		if(adminService.update(admin)){
			getSession().setAttribute("admin", adminService.get(admin.getId())); // 刷新session
			msg = "修改成功";
			return "adminEdit";
		}
		return null;
	}


	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
