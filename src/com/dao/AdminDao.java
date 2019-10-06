package com.dao;

import org.springframework.stereotype.Repository;

import com.entity.Admin;

@Repository // 注册dao层bean等同于@Component
public class AdminDao extends BaseDao{

	
	/**
	 * 通过用户名查询
	 * @param username
	 * @return 无记录返回null
	 */
	public Admin selectByUsername(String username){
		return getSession().createQuery("from Admin where username=:username", Admin.class)
				.setParameter("username", username).uniqueResult();
	}
	
}
