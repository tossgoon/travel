package com.jktech.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.GcComment;
import com.jktech.service.GcCommService;
import com.opensymphony.xwork2.ActionSupport;

public class GcCommAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -218920502651355578L;
	private GcComment gccomm = new GcComment();
	private GcCommService<GcComment> gcCommService;
	private List<GcComment> gccomms;
	private String tbtype;// 评论类型
	private int gcid;// 对应工程ID

	public GcCommAction() {
		// TODO Auto-generated constructor stub
	}

	public String query() {
		tbtype = getParam("tbtype");
		String gcidstr = getParam("gcid");
		if (gcidstr != null&&gcidstr!="") {
			gcid = Integer.parseInt(gcidstr);
			gccomms = gcCommService.queryGcComm(gcid, tbtype);
		}
		return SUCCESS;
	}

	public String add() {
		String result = "";
		try {
			String tbtype = getParam("tbtype");// 表类型
			String content = getParam("CommContent");// 内容
			int gcid = Integer.parseInt(getParam("gcid"));
			gccomm.setTbtype(tbtype);
			gccomm.setGcid(gcid);
			gccomm.setCommContent(content);
			gccomm.setCommDate(new Timestamp(new Date().getTime()));
			gcCommService.addGcComm(gccomm);
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			return ERROR;
		}
	}

	public String update() {
		try {
			Integer param = Integer.parseInt(getParam("param"));
			if (param == 0) {
				// 如果参数为0，证明是从所有列表点击了更新按钮，则跳转到update 页面
				Integer id = Integer.parseInt(getParam("id"));
				gccomm = gcCommService.getGcComm(GcComment.class, id);
				return SUCCESS;
			} else if (param == 1) {
				// 如果参数为1，当前在update页面，直接执行update操作
				gcCommService.updateGcComm(gccomm);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return query();
	}

	public String delete() {
		try {
			Integer id = Integer.parseInt(getParam("id"));
			gcCommService.deleteGcComm(id, GcComment.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query();
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public GcComment getGccomm() {
		return gccomm;
	}

	public void setGccomm(GcComment gccomm) {
		this.gccomm = gccomm;
	}

	@JSON(serialize = false)
	public GcCommService<GcComment> getGcCommService() {
		return gcCommService;
	}

	public void setGcCommService(GcCommService<GcComment> gcCommService) {
		this.gcCommService = gcCommService;
	}

	public List<GcComment> getGccomms() {
		return gccomms;
	}

	public void setGccomms(List<GcComment> gccomms) {
		this.gccomms = gccomms;
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
