package com.jktech.action;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import com.jktech.pojo.Kczk;
import com.jktech.service.KczkService;
import com.opensymphony.xwork2.ActionSupport;

public class KczkAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5383145518303856979L;
	private Kczk kczk = new Kczk();
	private KczkService<Kczk> kczkService;

	public KczkAction() {
		// TODO Auto-generated constructor stub
	}

	public String add() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				kczkService.addKczk(kczk);
				result = SUCCESS;
			} else {
				result = "addKczk";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public String query() {
		try {
			if (getParam("id") != null) {
				Integer id = Integer.parseInt(getParam("id"));
				kczk = kczkService.getKczk(Kczk.class, id);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
		return SUCCESS;
	}

	public String update() {
		try {
			//int gcid=kczk.getGcId();
			//System.out.println(gcid);
			kczkService.updateKczk(kczk);
			return NONE;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return ERROR;
		}
	}

	public String delete() {
		try {
			Integer id = Integer.parseInt(getParam("id"));
			kczkService.deleteKczk(id, Kczk.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public Kczk getKczk() {
		return kczk;
	}

	public void setKczk(Kczk kczk) {
		this.kczk = kczk;
	}

	@JSON(serialize = false)
	public KczkService<Kczk> getKczkService() {
		return kczkService;
	}

	public void setKczkService(KczkService<Kczk> kczkService) {
		this.kczkService = kczkService;
	}

	@JSON(serialize = false)
	public String getGcname() {
		if (null != kczk) {
			return kczkService.getGCName(kczk.getGcId());
		}
		return "";
	}

	/*
	 * @Override public void validate() { // TODO Auto-generated method stub
	 * String param = getParam("param"); if (param.equals("1")) {
	 * if(kczk.getZkDepth()==null) this.addFieldError("loginInfoRef.username",
	 * "对不起，用户名不可以为空！"); super.validate(); }
	 * 
	 * }
	 */
	/*
	 * @Override public void preUpdate(String id) { // TODO Auto-generated
	 * method stub int zkid=Integer.parseInt(id); kczk=
	 * kczkService.getKczk(Kczk.class, zkid); }
	 */
}
