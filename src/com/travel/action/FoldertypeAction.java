package com.travel.action;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.travel.pojo.Foldertype;
import com.travel.service.FoldertypeService;

public class FoldertypeAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2871113028472366475L;
	/**
	 * 
	 */
	private Foldertype foldertype = new Foldertype();
	private FoldertypeService<Foldertype> foldertypeService;
	private List<Foldertype> foldertypelist;
	private String errormsg;
	public FoldertypeAction() {

	}
	public Foldertype getFoldertype() {
		return foldertype;
	}

	public void setFoldertype(Foldertype foldertype) {
		this.foldertype = foldertype;
	}
	
	@JSON(serialize = false)
	public FoldertypeService<Foldertype> getFoldertypeService() {
		return foldertypeService;
	}

	public void setFoldertypeService(FoldertypeService<Foldertype> foldertypeService) {
		this.foldertypeService = foldertypeService;
	}

	public List<Foldertype> getFoldertypelist() {
		return foldertypelist;
	}

	public void setFoldertypelist(List<Foldertype> foldertypelist) {
		this.foldertypelist = foldertypelist;
	}

	/*private UserService<User> userService;*/
	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}
	/*@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}*/
	/*public void setUserService(UserService<User> userService) {
		this.userService = userService;
	}*/

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String add(int ptype) {
		String result = "";
		try {
			foldertype.setPtype(ptype);//设置类型为1，则为网络硬盘的文件夹
			this.foldertypeService.addFoldertype(foldertype);
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

	public String update(int ptype) {
		try {
			// String param = getParam("param");
			foldertype.setPtype(ptype);
			this.foldertypeService.updateFoldertype(foldertype);
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
		Integer ptype = Integer.parseInt(getParam("ptype"));//1.为网络硬盘文件夹 2.为上传图片文件夹
		if (foldertype.getId() == null) {
			return add(ptype);
		} else {
			return update(ptype);
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.foldertypeService.deleteFoldertype(param, Foldertype.class);
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
			foldertype = this.foldertypeService.getFoldertype(Foldertype.class, id);
		}
		return SUCCESS;
	}
	
	public String querylist(){
		Integer ptype=1;//1代表网络硬盘  2为图片目录
		if (getParam("ptype") != null) {
			ptype = Integer.parseInt(getParam("ptype"));
			this.foldertypelist=this.foldertypeService.getFolderList(Foldertype.class,ptype);
		}
		if(ptype==1)
		{
			return SUCCESS;
		}
		else{
			return "image";
		}
	}
}