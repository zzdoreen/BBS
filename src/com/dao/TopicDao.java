package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Topic;

@Repository // 注册dao层bean等同于@Component
public class TopicDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Topic> selectList(int begin, int size) {
		return getSession().createQuery("from Topic order by id desc", Topic.class)
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long selectCount() {
		return getSession().createQuery("select count(*) from Topic", Long.class).uniqueResult();
	}
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Topic> selectListByModuleid(int moduleid) {
		return getSession().createQuery("from Topic where module_id=:moduleid order by id desc", Topic.class)
				.setParameter("moduleid", moduleid).list();
	}
	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Topic> selectListByModuleid(int moduleid, int begin, int size) {
		return getSession().createQuery("from Topic where module_id=:moduleid order by id desc", Topic.class)
				.setParameter("moduleid", moduleid).setFirstResult(begin).setMaxResults(size).list();
	}
	
	/**
	 * 获取总数
	 * @return
	 */
	public long selectCountByModuleid(int moduleid) {
		return getSession().createQuery("select count(*) from Topic where module_id=:moduleid", Long.class)
				.setParameter("moduleid", moduleid).uniqueResult();
	}
	
	
}
