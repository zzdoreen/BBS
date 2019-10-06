package com.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

/**
 * action基类, 继承自ActionSupport类  
 * 提供分页工具变量等
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport implements ServletRequestAware {
	
	protected int page = 1; // 当前页码
	protected int size = 6; // 默认每页数量
	protected String pageHtml;
	protected HttpSession session;
	protected HttpServletRequest servletRequest;


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getPageHtml() {
		return pageHtml;
	}

	public void setPageHtml(String pageHtml) {
		this.pageHtml = pageHtml;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	
	//用于在子类中获取session对象
	protected HttpSession getSession(){
		return this.servletRequest.getSession();
	}
	
	/**
	 * 返回响应数据
	 * @param msg
	 */
	protected void sendResponseMsg(String msg) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.addHeader("Cache-Control", "must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setDateHeader("Expires", 0);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(msg);
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

}
