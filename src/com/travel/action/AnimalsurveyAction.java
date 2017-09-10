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

import com.travel.pojo.User;
import com.travel.service.AnimalsurveyService;
import com.travel.service.UserService;

public class AnimalsurveyAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2871113028472366475L;
	/**
	 * 
	 */
	private Animalsurvey animal = new Animalsurvey();
	private AnimalsurveyService<Animalsurvey> animalService;
	private List<Animalsurvey> animallist;
	/*private UserService<User> userService;*/
	private String errormsg;

	public AnimalsurveyAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}


	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Animalsurvey getAnimal() {
		return animal;
	}

	public void setAnimal(Animalsurvey animal) {
		this.animal = animal;
	}

	@JSON(serialize = false)
	public AnimalsurveyService<Animalsurvey> getAnimalService() {
		return animalService;
	}

	public void setAnimalService(AnimalsurveyService<Animalsurvey> animalService) {
		this.animalService = animalService;
	}

	public List<Animalsurvey> getAnimallist() {
		return animallist;
	}

	public void setAnimallist(List<Animalsurvey> animallist) {
		this.animallist = animallist;
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
			this.animalService.addAnimalsur(animal);
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
			this.animalService.updateAnimalsur(animal);
			setErrormsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrormsg("更新出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}
	
	public String savedept() {
		if (animal.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.animalService.deleteAnimalsur(param, Animalsurvey.class);
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
			animal = animalService.getAnimalsur(Animalsurvey.class, id);
		}
		return SUCCESS;
	}
}