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
import com.travel.pojo.Oa;
import com.travel.pojo.Oafile;
import com.travel.pojo.Oareceiver;
import com.travel.pojo.User;
import com.travel.service.OaFileService;
import com.travel.service.OaReceiverService;
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
	private List<Oa> oasendlist;
	private List<Oa> oareceivelist;
	// private List<String>oafilelist=new ArrayList();
	private String oafilestr;
	private String oareceivers;// 接收人id
	private String oareceivernames;// 接收人姓名
	private OaFileService<Oafile> oaFileService;
	private OaReceiverService<Oareceiver> oaReceiverService;
	private UserService<User> userService;

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

	public String save() {
		if (oa.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String add() {
		String result = "";
		try {
			int userid = 0;
			if (ActionContext.getContext().getSession().get("userid") != null) {
				userid = (Integer) ActionContext.getContext().getSession()
						.get("userid");
			} else {
				setErrorMsg("登录用户为空。");
				return ERROR;
			}
			oa.setCreater(userid);
			oaService.addOa(oa);
			AddOaFiles(oafilestr);// 增加附件
			AddOaReceivers();// 增加接收人
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

	private void AddOaFiles(String oafilestr) throws Exception {
		// 增加oa附件
		if(oafilestr!=null&&oafilestr.length()!=0){
			String[] oafiles = oafilestr.split("[?]");// 用?分割数组
			for (int i = 0; i < oafiles.length; i++) {
				String[] afile = oafiles[i].split("[*]");
				if (afile.length == 2) {
					Oafile fileobj = new Oafile();
					fileobj.setOaid(oa.getId());
					fileobj.setFilename(afile[0]);
					fileobj.setFilepath(afile[1]);
					this.oaFileService.addOafile(fileobj);
				}
			}
		}
	}

	private void AddOaReceivers() throws Exception {
		// 增加oa接收人
		if(oareceivers!=null&&oareceivers.length()!=0)
		{
			String[] oareceiverlist = this.oareceivers.split(";");
			for (int i = 0; i < oareceiverlist.length; i++) {
				int userid = Integer.parseInt(oareceiverlist[i]);
				Oareceiver receiver = new Oareceiver();
				receiver.setOaid(oa.getId());
				receiver.setUserid(userid);
				this.oaReceiverService.addOaReceiver(receiver);
			}
		}
	}

	public String update() {
		try {
			oaService.updateOa(oa);
			// 先删除旧的附件
			this.oaFileService.deleteOafileByOaid(oa.getId(), Oafile.class);
			// 再增加oa附件
			AddOaFiles(oafilestr);
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("更新用户出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String modify() {
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			oa = oaService.getOa(Oa.class, id);// 初始化oa
			// 获取oa附件
			List<Oafile> oafilelist = this.oaFileService.queryOafileByOaid(id,
					Oafile.class);
			
			Set<Oafile> set=new HashSet<Oafile>();         
	        set.addAll(oafilelist);//给set填充   
			
			oa.setOafiles(set);
			// 获取oa接收人
			List<Oareceiver> receiverlist = this.oaReceiverService.queryOaReceiverByOaid(id, Oareceiver.class);
			for (int i = 0; i < receiverlist.size(); i++) {
				int userid = receiverlist.get(i).getUserid();
				oareceivers += userid + ";";
				User user = userService.getUser(User.class, userid);
				this.oareceivernames += user.getUsername() + ";";
			}
			if(oareceivers.endsWith(";")){
				oareceivers=oareceivers.substring(0,oareceivers.length()-1);
			}
			if(oareceivernames.endsWith(";")){
				oareceivernames=oareceivernames.substring(0,oareceivernames.length()-1);
			}
			this.setOareceivers(oareceivers);
			this.setOareceivernames(oareceivernames);
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			// 删除对应的附件信息
			oaFileService.deleteOafileByOaid(param, Oafile.class);
			// 删除oa
			oaService.deleteOa(param, Oa.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String querysend() {
		searchText = "";
		if (getParam("queryText") != null) {
			searchText = getParam("queryText");
		}
		if (ActionContext.getContext().getSession().get("userid") != null) {
			Integer userid = (Integer) ActionContext.getContext().getSession()
					.get("userid");
			oasendlist = oaService.queryOaByName(userid, Oa.class, searchText);
		}
		else {

		}
		return SUCCESS;
	}

	public String queryByCreater() {
		try {
			if (ActionContext.getContext().getSession().get("userid") != null) {
				Integer	userid = (Integer) ActionContext.getContext().getSession()
						.get("userid");
				oalist = oaService.queryOaByCreater(userid, Oa.class);
			} 
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

	public String getOafilestr() {
		return oafilestr;
	}

	public void setOafilestr(String oafilestr) {
		this.oafilestr = oafilestr;
	}

	@JSON(serialize = false)
	public OaFileService<Oafile> getOaFileService() {
		return oaFileService;
	}

	public void setOaFileService(OaFileService<Oafile> oaFileService) {
		this.oaFileService = oaFileService;
	}

	public String getOareceivers() {
		return oareceivers;
	}

	public void setOareceivers(String oareceivers) {
		this.oareceivers = oareceivers;
	}

	@JSON(serialize = false)
	public OaReceiverService<Oareceiver> getOaReceiverService() {
		return oaReceiverService;
	}

	public void setOaReceiverService(
			OaReceiverService<Oareceiver> oaReceiverService) {
		this.oaReceiverService = oaReceiverService;
	}

	public String getOareceivernames() {
		return oareceivernames;
	}

	public void setOareceivernames(String oareceivernames) {
		this.oareceivernames = oareceivernames;
	}

	@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}
	
	public void setUserService(UserService<User> userService) {
		this.userService = userService;
	}

	public List<Oa> getOasendlist() {
		return oasendlist;
	}

	public void setOasendlist(List<Oa> oasendlist) {
		this.oasendlist = oasendlist;
	}

	public List<Oa> getOareceivelist() {
		return oareceivelist;
	}

	public void setOareceivelist(List<Oa> oareceivelist) {
		this.oareceivelist = oareceivelist;
	}

}
