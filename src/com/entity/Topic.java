package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity // 注解为hibernate实体
@Table(name="topic") // 注解对应的表名
public class Topic {
	
	@Id	// 注解主键
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int id;
	private String name;
	private String intro;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Module module;
	@Transient // 注解不作为数据库字段
	private Post lastPost; // 最后发帖
	@Transient // 注解不作为数据库字段
	private long postTotal; // 发帖总数
	@Transient // 注解不作为数据库字段
	private long viewCount; // 所有帖子被查看总数
	@Transient // 注解不作为数据库字段
	private long replyCount; // 所有帖子被回复总数
	

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Post getLastPost() {
		return lastPost;
	}
	public void setLastPost(Post lastPost) {
		this.lastPost = lastPost;
	}
	public long getPostTotal() {
		return postTotal;
	}
	public void setPostTotal(long postTotal) {
		this.postTotal = postTotal;
	}
	public long getViewCount() {
		return viewCount;
	}
	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}
	public long getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(long replyCount) {
		this.replyCount = replyCount;
	}

}
