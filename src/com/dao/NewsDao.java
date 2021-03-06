package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.News;

@Repository // 注册dao层bean等同于@Component
public class NewsDao extends BaseDao{
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<News> selectList() {
		return getSession().createQuery("from News order by id desc", News.class).list();
	}
	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<News> selectList(int begin, int size) {
		return getSession().createQuery("from News order by id desc", News.class)
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long selectCount() {
		return getSession().createQuery("select count(*) from News", Long.class).uniqueResult();
	}

}
