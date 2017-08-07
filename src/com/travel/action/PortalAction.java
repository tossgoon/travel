package com.travel.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.Kcgc;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.travel.pojo.Portal;
import com.travel.pojo.User;
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
	private List<Portal> portalIntroList;//���������� 0
	private List<Portal> portalWorkPics;//������̬ 1
	private List<Portal> portalWorkList;//������̬��ҳ 1
	private List<Portal> portalLawList;//���߷��� 2
	private List<Portal> portalAffairsList;//���񹫿� 3
	private List<Portal> portalVolHomeList;//־Ը��֮��4
	private List<Portal> portalScienceList;//����֪ʶ5
	private List<Portal> portalContactUsList;//��ϵ����6
	private List<Portal> pictureList;//ͼƬ����7
	
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
	
	public List<Portal> getPortalWorkPics() {
		return portalWorkPics;
	}

	public void setPortalWorkPics(List<Portal> portalWorkPics) {
		this.portalWorkPics = portalWorkPics;
	}

	public List<Portal> getPortalWorkList() {
		return portalWorkList;
	}

	public void setPortalWorkList(List<Portal> portalWorkList) {
		this.portalWorkList = portalWorkList;
	}

	public List<Portal> getPortalLawList() {
		return portalLawList;
	}

	public void setPortalLawList(List<Portal> portalLawList) {
		this.portalLawList = portalLawList;
	}

	public List<Portal> getPortalAffairsList() {
		return portalAffairsList;
	}

	public void setPortalAffairsList(List<Portal> portalAffairsList) {
		this.portalAffairsList = portalAffairsList;
	}

	public List<Portal> getPortalScienceList() {
		return portalScienceList;
	}

	public void setPortalScienceList(List<Portal> portalScienceList) {
		this.portalScienceList = portalScienceList;
	}

	public List<Portal> getPortalIntroList() {
		return portalIntroList;
	}

	public void setPortalIntroList(List<Portal> portalIntroList) {
		this.portalIntroList = portalIntroList;
	}

	public List<Portal> getPortalVolHomeList() {
		return portalVolHomeList;
	}

	public void setPortalVolHomeList(List<Portal> portalVolHomeList) {
		this.portalVolHomeList = portalVolHomeList;
	}

	public List<Portal> getPortalContactUsList() {
		return portalContactUsList;
	}

	public void setPortalContactUsList(List<Portal> portalContactUsList) {
		this.portalContactUsList = portalContactUsList;
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
			setErrorMsg("�������" + e.getMessage());
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
			setErrorMsg("���³���" + e.getMessage());
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
			setErrorMsg("ɾ������" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String query() {
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			portal = portalService.getPortal(Portal.class, id);
			return "portalinfo";
		} else {
			searchText = getParam("queryText");
			portals = portalService.queryPortalByName(searchText, Portal.class);
			// setUsers(userService.queryUserByName(searchText, User.class));
			return SUCCESS;
		}
	}
	
	public String show()
	{
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			portal = portalService.getPortal(Portal.class, id);
		}
		return SUCCESS;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	public String showfirst()
	{
		this.portalWorkPics=portalService.queryPortalOfPicturl(3);//��ҳ��Ƭ(������̬)
		this.portalIntroList=portalService.queryPortalByType("0", 1);//����������
		this.portalWorkList=portalService.queryPortalByType("1", 5);//������̬
		this.portalLawList=portalService.queryPortalByType("2", 5);//���߷���
		this.portalAffairsList=portalService.queryPortalByType("3", 5);//���񹫿�
		this.portalVolHomeList=portalService.queryPortalByType("4", 5);//־Ը��֮��
		this.portalScienceList=portalService.queryPortalByType("5", 5);//����֪ʶ
		this.portalContactUsList=portalService.queryPortalByType("6", 5);//��ϵ����
		this.setPictureList(portalService.queryPortalByType("7", 0));//ͼƬ����
		return SUCCESS;
		//this.portalWorkList=portalService.queryPortalByType("������̬", 5);
	}

	public List<Portal> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<Portal> pictureList) {
		this.pictureList = pictureList;
	}
	
}
