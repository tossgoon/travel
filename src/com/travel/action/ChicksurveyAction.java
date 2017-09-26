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
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class ChicksurveyAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2816337202054358494L;
	/**
	 * 
	 */
	
	private Chicksurvey chick = new Chicksurvey();
	private GeneralService <Chicksurvey> chicksurService;
	private List<Chicksurvey> chicklist;
	

	/*private UserService<User> userService;*/
	private String errormsg;

	public ChicksurveyAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}


	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Chicksurvey getChick() {
		return chick;
	}

	public void setChick(Chicksurvey chick) {
		this.chick = chick;
	}

	


	public List<Chicksurvey> getChicklist() {
		return this.chicklist;
	}

	public void setChicklist(List<Chicksurvey> chicklist) {
		this.chicklist = chicklist;
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
			this.chicksurService.addObject(chick);
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
			this.chicksurService.updateObject(chick);
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
		if (chick.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.chicksurService.deleteObject(param, Chicksurvey.class);
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
			chick = chicksurService.getObject(Chicksurvey.class, id);
		}
		return SUCCESS;
	}
	
	@JSON(serialize = false)
	public GeneralService<Chicksurvey> getChicksurService() {
		return chicksurService;
	}

	public void setChicksurService(GeneralService<Chicksurvey> chicksurService) {
		this.chicksurService = chicksurService;
	}
	
	public String querylist(){
		try {
			this.chicklist=this.chicksurService.getObjectList(Chicksurvey.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
}