package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Module;
import com.entity.Post;
import com.entity.Reply;
import com.entity.Topic;
import com.service.ModuleService;
import com.service.PostService;
import com.service.ReplyService;
import com.service.TopicService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="postList", location="/admin/post_list.jsp"),
	@Result(name="replyList", location="/admin/reply_list.jsp"),
	@Result(name="repostList", type="redirect", location="postList.action?moduleid=${moduleid}&topicid=${topicid}"),
	@Result(name="rereplyList", type="redirect", location="replyList.action?post.id=${post.id}&moduleid=${moduleid}&topicid=${topicid}"),
})	
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class PostAction extends BaseAction{
	
	private int moduleid;
	private int topicid;
	private Post post;
	private Reply reply;
	private List<Post> postList;
	private List<Reply> replyList;
	private List<Topic> topicList;
	private List<Module> moduleList;
	
	@Autowired
	private PostService postService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private ModuleService moduleService;
	
	
	/**
	 * 列表
	 * @return
	 */
	@Action("postList")
	public String postList(){
		if (moduleid>0 && topicid>0) { // 按话题查询
			postList = postService.getListByTopicid(topicid, page, size);
			pageHtml = PageUtil.getPageTool(servletRequest, postService.getTotalByTopicid(topicid), page, size);
			topicList = topicService.getListByModuleid(moduleid); // 话题列表
		}else if(moduleid>0){ // 按版块查询 
			postList = postService.getListByModuleid(moduleid, page, size);
			pageHtml = PageUtil.getPageTool(servletRequest, postService.getTotalByModuleid(moduleid), page, size);
			topicList = topicService.getListByModuleid(moduleid); // 话题列表
		}else{ // 全部
			postList = postService.getList(page, size);
			pageHtml = PageUtil.getPageTool(servletRequest, postService.getTotal(), page, size);
		}
		moduleList = moduleService.getList(); // 获取全部
		return "postList";
	}
	
	/**
	 * 删除
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("postDelete")
	public String postDelete(){
		postService.delete(post);
		return "repostList";
	}

	
	/**
	 * 回复列表
	 * @return
	 */
	@Action("replyList")
	public String replyList() {
		post = postService.get(post.getId());
		replyList = replyService.getList(post.getId(), page, size);
		pageHtml = PageUtil.getPageTool(servletRequest, replyService.getTotal(post.getId()), page, size);
		topicList = topicService.getListByModuleid(moduleid); // 话题列表
		moduleList = moduleService.getList(); // 获取全部
		return "replyList";
	}
	
	/**
	 * 删除回复
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("replyDelete")
	public String replyDelete() {
		reply.setPost(post);
		replyService.delete(reply);
		return "rereplyList";
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

	public List<Module> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<Module> moduleList) {
		this.moduleList = moduleList;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public int getModuleid() {
		return moduleid;
	}

	public void setModuleid(int moduleid) {
		this.moduleid = moduleid;
	}

	public int getTopicid() {
		return topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
}
