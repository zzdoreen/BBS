package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Module;

@Repository // 注册dao层bean等同于@Component
public class ModuleDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Module> selectList() {
		return getSession().createQuery("from Module order by id desc", Module.class).list();
	}
	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Module> selectList(int begin, int size) {
		return getSession().createQuery("from Module order by id desc", Module.class)
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long selectCount() {
		return getSession().createQuery("select count(*) from Module", Long.class).uniqueResult();
	}

	
}