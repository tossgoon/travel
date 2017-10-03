package com.travel.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.Diskfile;
import com.travel.pojo.Foldertype;
import com.travel.service.DiskfileService;
import com.travel.service.FoldertypeService;

public class DiskfileAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2871113028472366475L;
	/**
	 * 
	 */
	private Diskfile diskfile = new Diskfile();
	private DiskfileService<Diskfile> diskfileService;
	private List<Diskfile> diskfilelist;
	private String errormsg;
	private SplitPage page;
	private List<Foldertype> folderlist;
	private FoldertypeService<Foldertype> foldertypeService;
	private int folderid;
	private Foldertype currentfolder;
	public DiskfileAction() {

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

	public String add() {
		String result = "";
		try {
			this.diskfileService.addDiskfile(diskfile);
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
			this.diskfileService.updateDiskfile(diskfile);
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
		if (diskfile.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.diskfileService.deleteDiskfile(param, Diskfile.class);
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
			diskfile = this.diskfileService.getDiskfile(Diskfile.class, id);
			this.folderid=diskfile.getFolderid();
		}
		else if (getParam("folderid") != null) {
			this.folderid = Integer.parseInt(getParam("folderid"));
		}
		Integer ptype = Integer.parseInt(getParam("ptype"));
		this.folderlist=foldertypeService.getFolderList(Foldertype.class,ptype);
		if(ptype==1){
			return SUCCESS;
		}
		else{
			return "image";
		}
	}

	public Diskfile getDiskfile() {
		return diskfile;
	}

	public void setDiskfile(Diskfile diskfile) {
		this.diskfile = diskfile;
	}

	@JSON(serialize = false)
	public DiskfileService<Diskfile> getDiskfileService() {
		return diskfileService;
	}

	public void setDiskfileService(DiskfileService<Diskfile> diskfileService) {
		this.diskfileService = diskfileService;
	}

	public List<Diskfile> getDiskfilelist() {
		return diskfilelist;
	}

	public void setDiskfilelist(List<Diskfile> diskfilelist) {
		this.diskfilelist = diskfilelist;
	}
	
	public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}

	public String queryByPage() {
		int pagesize = 3;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		if (getParam("folderid") != null) {
			folderid = Integer.parseInt(getParam("folderid"));// 文件夹类型
			currentfolder=this.foldertypeService.getFoldertype(Foldertype.class, folderid);
			setErrormsg("0");
		}
		else{
			setErrormsg("文件夹不存在");
		}
		this.diskfilelist=diskfileService.searchDiskfileByPage(pagesize, pagenum, folderid);
		int num = diskfileService.getDiskfileCount(folderid);
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		//目录信息
		Integer ptype = Integer.parseInt(getParam("ptype"));
		this.folderlist=foldertypeService.getFolderList(Foldertype.class,ptype);
		return SUCCESS;
	}

	public List<Foldertype> getFolderlist() {
		return folderlist;
	}

	public void setFolderlist(List<Foldertype> folderlist) {
		this.folderlist = folderlist;
	}

	@JSON(serialize = false)
	public FoldertypeService<Foldertype> getFoldertypeService() {
		return foldertypeService;
	}

	public void setFoldertypeService(FoldertypeService<Foldertype> foldertypeService) {
		this.foldertypeService = foldertypeService;
	}
	
	public int getFolderid() {
		return folderid;
	}

	public void setFolderid(int folderid) {
		this.folderid = folderid;
	}

	public Foldertype getCurrentfolder() {
		return currentfolder;
	}

	public void setCurrentfolder(Foldertype currentfolder) {
		this.currentfolder = currentfolder;
	}

}