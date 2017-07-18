package com.jktech.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.GcAttach;
import com.jktech.pojo.GcComment;
import com.jktech.service.GcAttachService;
import com.jktech.service.GcCommService;
import com.opensymphony.xwork2.ActionSupport;

public class GcAttachAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 381113934599728654L;
	/**
	 * 
	 */
	private GcAttach gcAttach = new GcAttach();
	private GcAttachService<GcAttach> gcAttachService;
	private List<GcAttach> gcAttachs;
	private String tbtype;// 评论类型
	private int gcid;// 对应工程ID

	public GcAttachAction() {
		// TODO Auto-generated constructor stub
	}

	public String query() {
		tbtype = getParam("tbtype");
		String gcidstr = getParam("gcid");
		if (gcidstr != null&&gcidstr!="") {
			gcid = Integer.parseInt(gcidstr);
			gcAttachs = gcAttachService.queryGcAttach(gcid, tbtype);
		}
		return SUCCESS;
	}

	public String add() {
		String result = "";
		try {
			String tbtype = getParam("tbtype");// 表类型
			String filename = getParam("fileName");// 文件内容
			String attType = getParam("fileType");// 文件类型
			int gcid = Integer.parseInt(getParam("gcid"));// 工程ID
			gcAttach.setAtttype(attType);
			gcAttach.setFilename(filename);
			gcAttach.setTbtype(tbtype);
			gcAttach.setGcid(gcid);
			gcAttach.setShangchuandate(new Timestamp(new Date().getTime()));
			gcAttachService.addGcAttach(gcAttach);
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public String update() {
		try {
			Integer param = Integer.parseInt(getParam("param"));
			if (param == 0) {
				// 如果参数为0，证明是从所有列表点击了更新按钮，则跳转到update 页面
				Integer id = Integer.parseInt(getParam("id"));
				gcAttach = gcAttachService.getGcAttach(GcAttach.class, id);
				return SUCCESS;
			} else if (param == 1) {
				// 如果参数为1，当前在update页面，直接执行update操作
				gcAttachService.updateGcAttach(gcAttach);
				//
				//HttpServletResponse response=ServletActionContext.getResponse();
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return query();
	}

	public String delete() {
		try {
			Integer id = Integer.parseInt(getParam("attid"));
			gcAttachService.deleteAttach(id, GcAttach.class);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public GcAttach getGcAttach() {
		return gcAttach;
	}

	public void setGcAttach(GcAttach gcAttach) {
		this.gcAttach = gcAttach;
	}

	@JSON(serialize = false)
	public GcAttachService<GcAttach> getGcAttachService() {
		return gcAttachService;
	}

	public void setGcAttachService(GcAttachService<GcAttach> gcAttachService) {
		this.gcAttachService = gcAttachService;
	}

	public List<GcAttach> getGcAttachs() {
		return gcAttachs;
	}

	public void setGcAttachs(List<GcAttach> gcAttachs) {
		this.gcAttachs = gcAttachs;
	}

	public String getTbtype() {
		return tbtype;
	}

	public void setTbtype(String tbtype) {
		this.tbtype = tbtype;
	}

	public int getGcid() {
		return gcid;
	}

	public void setGcid(int gcid) {
		this.gcid = gcid;
	}
}
