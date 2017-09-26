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
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class CamerasurveyAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2429982078693264138L;
	
	private Camerasurvey camera = new Camerasurvey();
	private GeneralService <Camerasurvey> cameraService;
	private List<Camerasurvey> cameralist;
	/*private UserService<User> userService;*/
	private String errormsg;

	public CamerasurveyAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}


	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/

	public Camerasurvey getCamera() {
		return camera;
	}

	public void setCamera(Camerasurvey camera) {
		this.camera = camera;
	}

	


	public List<Camerasurvey> getCameralist() {
		return cameralist;
	}

	public void setAnimallist(List<Camerasurvey> animallist) {
		this.cameralist = animallist;
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
			this.cameraService.addObject(camera);
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
			this.cameraService.updateObject(camera);
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
		if (camera.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.cameraService.deleteObject(param, Camerasurvey.class);
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
			camera = this.cameraService.getObject(Camerasurvey.class, id);
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	public GeneralService <Camerasurvey> getCameraService() {
		return cameraService;
	}

	public void setCameraService(GeneralService <Camerasurvey> cameraService) {
		this.cameraService = cameraService;
	}
	
	public String querylist(){
		try {
			this.cameralist=this.cameraService.getObjectList(Camerasurvey.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
}