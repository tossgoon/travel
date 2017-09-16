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
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class ImportinfoAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7221637156146403587L;
	/**
	 * 
	 */
	
	private Importinfo importinfo = new Importinfo();
	private GeneralService <Importinfo> importinfoService;
	private List<Importinfo> importinfolist;
	/*private UserService<User> userService;*/
	private String errormsg;

	public ImportinfoAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}


	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Importinfo getImportinfo() {
		return importinfo;
	}

	public void setImportinfo(Importinfo importinfo) {
		this.importinfo = importinfo;
	}

	@JSON(serialize = false)
	public GeneralService<Importinfo> getImportinfoService() {
		return this.importinfoService;
	}

	public void setImportinfoService(GeneralService<Importinfo> chickService) {
		this.importinfoService = chickService;
	}

	public List<Importinfo> getImportinfolist() {
		return this.importinfolist;
	}

	public void setImportinfolist(List<Importinfo> chicklist) {
		this.importinfolist= chicklist;
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
			this.importinfoService.addObject(importinfo);
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
			this.importinfoService.updateObject(importinfo);
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
		if (importinfo.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.importinfoService.deleteObject(param, Importinfo.class);
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
			importinfo = importinfoService.getObject(Importinfo.class, id);
		}
		return SUCCESS;
	}
	
	public String querylist(){
		try {
			this.importinfolist=this.importinfoService.getObjectList(Importinfo.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
}