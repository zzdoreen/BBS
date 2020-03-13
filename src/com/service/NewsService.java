package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.NewsDao;
import com.entity.News;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class NewsService {
	@Autowired		//spring注入类对象
	private NewsDao newsDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<News> getList() {
		return newsDao.selectList();
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<News> getList(int page, int size) {
		return newsDao.selectList((page-1)*size, size);
	}

	/**
	 * 获取总数
	 * @return
	 */
	public int getTotal() {
		return (int) newsDao.selectCount();
	}
	
	/**
	 * 获取
	 * @param news
	 * @return
	 */
	public News get(int id) {
		return newsDao.select(News.class, id);
	}

	/**
	 * 保存
	 * @param news
	 */
	public boolean save(News news) {
		return newsDao.insert(news) > 0;
	}

	/**
	 * 更新
	 * @param news
	 */
	public boolean update(News news) {
		return newsDao.update(news);
	}
	
	/**
	 * 删除
	 * @param news
	 */
	public boolean delete(News news) {
		return newsDao.delete(news);
	}

}
