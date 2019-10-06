package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ModuleDao;
import com.entity.Module;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class ModuleService {

	@Autowired		//spring注入类对象
	private ModuleDao moduleDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Module> getList() {
		return moduleDao.selectList();
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Module> getList(int page, int size) {
		return moduleDao.selectList((page-1)*size, size);
	}

	/**
	 * 获取总数
	 * @return
	 */
	public int getTotal() {
		return (int) moduleDao.selectCount();
	}
	
	/**
	 * 获取
	 * @param module
	 * @return
	 */
	public Module get(int id) {
		return moduleDao.select(Module.class, id);
	}

	/**
	 * 保存
	 * @param module
	 */
	public boolean save(Module module) {
		return moduleDao.insert(module) > 0;
	}

	/**
	 * 更新
	 * @param module
	 */
	public boolean update(Module module) {
		return moduleDao.update(module);
	}
	
	/**
	 * 删除
	 * @param module
	 */
	public boolean delete(Module module) {
		return moduleDao.delete(module);
	}

}
