package com.travel.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.base.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.travel.pojo.Oa;
import com.travel.pojo.User;
import com.travel.service.OaService;
import com.travel.service.UserService;

public class OaAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2125110341085367300L;
	private Oa oa = new Oa();
	private OaService<Oa> oaService;
	private String searchText;
	private List<Oa> oalist;
	public Oa getOa() {
		return oa;
	}

	public void setOa(Oa oa) {
		this.oa = oa;
	}
	
	@JSON(serialize = false)
	public OaService<Oa> getOaService() {
		return oaService;
	}

	public void setOaService(OaService<Oa> oaService) {
		this.oaService = oaService;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public List<Oa> getOalist() {
		return oalist;
	}

	public void setOalist(List<Oa> oalist) {
		this.oalist = oalist;
	}

	private String errorMsg;
	public OaAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public String add() {
		String result = "";
		try {
			oaService.addOa(oa);
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
			oaService.updateOa(oa);
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("更新用户出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			oaService.deleteOa(param, Oa.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String queryByCreater() {
		try {
			Integer userid = Integer.parseInt(getParam("userid"));
			oalist =oaService.queryOaByCreater(userid, Oa.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("查询出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
}
