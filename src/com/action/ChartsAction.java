package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Module;
import com.entity.Post;
import com.entity.Topic;
import com.entity.Users;
import com.service.ModuleService;
import com.service.PostService;
import com.service.TopicService;
import com.service.UserService;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="chartsList", location="/admin/charts.jsp"),
})
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class ChartsAction extends BaseAction{
	
	private Users user;
	private Module module;
	private Post post;
	private Topic topic;
	private List<Users> userList;
	private List<Module> moduleList;
	private List<Post> postList;
	private List<Topic> topicList;
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private TopicService topicService;
	
	/**
	 * 列表
	 * @return
	 */
	@Action("chartsList")
	public String chartsList(){
		userList = userService.getList();
		moduleList = moduleService.getList();
		for(Module module : moduleList){ // 获取个模块全部话题列表
 			module.setTopicList(topicService.packTopicList(topicService.getListByModuleid(module.getId())));
		}
		// 发帖数量
		servletRequest.setAttribute("todayCount", postService.getCountToday());
		servletRequest.setAttribute("allCount", postService.getTotal());
		// 最新会员
		servletRequest.setAttribute("lastUser", userService.getLastUser());
		servletRequest.setAttribute("userCount", userService.getTotal());
		
		return "chartsList";
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Users> getUserList() {
		return userList;
	}

	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public List<Module> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<Module> moduleList) {
		this.moduleList = moduleList;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ModuleService getModuleService() {
		return moduleService;
	}

	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public List<Post> getPostList() {
		return postList;
	}

	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}

	public PostService getPostService() {
		return postService;
	}

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}
	

	
}
