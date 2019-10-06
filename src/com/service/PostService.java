package com.service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.PostDao;
import com.dao.ReplyDao;
import com.dao.UserDao;
import com.entity.Post;
import com.entity.Reply;
import com.util.DateUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class PostService {

	@Autowired	//spring注入类对象
	private PostDao postDao;
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private UserDao userDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 */
	public List<Post> getList(int page, int size) {
		return packPost(postDao.selectList((page-1)*size, size));
	}

	/**
	 * 获取总数
	 */
	public long getTotal() {
		return postDao.selectCount();
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 */
	public List<Post> getListByTopicid(int topicid, int page, int size) {
		return packPost(postDao.selectListByTopicid(topicid, (page-1)*size, size));
	}
	
	/**
	 * 获取总数
	 */
	public long getTotalByTopicid(int topicid) {
		return postDao.selectCountByTopicid(topicid);
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 */
	public List<Post> getListByModuleid(int moduleid, int page, int size) {
		return packPost(postDao.selectListByModuleid(moduleid, (page-1)*size, size));
	}
	
	/**
	 * 获取总数
	 */
	public long getTotalByModuleid(int moduleid) {
		return postDao.selectCountByModuleid(moduleid);
	}

	/**
	 * 获取今日发帖数量
	 */
	public long getCountToday() {
		return postDao.selectCountToday();
	}

	/**
	 * 获取
	 * @param id
	 * @return
	 */
	public Post get(int id) {
		postDao.updateViewCount(id); // 记录查看次数
		return packPost(postDao.select(Post.class, id));
	}

	/**
	 * 添加
	 * @param post
	 */
	public boolean add(Post post) {
		userDao.updateScore(post.getUser().getId(), 2); // 发帖+2分
		post.setSystime(new Date());
		return postDao.insert(post) > 0;
	}
	
	/**
	 * 更新
	 * @param post
	 */
	public boolean update(Post post) {
		post.setSystime(new Date());
		return postDao.update(post);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public boolean delete(Post post) {
		return postDao.delete(post);
	}
	
	
	/**
	 * 封装信息
	 * @param postList
	 */
	private List<Post> packPost(List<Post> postList){
		for(Post post : postList) {
			post = packPost(post);
		}
		return postList;
	}

	/**
	 * 封装信息
	 * @param post
	 */
	private Post packPost(Post post) {
		post.setSystimes(DateUtil.format(post.getSystime()));
		return post;
	}

	/**
	 * 封装信息
	 * @param listByTopicid
	 * @return
	 */
	public List<Post> packPostList(List<Post> postList) {
		for(Post post : postList) {
			Reply reply = replyDao.selectLastByPostid(post.getId());
			if (Objects.nonNull(reply)) {
				reply.setSystimes(DateUtil.format(reply.getSystime()));
				post.setLastReply(reply);
			}
		}
		return postList;
	}
	
}
