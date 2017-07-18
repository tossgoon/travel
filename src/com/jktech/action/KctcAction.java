package com.jktech.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.Kcgc;
import com.jktech.pojo.Kctc;
import com.jktech.service.KctcService;
import com.opensymphony.xwork2.ActionSupport;

public class KctcAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -811560387401578050L;
	private Kctc kctc = new Kctc();
	private KctcService<Kctc> kctcService;

	private List<Kctc> kctcList;

	public KctcAction() {
		// TODO Auto-generated constructor stub
	}

	public String query() {
		try {
			Integer zkid = Integer.parseInt(getParam("zkid"));
			kctcList = kctcService.queryKctcByZkid(zkid);
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
	}

	public List<Kctc> getKctcList() {
		return kctcList;
	}

	public void setKctcList(List<Kctc> kctcList) {
		this.kctcList = kctcList;
	}

	public String add() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				kctcService.addKctc(kctc);
				result = SUCCESS;
			} else {
				result = "addkctc";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public String update() {
		try {
			String param = getParam("param");
			if (param.equals("1")) {
				kctcService.updateKctc(kctc);
			} else {
				if (getParam("id") != null) {
					Integer id = Integer.parseInt(getParam("id"));
					kctc = kctcService.getKctc(Kctc.class, id);
				}
				return "tcinfo";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// System.out.println(this);
		return SUCCESS;
	}

	public String delete() {
		try {
			Integer id = Integer.parseInt(getParam("id"));
			kctcService.deleteKctc(id, Kctc.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public Kctc getKctc() {
		return kctc;
	}

	public void setKctc(Kctc kctc) {
		this.kctc = kctc;
	}
	@JSON(serialize = false)
	public KctcService<Kctc> getKctcService() {
		return kctcService;
	}

	public void setKctcService(KctcService<Kctc> kctcService) {
		this.kctcService = kctcService;
	}

}
