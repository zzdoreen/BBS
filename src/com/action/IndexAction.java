package com.action;

import java.util.List;

import org.apache.catalina.User;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Module;
import com.entity.Post;
import com.entity.Reply;
import com.entity.Topic;
import com.entity.Users;
import com.service.ModuleService;
import com.service.PostService;
import com.service.ReplyService;
import com.service.TopicService;
import com.service.UserService;

@Namespace("/index")
@Results({
	@Result(name="index", location="/index/index.jsp"),
	@Result(name="login", location="/index/login.jsp"),
	@Result(name="register", location="/index/register.jsp"),
	@Result(name="module", location="/index/module.jsp"),
	@Result(name="topic", location="/index/topic.jsp"),
	@Result(name="post", location="/index/post.jsp"),
	@Result(name="msg", location="/index/msg.jsp"),
	@Result(name="user", location="/index/user.jsp"),
	@Result(name="edit", location="/index/userEdit.jsp"),
	@Result(name="home", location="/index/home.jsp"),
	@Result(name="remsg", type="redirect", location="msg.action", params={"msg", "${msg}", "reurl", "${reurl}"}),
})	
@SuppressWarnings("serial")
public class IndexAction extends BaseAction{
	
	private int flag;
	private String msg;
	private String reurl;
	
	private Users user;
	private Module module;
	private Topic topic;
	private Post post;
	private Reply reply;
	private List<Users> userList;
	private List<Topic> topicList;
	private List<Module> moduleList;
	private List<Post> postList;
	private List<Reply> replyList;
	
	@Autowired
	private UserService userService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private PostService postService;
	@Autowired
	private ReplyService replyService;
	
	/**
	 * 首页
	 * @return
	 */
	@Action("index")
	public String index(){
		moduleList = moduleService.getList(); // 全部模块
		for(Module module : moduleList){ // 获取个模块全部话题列表
 			module.setTopicList(topicService.packTopicList(topicService.getListByModuleid(module.getId())));
		}
		// 发帖数量
		servletRequest.setAttribute("todayCount", postService.getCountToday());
		servletRequest.setAttribute("allCount", postService.getTotal());
		// 最新会员
		servletRequest.setAttribute("lastUser", userService.getLastUser());
		servletRequest.setAttribute("userCount", userService.getTotal());
		return "index";
	}
	
	/**
	 * 注册
	 * @return
	 */
	@Action("register")
	public String register(){
		moduleList = moduleService.getList(); // 全部模块
		if (user.getUsername()==null || user.getUsername().trim().isEmpty()
				|| user.getPassword()==null || user.getPassword().trim().isEmpty()) {
			msg = "用户名和密码不可为空";
			return "register";
		}
		if (!user.getPassword().equals(user.getPasswordNew())) {
			msg = "两次密码输入不一致";
			return "register";
		}
		if (userService.get(user.getUsername()) != null) {
			msg = "用户已经存在";
			return "register";
		}
		if (userService.add(user)) { // 注册
			msg = "注册成功! 即将转入登录页面";
			reurl = "login.jsp";
			return "remsg";
		}
		return null;
	}
	
	/**
	 * 登录
	 * @return
	 */
	@Action("login")
	public String login(){
		moduleList = moduleService.getList(); // 全部模块
		Users loginUser = userService.get(user.getUsername(), user.getPassword());
		if (loginUser==null) {
			msg = "用户名或密码错误";
			return "login";
		}
		// 将登录用户信息存入session
		getSession().setAttribute("user", loginUser);
		msg = "登录成功! 即将转入论坛首页";
		reurl = "index.action";
		return "remsg";
	}
	
	/**
	 * 退出
	 * @return
	 */
	@Action("logout")
	public String logout(){
		getSession().removeAttribute("user"); // 将登录用户session信息清除
		msg = "退出成功! 即将转入论坛首页";
		reurl = "index.action";
		return "remsg";
	}
	
	
	
	/**
	 * 信息提示
	 * @return
	 */
	@Action("msg")
	public String msg(){
		moduleList = moduleService.getList(); // 全部模块
		return "msg";
	}

	/**
	 * 查看模块
	 * @return
	 */
	@Action("module")
	public String module(){
		moduleList = moduleService.getList(); // 全部模块
		module = moduleService.get(module.getId());
		topicList = topicService.packTopicList(topicService.getListByModuleid(module.getId()));
		return "module";
	}
	
	/**
	 * 查看话题
	 * @return
	 */
	@Action("topic")
	public String topic(){
		moduleList = moduleService.getList(); // 全部模块
		topic = topicService.get(topic.getId());
		postList = postService.packPostList(postService.getListByTopicid(topic.getId(), page, size));
		return "topic";
	}
	
	/**
	 * 查看帖子
	 * @return
	 */
	@Action("post")
	public String post() {
		moduleList = moduleService.getList(); // 全部模块
		post = postService.get(post.getId());
		replyList = replyService.getList(post.getId(), page, size);
		return "post";
	}
	
	/**
	 * 发帖
	 * @return
	 */
	@Action("send")
	public String send() {
		moduleList = moduleService.getList(); // 全部模块
		// 先判断是否登录
		Object loginUser = getSession().getAttribute("user");
		if (loginUser==null) {
			msg = "登录超时, 请重新登录";
			reurl = "login.jsp";
			return "remsg";
		}
		post.setUser((Users)loginUser);
		boolean flag = postService.add(post);
		msg = flag ? "发帖成功! 即将跳转到话题详情" : "发帖失败!  即将跳转到话题详情";
		reurl = "topic.action?topic.id=" + post.getTopic().getId();
		// 发帖后有积分变动, 所以需要刷新session中积分信息
		getSession().setAttribute("user", userService.get(post.getUser().getId())); 
		return "remsg";
	}
	
	/**
	 * 回帖
	 * @return
	 */
	@Action("reply")
	public String reply() {
		moduleList = moduleService.getList(); // 全部模块
		// 先判断是否登录
		Object loginUser = getSession().getAttribute("user");
		if (loginUser==null) {
			msg = "登录超时, 请重新登录";
			reurl = "login.jsp";
			return "remsg";
		}
		reply.setUser((Users)loginUser);
		boolean flag = replyService.add(reply);
		msg = flag ? "回复成功! 即将跳转到帖子详情" : "回复失败!  即将跳转到帖子详情";
		reurl = "post.action?post.id=" + reply.getPost().getId();
		// 回帖后有积分变动, 所以需要刷新session中积分信息
		getSession().setAttribute("user", userService.get(reply.getUser().getId())); 
		return "remsg";
	}
	
	//个人中心
	@Action("user")
	public String user(){
		moduleList = moduleService.getList(); // 全部模块
		postList = postService.getList();
		return "user";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("edit")
	public String edit(){
		moduleList = moduleService.getList();
		user = userService.get(user.getId());
		return "edit";
	}
	
	/**
	 * 更新
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("update")
	public String update(){
		userService.update(user);
		msg = "修改成功! 即将转入登陆页面";
		reurl = "login.jsp";
		return "remsg";
	}
	
	/**
	 * 用户主页
	 * @return
	 * */
	@Action("home")
	public String home(){
		moduleList = moduleService.getList();
		user = userService.get(user.getId());
		postList = postService.getList();
		return "home";
	}
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getReurl() {
		return reurl;
	}

	public void setReurl(String reurl) {
		this.reurl = reurl;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public List<Module> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<Module> moduleList) {
		this.moduleList = moduleList;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public List<Post> getPostList() {
		return postList;
	}

	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}

	public List<Post> getList() {
		return postList;
	}

	public void setList(List<Post> postList) {
		this.postList = postList;
	}
	
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}


}