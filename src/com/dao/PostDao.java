package com.dao;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Repository;

import com.entity.Module;
import com.entity.Post;

@Repository // 注册dao层bean等同于@Component
public class PostDao extends BaseDao{

	public List<Post> selectList() {
		return getSession().createQuery("from Post order by id desc", Post.class).list();
	}
	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 */
	public List<Post> selectList(int begin, int size) {
		return getSession().createQuery("from Post order by id desc", Post.class)
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取数量
	 * @return
	 */
	public long selectCount(){
		return getSession().createQuery("select count(*) from Post", Long.class).uniqueResult();
	}
	
	/**
	 * 通过topicid获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Post> selectListByTopicid(int topicid, int begin, int size) {
		return getSession().createQuery("from Post where topic.id=:topicid order by id desc", Post.class)
				.setParameter("topicid", topicid).setFirstResult(begin).setMaxResults(size).list();
	}
	
	/**
	 * 通过topicid获取总数
	 * @return
	 */
	public long selectCountByTopicid(int topicid){
		return getSession().createQuery("select count(*) from Post where topic.id=:topicid", Long.class)
				.setParameter("topicid", topicid).uniqueResult();
	}
	
	/**
	 * 通过topicid获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Post> selectListByModuleid(int moduleid, int begin, int size) {
		return getSession().createQuery("from Post where topic_id in (select id from Topic where module_id=:moduleid) order by id desc", Post.class)
				.setParameter("moduleid", moduleid).setFirstResult(begin).setMaxResults(size).list();
	}
	
	/**
	 * 通过moduleid获取总数
	 * @return
	 */
	public long selectCountByModuleid(int moduleid){
		return getSession().createQuery("select count(*) from Post where topic.id in (select id from Topic where module_id=:moduleid)", Long.class)
				.setParameter("moduleid", moduleid).uniqueResult();
	}
	
	/**
	 * 新增 
	 * 通过userid获取数据
	 * @return
	 */
	public long selectCountByUserid(int userid){
		return getSession().createQuery("select count(*) from Post where user_id=:userid)", Long.class)
				.setParameter("userid", userid).uniqueResult();
	}

	/**
	 * 获取今日发帖数量
	 * @return
	 */
	public long selectCountToday() {
		return getSession().createQuery("select count(*) from Post where date(systime)=date(now())", Long.class).uniqueResult();
	}

	/**
	 * 通过topicid获取最后一条
	 * @param id
	 * @return
	 */
	public Post selectLastByTopicId(int topicid) {
		return getSession().createQuery("from Post where topic.id=:topicid order by id desc", Post.class)
				.setParameter("topicid", topicid).setMaxResults(1).uniqueResult();
	}

	/**
	 * 获取查看总数
	 * @param topicid
	 * @return
	 */
	public long selectSumViewCountByTopicid(int topicid) {
		List<Long> list = getSession().createQuery("select sum(viewCount) from Post where topic.id=:topicid", Long.class)
				.setParameter("topicid", topicid).list();
		return Objects.isNull(list) || Objects.isNull(list.get(0)) ? 0 : list.get(0);
	}

	/**
	 * 获取回复总数
	 * @param topicid
	 * @return
	 */
	public long selectSumReplyCountByTopicid(int topicid) {
		List<Long> list = getSession().createQuery("select sum(replyCount) from Post where topic.id=:topicid", Long.class)
				.setParameter("topicid", topicid).list();
		return Objects.isNull(list) || Objects.isNull(list.get(0)) ? 0 : list.get(0);
	}

	/**
	 * 更新查看数量
	 * @param id
	 */
	public boolean updateViewCount(int id) {
		return getSession().createQuery("update Post set viewCount=viewCount+1 where id=:id")
				.setParameter("id", id).executeUpdate() > 0;
	}
	
	/**
	 * 查看回复数量
	 * @param id
	 */
	public boolean updateReplyCount(int id, int count) {
		return getSession().createQuery("update Post set replyCount=replyCount+:count where id=:id")
				.setParameter("id", id).setParameter("count", count).executeUpdate() > 0;
	}
	
}
