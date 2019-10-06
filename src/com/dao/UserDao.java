package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Users;

@Repository // 注册dao层bean等同于@Component
public class UserDao extends BaseDao{

	
	/**
	 * 通过用户名查询
	 * @param username
	 * @return 无记录返回null
	 */
	public Users selectByUsername(String username){
		return getSession().createQuery("from Users where username=:username", Users.class)
				.setParameter("username", username).setMaxResults(1).uniqueResult();
	}
	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Users> selectList(int begin, int size){
		return getSession().createQuery("from Users order by id desc", Users.class)
				.setFirstResult(begin).setMaxResults(size).list();
	}
	
	/**
	 * 获取总数
	 * @return
	 */
	public long selectTotal(){
		return getSession().createQuery("select count(*) from Users", Long.class).uniqueResult();
	}

	
	/**
	 * 获取最后一个用户
	 * @return
	 */
	public Users selectLast() {
		return getSession().createQuery("from Users order by id desc", Users.class)
				.setFirstResult(1).setMaxResults(1).uniqueResult();
	}
	
	/**
	 * 更新积分
	 * @param userid
	 * @param score
	 * @return
	 */
	public boolean updateScore(int userid, int score) {
		return getSession().createQuery("update Users set score=score+:score where id=:userid")
				.setParameter("userid", userid).setParameter("score", score).executeUpdate() > 0;
	}
	
}
