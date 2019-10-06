package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.PostDao;
import com.dao.ReplyDao;
import com.dao.UserDao;
import com.entity.Reply;
import com.util.DateUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class ReplyService {

	@Autowired		//spring注入类对象
	private ReplyDao replyDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private UserDao userDao;

	
	/**
	 * 获取列表
	 * @param postid
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Reply> getList(int postid, int page, int size) {
		return packReply(replyDao.selectList(postid, (page-1)*size, size));
	}
	
	/**
	 * 获取数量
	 * @param postid
	 * @return
	 */
	public long getTotal(int postid){
		return replyDao.selectCount(postid);
	}

	/**
	 * 添加评论
	 * @param reply
	 */
	public boolean add(Reply reply) {
		userDao.updateScore(reply.getUser().getId(), 1); // 回帖+1分
		postDao.updateReplyCount(reply.getPost().getId(), 1); // 记录回复次数
		reply.setSystime(new Date());
		return replyDao.insert(reply) > 0;
	}
	
	/**
	 * 删除评论
	 * @param reply
	 * @return
	 */
	public boolean delete(Reply reply){
		postDao.updateReplyCount(reply.getPost().getId(), -1); // 记录回复次数
		return replyDao.delete(reply);
	}
	
	/**
	 * 封装信息
	 * @param postList
	 */
	private List<Reply> packReply(List<Reply> replyList){
		for(Reply reply : replyList) {
			reply = packReply(reply);
		}
		return replyList;
	}

	/**
	 * 封装信息
	 * @param post
	 */
	private Reply packReply(Reply reply) {
		reply.setSystimes(DateUtil.format(reply.getSystime()));
		return reply;
	}

}
