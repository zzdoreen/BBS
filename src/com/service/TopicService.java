package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.PostDao;
import com.dao.TopicDao;
import com.entity.Topic;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class TopicService {

	@Autowired		//spring注入类对象
	private TopicDao topicDao;
	@Autowired
	private PostDao postDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Topic> getList(int page, int size) {
		return topicDao.selectList((page-1)*size, size);
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long getTotal() {
		return topicDao.selectCount();
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Topic> getListByModuleid(int moduleid) {
		return topicDao.selectListByModuleid(moduleid);
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Topic> getListByModuleid(int moduleid, int page, int size) {
		return topicDao.selectListByModuleid(moduleid, (page-1)*size, size);
	}
	
	/**
	 * 获取总数
	 * @return
	 */
	public long getTotalByModuleid(int moduleid) {
		return topicDao.selectCountByModuleid(moduleid);
	}
	
	/**
	 * 获取
	 * @param topic
	 * @return
	 */
	public Topic get(int id) {
		return topicDao.select(Topic.class, id);
	}

	/**
	 * 保存
	 * @param topic
	 */
	public boolean save(Topic topic) {
		return topicDao.insert(topic) > 0;
	}

	/**
	 * 更新
	 * @param topic
	 */
	public boolean update(Topic topic) {
		return topicDao.update(topic);
	}
	
	/**
	 * 删除
	 * @param topic
	 */
	public boolean delete(Topic topic) {
		return topicDao.delete(topic);
	}
	
	/**
	 * 封装话题下最后一条发帖
	 * @param topicList
	 * @return
	 */
	public List<Topic> packTopicList(List<Topic> topicList) {
		for(Topic topic : topicList) {
			int topicid = topic.getId();
			topic.setLastPost(postDao.selectLastByTopicId(topicid));
			topic.setPostTotal(postDao.selectCountByTopicid(topicid));
			topic.setViewCount(postDao.selectSumViewCountByTopicid(topicid));
			topic.setReplyCount(postDao.selectSumReplyCountByTopicid(topicid));
		}
		return topicList;
	}

}
