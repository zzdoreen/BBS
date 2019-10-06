package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Reply;

@Repository // 注册dao层bean等同于@Component
public class ReplyDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param blogid
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Reply> selectList(int postid, int begin, int size) {
		return getSession().createQuery("from Reply where post.id=:postid", Reply.class)
				.setParameter("postid", postid).setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取数量
	 * @param blogid
	 * @return
	 */
	public long selectCount(int postid) {
		return getSession().createQuery("select count(*) from Reply where post.id=:postid", Long.class)
				.setParameter("postid", postid).uniqueResult();
	}

	/**
	 * 获取最后一条回复信息
	 * @param id
	 * @return
	 */
	public Reply selectLastByPostid(int postid) {
		return getSession().createQuery("from Reply where post.id=:postid order by id desc", Reply.class)
				.setParameter("postid", postid).setMaxResults(1).uniqueResult();
	}
	
}
