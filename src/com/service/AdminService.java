package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AdminDao;
import com.entity.Admin;
import com.util.SafeUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class AdminService {

	@Autowired		//spring注入类对象
	private  AdminDao adminDao;
	
	
	/**
	 * 通过id获取
	 * @param userid
	 * @return
	 */
	public Admin get(int id){
		return adminDao.select(Admin.class, id);
	}
	
	
	/**
	 * 通过用户名和密码获取
	 * @param userid
	 * @return
	 */
	public Admin get(String username, String password,int role){
		Admin admin = adminDao.selectByUsername(username);
		if (admin!=null && admin.getPassword().equals(SafeUtil.encode(password))&& (admin.getRole()==role)) {
			return admin;
		}
		return null;
	}
	
	/**
	 * 检测密码
	 * @param id
	 * @param password
	 * @return
	 */
	public boolean check(int id, String password,int role){
		Admin admin = adminDao.select(Admin.class, id);
		return admin!=null && admin.getPassword().equals(SafeUtil.encode(password))&& (admin.getRole()==role);
	}
	
	/**
	 * 更新密码
	 * @param id
	 * @param password
	 * @return
	 */
	public boolean update(Admin admin){
		Admin oldAdmin = adminDao.select(Admin.class, admin.getId());
		oldAdmin.setUsername(admin.getUsername());
		oldAdmin.setPassword(SafeUtil.encode(admin.getPasswordNew()));
		return adminDao.update(oldAdmin);
	}
	
}
