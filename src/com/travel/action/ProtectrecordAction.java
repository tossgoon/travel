package com.travel.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.base.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Camerasurvey;
import com.travel.pojo.Chicksurvey;
import com.travel.pojo.Importinfo;
import com.travel.pojo.Plantsurvey;
import com.travel.pojo.Protectrecord;
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class ProtectrecordAction extends ActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2111424893973947271L;
	/**
	 * 
	 */
	private Protectrecord protect = new Protectrecord();
	private GeneralService <Protectrecord> protectService;
	private List<Protectrecord> protectlist;
	/*private UserService<User> userService;*/
	private String errormsg;

	public ProtectrecordAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Protectrecord getProtect() {
		return protect;
	}

	public void setProtect(Protectrecord importinfo) {
		this.protect = importinfo;
	}

	@JSON(serialize = false)
	public GeneralService<Protectrecord> getProtectService() {
		return this.protectService;
	}

	public void setProtectService(GeneralService<Protectrecord> chickService) {
		this.protectService = chickService;
	}

	public List<Protectrecord> getProtectlist() {
		return this.protectlist;
	}

	public void setProtectlist(List<Protectrecord> chicklist) {
		this.protectlist= chicklist;
	}

	/*public void setUserService(UserService<User> userService) {
		this.userService = userService;
	}*/

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String add() {
		String result = "";
		try {
			this.protectService.addObject(protect);
			// throw new RuntimeException("");
			setErrormsg("0");
			result = SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			setErrormsg("保存出错。" + e.getMessage());
			result = ERROR;
		}
		return result;
	}

	public String update() {
		try {
			// String param = getParam("param");
			this.protectService.updateObject(protect);
			setErrormsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrormsg("更新出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}
	
	public String save() {
		if (protect.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.protectService.deleteObject(param, Protectrecord.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String query() {
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			protect = this.protectService.getObject(Protectrecord.class, id);
		}
		return SUCCESS;
	}
	public String querylist(){
		try {
			this.protectlist=this.protectService.getObjectList(Protectrecord.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
}