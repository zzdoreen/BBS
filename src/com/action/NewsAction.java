package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.News;
import com.service.NewsService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({ // 配置返回的具体页面
	@Result(name="newsList", location="/admin/news_list.jsp"),
	@Result(name="newsAdd", location="/admin/news_add.jsp"),
	@Result(name="newsEdit", location="/admin/news_edit.jsp"),
	@Result(name="renewsList", type="redirect", location="newsList.action"),
})
@SuppressWarnings("serial") // 为了消除serialVersionUID警告, 无业务意义
public class NewsAction extends BaseAction{
	
	private News news;
	private List<News> newsList;
	
	@Autowired
	private NewsService newsService;
	
	
	/**
	 * 列表
	 * @return
	 */
	@Action("newsList")
	public String newsList(){
		newsList = newsService.getList(page, size);
		pageHtml = PageUtil.getPageTool(servletRequest, newsService.getTotal(), page, size);
		return "newsList";
	}
	
	/**
	 * 添加
	 * @return
	 */
	@Action("newsAdd")
	public String newsAdd(){
		return "newsAdd";
	}
	
	/**
	 * 保存
	 * @return 
	 * 成功后重定向到列表页
	 */
	@Action("newsSave")
	public String newsSave(){
		newsService.save(news);
		return "renewsList";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("newsEdit")
	public String newsEdit(){
		news = newsService.get(news.getId());
		return "newsEdit";
	}
	
	/**
	 * 更新
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("newsUpdate")
	public String newsUpdate(){
		newsService.update(news);
		return "renewsList";
	}
	
	/**
	 * 删除
	 * @return
	 * 成功后重定向到列表页
	 */
	@Action("newsDelete")
	public String newsDelete(){
		newsService.delete(news);
		return "renewsList";
	}


	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	
}
