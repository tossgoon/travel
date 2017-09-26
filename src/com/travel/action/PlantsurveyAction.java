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
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class PlantsurveyAction extends ActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4036052768545591769L;
	private Plantsurvey plantsurvey = new Plantsurvey();
	private GeneralService <Plantsurvey> plantService;
	private List<Plantsurvey> plantlist;
	/*private UserService<User> userService;*/
	private String errormsg;

	public PlantsurveyAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}


	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Plantsurvey getPlantsurvey() {
		return plantsurvey;
	}

	public void setPlantsurvey(Plantsurvey importinfo) {
		this.plantsurvey = importinfo;
	}

	@JSON(serialize = false)
	public GeneralService<Plantsurvey> getPlantService() {
		return this.plantService;
	}

	public void setPlantService(GeneralService<Plantsurvey> chickService) {
		this.plantService = chickService;
	}

	public List<Plantsurvey> getPlantlist() {
		return this.plantlist;
	}

	public void setPlantlist(List<Plantsurvey> chicklist) {
		this.plantlist= chicklist;
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
			this.plantService.addObject(plantsurvey);
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
			this.plantService.updateObject(plantsurvey);
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
		if (plantsurvey.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.plantService.deleteObject(param, Plantsurvey.class);
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
			plantsurvey = this.plantService.getObject(Plantsurvey.class, id);
		}
		return SUCCESS;
	}
	
	public String querylist(){
		try {
			this.plantlist=this.plantService.getObjectList(Plantsurvey.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
}