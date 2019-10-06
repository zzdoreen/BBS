package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity // 注解为hibernate实体
@Table(name="reply") // 注解对应的表名
public class Reply {
	
	@Id	// 注解主键
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int id;
	private String content;
	private Date systime;	
	@Transient // 注解不作为数据库字段
	private String systimes;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Post post;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Users user;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSystime() {
		return systime;
	}
	public void setSystime(Date systime) {
		this.systime = systime;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public String getSystimes() {
		return systimes;
	}
	public void setSystimes(String systimes) {
		this.systimes = systimes;
	}
	
}
