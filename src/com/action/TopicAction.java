package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Module;
import com.entity.Topic;
import com.service.ModuleService;
import com.service.TopicService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="topicList", location="/admin/topic_list.jsp"),
	@Result(name="topicAdd", location="/admin/topic_add.jsp"),
	@Result(name="topicEdit", location="/admin/topic_edit.jsp"),
	@Result(name="retopicList", type="redirect", location="topicList.action?moduleid=${moduleid}"),
})	
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class TopicAction extends BaseAction{
	
	private int moduleid;
	private Topic topic;
	private List<Topic> topicList;
	private List<Module> moduleList;
	
	@Autowired
	private TopicService topicService;
	@Autowired
	private ModuleService moduleService;
	
	
	/**
	 * 列表
	 * @return
	 */
	@Action("topicList")
	public String topicList(){
		if (moduleid > 0) { // 按版块查询
			topicList = topicService.getListByModuleid(moduleid, page, size);
			pageHtml = PageUtil.getPageTool(servletRequest, topicService.getTotalByModuleid(moduleid), page, size);
		}else{ // 全部
			topicList = topicService.getList(page, size);
			pageHtml = PageUtil.getPageTool(servletRequest, topicService.getTotal(), page,size);
		}
		moduleList = moduleService.getList(); // 获取全部
		return "topicList";
	}
	
	/**
	 * 添加
	 * @return
	 */
	@Action("topicAdd")
	public String topicAdd(){
		moduleList = moduleService.getList(); // 获取全部
		return "topicAdd";
	}
	
	/**
	 * 保存
	 * @return 
	 * 成功后重定向到列表页
	 */
	@Action("topicSave")
	public String topicSave(){
		topicService.save(topic);
		return "retopicList";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("topicEdit")
	public String topicEdit(){
		moduleList = moduleService.getList(); // 获取全部
		topic = topicService.get(topic.getId());
		return "topicEdit";
	}
	
	/**
	 * 更新
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("topicUpdate")
	public String topicUpdate(){
		topicService.update(topic);
		return "retopicList";
	}
	
	/**
	 * 删除
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("topicDelete")
	public String topicDelete(){
		topicService.delete(topic);
		return "retopicList";
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

	public List<Module> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<Module> moduleList) {
		this.moduleList = moduleList;
	}

	public int getModuleid() {
		return moduleid;
	}

	public void setModuleid(int moduleid) {
		this.moduleid = moduleid;
	}
	
}
