package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.entity.Module;
import com.entity.Users;
import com.util.SafeUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class UserService {

	@Autowired		//spring注入类对象
	private UserDao userDao;
	
	
	/**
	 * 验证用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	public Users get(String username){
		return userDao.selectByUsername(username);
	}

	/**
	 * 会员总数
	 * @return
	 */
	public long getTotal() {
		return userDao.selectTotal();
	}
	
	/**
	 * 验证用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	public Users get(String username, String password){
		Users user = userDao.selectByUsername(username);
		if (user!=null && user.getPassword().equals(SafeUtil.encode(password))) {
			return user;
		}
		return null;
	}
	
	/**
	 * 获取最后一个注册的用户
	 * @return
	 */
	public Users getLastUser() {
		return userDao.selectLast();
	}

	/**
	 * 通过id获取
	 * @param userid
	 * @return
	 */
	public Users get(int userid){
		return userDao.select(Users.class, userid);
	}
	
	/**
	 * 添加
	 * @param user
	 * @return
	 */
	public boolean add(Users user){
		user.setPassword(SafeUtil.encode(user.getPassword())); // 密码加密
		return userDao.insert(user) > 0; 
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Users> getList(int page, int size) {
		return userDao.selectList((page-1)*size, size);
	}
	
	public List<Users> getList() {
		return userDao.selectList();
	}
	
	/**
	 * 更新
	 * @param user
	 */
	public boolean update(Users user) {
		Users old = this.get(user.getId());
		old.setUsername(user.getUsername());
		old.setNickname(user.getNickname());
		old.setAvatar(user.getAvatar());
		old.setScore(user.getScore());
		old.setSex(user.getSex());
		old.setProvince(user.getProvince());
		if (!user.getPassword().trim().isEmpty()) {
			old.setPassword(SafeUtil.encode(user.getPassword()));
		}
		return userDao.update(old);
	}
	
	/**
	 * 删除 
	 * @param user
	 */
	public boolean delete(Users user) {
		return userDao.delete(user);
	}
}
