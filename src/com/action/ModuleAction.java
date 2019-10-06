package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Module;
import com.service.ModuleService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="moduleList", location="/admin/module_list.jsp"),
	@Result(name="moduleAdd", location="/admin/module_add.jsp"),
	@Result(name="moduleEdit", location="/admin/module_edit.jsp"),
	@Result(name="remoduleList", type="redirect", location="moduleList.action"),
})	
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class ModuleAction extends BaseAction{
	
	private Module module;
	private List<Module> moduleList;
	
	@Autowired
	private ModuleService moduleService;
	
	
	/**
	 * 列表
	 * @return
	 */
	@Action("moduleList")
	public String moduleList(){
		moduleList = moduleService.getList(page, size);
		pageHtml = PageUtil.getPageTool(servletRequest, moduleService.getTotal(), page, size);
		return "moduleList";
	}
	
	/**
	 * 添加
	 * @return
	 */
	@Action("moduleAdd")
	public String moduleAdd(){
		return "moduleAdd";
	}
	
	/**
	 * 保存
	 * @return 
	 * 成功后重定向到列表页
	 */
	@Action("moduleSave")
	public String moduleSave(){
		moduleService.save(module);
		return "remoduleList";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("moduleEdit")
	public String moduleEdit(){
		module = moduleService.get(module.getId());
		return "moduleEdit";
	}
	
	/**
	 * 更新
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("moduleUpdate")
	public String moduleUpdate(){
		moduleService.update(module);
		return "remoduleList";
	}
	
	/**
	 * 删除
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("moduleDelete")
	public String moduleDelete(){
		moduleService.delete(module);
		return "remoduleList";
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
	
}
