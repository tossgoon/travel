package com.travel.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.travel.pojo.Portal;
import com.travel.service.PortalService;

public class PortalAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8981587084100386633L;
	/**
	 * 
	 */
	private Portal portal = new Portal();
	private PortalService<Portal> portalService;
	private String searchText;
	private List<Portal> portals;
	private String errorMsg;

	public PortalAction() {

	}

	public Portal getPortal() {
		return portal;
	}

	public void setPortal(Portal portal) {
		this.portal = portal;
	}

	@JSON(serialize = false)
	public PortalService<Portal> getPortalService() {
		return portalService;
	}

	public void setPortalService(PortalService<Portal> portalService) {
		this.portalService = portalService;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public List<Portal> getPortals() {
		return portals;
	}

	public void setPortals(List<Portal> portals) {
		this.portals = portals;
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public String save() {
		String result = "";
		if (portal.getId() == null) {
			// insert
			return add();
		} else {
			// update
			return update();
		}
	}

	public String add() {
		String result = "";
		try {
			portalService.addPortal(portal);
			// throw new RuntimeException("");
			setErrorMsg("0");
			result = SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			setErrorMsg("保存出错。" + e.getMessage());
			result = ERROR;
		}
		return result;
	}

	public String update() {
		try {
			// String param = getParam("param");
			portalService.updatePortal(portal);
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("更新出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			portalService.deletePortal(param, Portal.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String query() {
		searchText = getParam("queryText");
		portals = portalService.queryPortalByName(searchText, Portal.class);
		// setUsers(userService.queryUserByName(searchText, User.class));
		return SUCCESS;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
}
