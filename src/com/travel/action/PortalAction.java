package com.travel.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
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
	private List<Portal> portalIntroList;//保护区介绍 0
	private List<Portal> portalWorkPics;//工作动态 1
	private List<Portal> portalWorkList;//工作动态首页 1(带图片)
	private List<Portal> portalLawList;//政策法规 2
	private List<Portal> portalAffairsList;//政务公开 3
	private List<Portal> portalVolHomeList;//志愿者之家4
	private List<Portal> portalAnimalList;//科普知识5（动物）
	private List<Portal> portalPlantList;//科普知识10（植物）
	private List<Portal> portalContactUsList;//联系我们6
	private List<Portal> pictureList;//图片赏析7(动物）
	private List<Portal> pictureListPlant;//图片赏析(植物）11
	private List<Portal> pictureLisLandscape;//图片赏析(景观）12
	private List<Portal> portalFireList;//保护区防护(防火)8
	private List<Portal> portalInsectList;//保护区防护(防虫)9
	private List<Portal> portalPlantAnimalProtectList;//动植物保护13
	private SplitPage page;
	private String ptype;
	private String keywords;
	public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}

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
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			portal = portalService.getPortal(Portal.class, id);
			return "portalinfo";
		}
		else {
			searchText = getParam("queryText");
			this.portalIntroList=portalService.queryPortalByType("0", 0);//保护区介绍
			this.portalWorkList=portalService.queryPortalByType("1", 0);//工作动态
			this.portalLawList=portalService.queryPortalByType("2", 0);//政策法规
			this.portalAffairsList=portalService.queryPortalByType("3", 0);//政务公开
			//this.portalVolHomeList=portalService.queryPortalByType("4", 0);//志愿者之家
			this.portalAnimalList=portalService.queryPortalByType("5", 0);//科普知识
			this.portalContactUsList=portalService.queryPortalByType("6", 0);//联系我们
			this.setPictureList(portalService.queryPortalByType("7", 0));//图片赏析
			this.portalFireList=portalService.queryPortalByType("8", 0);//保护区防护
			this.portalPlantList=portalService.queryPortalByType("10", 0);//科普知识 植物
			this.portalInsectList=portalService.queryPortalByType("9", 0);//保护区防护(防虫)
			
			//portals = portalService.queryPortalByName(searchText, Portal.class);
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
	
	public String queryByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		if(getParam("type")!=null)
		{
			ptype=getParam("type");
			/*if(type.equals("0")){
				this.portalType="保护区介绍";
			}
			else if(type.equals("1")){
				this.portalType="工作动态";
			}
			else if(type.equals("2")){
				this.portalType="政策法规";
			}
			else if(type.equals("3")){
				this.portalType="政务公开";
			}
			else if(type.equals("4")){
				this.portalType="志愿者之家";
			}
			else if(type.equals("5")){
				this.portalType="科普知识";
			}
			else if(type.equals("6")){
				this.portalType="联系我们";
			}
			else if(type.equals("7")){
				this.portalType="图片赏析";
			}
			else {
				this.portalType="其他";
			}*/
		}
		else{
			ptype="0";
		}
		this.portals=portalService.queryPortalByPage(pagesize, pagenum, ptype);
		int num = portalService.getPortalCount(ptype);
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}
	
	public String searchByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		//关键字
		if(getParam("keywords")!=null){
			keywords=getParam("keywords");
		}
		else{
			keywords="";
		}
		this.portals=portalService.searchPortalByPage(pagesize, pagenum, keywords);
		int num = portalService.getPortalSearchCount(keywords);
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
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
		this.portalWorkPics=portalService.queryPortalOfPicturl(3);//首页照片(工作动态)
		this.portalIntroList=portalService.queryPortalByType("0", 1);//保护区介绍
		this.portalWorkList=portalService.queryPortalByType("1", 4);//工作动态
		this.portalLawList=portalService.queryPortalByType("2", 4);//政策法规
		this.portalAffairsList=portalService.queryPortalByType("3", 3);//政务公开
		//this.portalVolHomeList=portalService.queryPortalByType("4", 5);//志愿者之家
		this.portalAnimalList=portalService.queryPortalByType("5", 3);//科普知识（动物）-科普知识
		this.portalPlantList=portalService.queryPortalByType("10", 2);//科普知识（植物）-科普知识
		this.portalContactUsList=portalService.queryPortalByType("6", 5);//联系我们
		this.setPictureList(portalService.queryPortalByType("7", 0));//图片赏析（动物）
		this.setPictureListPlant(portalService.queryPortalByType("11", 0));//图片赏析（植物）
		this.portalFireList=portalService.queryPortalByType("8", 2);//保护区防护-防火
		this.portalInsectList=portalService.queryPortalByType("9", 2);//保护区防护-防虫
		this.setPortalPlantAnimalProtectList(portalService.queryPortalByType("13", 2));//保护区防护-野生动植物防护
		this.pictureLisLandscape=portalService.queryPortalByType("12", 0);//图片赏析-景观
		return SUCCESS;
		//this.portalWorkList=portalService.queryPortalByType("工作动态", 5);
	}

	public List<Portal> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<Portal> pictureList) {
		this.pictureList = pictureList;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public List<Portal> getPortalAnimalList() {
		return portalAnimalList;
	}

	public void setPortalAnimalList(List<Portal> portalAnimalList) {
		this.portalAnimalList = portalAnimalList;
	}

	public List<Portal> getPortalPlantList() {
		return portalPlantList;
	}

	public void setPortalPlantList(List<Portal> portalPlantList) {
		this.portalPlantList = portalPlantList;
	}

	public List<Portal> getPortalFireList() {
		return portalFireList;
	}

	public void setPortalFireList(List<Portal> portalFireList) {
		this.portalFireList = portalFireList;
	}

	public List<Portal> getPortalInsectList() {
		return portalInsectList;
	}

	public void setPortalInsectList(List<Portal> portalInsectList) {
		this.portalInsectList = portalInsectList;
	}

	public List<Portal> getPictureListPlant() {
		return pictureListPlant;
	}

	public void setPictureListPlant(List<Portal> pictureListPlant) {
		this.pictureListPlant = pictureListPlant;
	}

	public List<Portal> getPictureLisLandscape() {
		return pictureLisLandscape;
	}

	public void setPictureLisLandscape(List<Portal> pictureLisLandscape) {
		this.pictureLisLandscape = pictureLisLandscape;
	}

	public List<Portal> getPortalPlantAnimalProtectList() {
		return portalPlantAnimalProtectList;
	}

	public void setPortalPlantAnimalProtectList(
			List<Portal> portalPlantAnimalProtectList) {
		this.portalPlantAnimalProtectList = portalPlantAnimalProtectList;
	}
}
