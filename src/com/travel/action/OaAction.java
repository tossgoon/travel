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
	private List<Oa> oasendlist;//发送列表
	private List<Oa> oareceivelist;//接收列表
	// private List<String>oafilelist=new ArrayList();
	private String oafilestr;
	private String oareceivers="";// 接收人id
	private String oareceivernames="";// 接收人姓名
	private OaFileService<Oafile> oaFileService;
	private OaReceiverService<Oareceiver> oaReceiverService;
	private UserService<User> userService;
	private String oasender;//发送人姓名
	private String errormsg;
	private List<Oa> notifyList;
	private List<Oa> sendNotifyList;
	private SplitPage page;
	public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}

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
			oa.setType(1);//设置类型为1
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
	
	public String addnotify() {
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
			oa.setType(2);//设置类型为1
			oaService.addOa(oa);
			AddOaFiles(oafilestr);// 增加附件
			//AddOaReceivers();// 增加接收人
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
	
	public String savenotify() {
		if (oa.getId() == null) {
			return addnotify();
		} else {
			return updatenotify();
		}
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
				Integer	sendid = (Integer) ActionContext.getContext().getSession()
						.get("userid");
				User sender=this.userService.getUser(User.class, sendid);
				receiver.setSender(sender.getUsername());//设置发送人姓名
				this.oaReceiverService.addOaReceiver(receiver);
			}
		}
	}

	public String update() {
		try {
			oaService.updateOaWithoutUser(oa);
			// 先删除旧的附件
			this.oaFileService.deleteOafileByOaid(oa.getId(), Oafile.class);
			// 再增加oa附件
			AddOaFiles(oafilestr);
			//先删除旧的接收人
			this.oaReceiverService.deleteReceiversByOa(oa.getId(), Oareceiver.class);
			AddOaReceivers();// 增加接收人
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("更新用户出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}
	
	public String updatenotify() {
		try {
			oaService.updateOaWithoutUser(oa);
			// 先删除旧的附件
			this.oaFileService.deleteOafileByOaid(oa.getId(), Oafile.class);
			// 再增加oa附件
			AddOaFiles(oafilestr);
			//先删除旧的接收人
			//this.oaReceiverService.deleteReceiversByOa(oa.getId(), Oareceiver.class);
			//AddOaReceivers();// 增加接收人
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("更新用户出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String setread() throws Exception{
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			oaReceiverService.setread(id);
			setErrormsg("0");
		}
		else{
			setErrormsg("事务不存在");
		}
		return SUCCESS;
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
			if(oareceivers!=null&&  oareceivers.endsWith(";")){
				oareceivers=oareceivers.substring(0,oareceivers.length()-1);
			}
			if(oareceivernames!=null&&oareceivernames.endsWith(";")){
				oareceivernames=oareceivernames.substring(0,oareceivernames.length()-1);
			}
			this.setOareceivers(oareceivers);
			this.setOareceivernames(oareceivernames);
		}
		return SUCCESS;
	}
	
	public String modifyNotify() {
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
			/*List<Oareceiver> receiverlist = this.oaReceiverService.queryOaReceiverByOaid(id, Oareceiver.class);
			for (int i = 0; i < receiverlist.size(); i++) {
				int userid = receiverlist.get(i).getUserid();
				oareceivers += userid + ";";
				User user = userService.getUser(User.class, userid);
				this.oareceivernames += user.getUsername() + ";";
			}*/
			/*if(oareceivers!=null&&  oareceivers.endsWith(";")){
				oareceivers=oareceivers.substring(0,oareceivers.length()-1);
			}
			if(oareceivernames!=null&&oareceivernames.endsWith(";")){
				oareceivernames=oareceivernames.substring(0,oareceivernames.length()-1);
			}
			this.setOareceivers(oareceivers);
			this.setOareceivernames(oareceivernames);*/
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
		return SUCCESS;
	}
	
	public String queryreceive()
	{
		searchText = "";
		if (getParam("queryText") != null) {
			searchText = getParam("queryText");
		}
		if (ActionContext.getContext().getSession().get("userid") != null) {
			Integer userid = (Integer) ActionContext.getContext().getSession().get("userid");
			List<Oareceiver> receiverList=this.oaReceiverService.queryOaReceiverByUserid(userid, Oareceiver.class);
			this.oareceivelist=new ArrayList<Oa>();
			if(receiverList!=null)
			{
				for(int i=0;i<receiverList.size();i++)
				{
					Oa oa=new Oa();
					Oareceiver oares=receiverList.get(i);
					oa=oaService.getOa(Oa.class, oares.getOaid());
					if(oares.getIsread()!=null&&oares.getIsread()){
						oa.setIsread(true);
					}
					else{
						oa.setIsread(false);
					}
					oa.setSenduser(oares.getSender());
					oa.setRecid(oares.getId());
					oareceivelist.add(oa);
				}
			}
		}
		return SUCCESS;
	}
	
	public String querydeal()
	{
		searchText = "";
		if (getParam("queryText") != null) {
			searchText = getParam("queryText");
		}
		if (ActionContext.getContext().getSession().get("userid") != null) {
			Integer userid = (Integer) ActionContext.getContext().getSession().get("userid");
			List<Oareceiver> receiverList=this.oaReceiverService.queryOaReceiverByUseridDeal(userid, Oareceiver.class);
			this.oareceivelist=new ArrayList<Oa>();
			if(receiverList!=null)
			{
				for(int i=0;i<receiverList.size();i++)
				{
					Oa oa=new Oa();
					Oareceiver oares=receiverList.get(i);
					oa=oaService.getOa(Oa.class, oares.getOaid());
					if(oares.getIsread()!=null&&oares.getIsread()){
						oa.setIsread(true);
					}
					else{
						oa.setIsread(false);
					}
					User user= this.userService.getUser(User.class, oa.getCreater());
					oa.setSenduser(user.getUsername());
					oa.setRecid(oares.getId());
					oareceivelist.add(oa);
				}
			}
		}
		return SUCCESS;
	}
	
	public String query() {
		if (getParam("oaid") != null) {
			Integer oaid = Integer.parseInt(getParam("oaid"));
			this.oa = this.oaService.getOa(Oa.class, oaid);
			// 获取oa附件
			List<Oafile> oafilelist = this.oaFileService.queryOafileByOaid(
					oaid, Oafile.class);
			Set<Oafile> set = new HashSet<Oafile>();
			set.addAll(oafilelist);// 给set填充
			oa.setOafiles(set);
			//设置oa发送人
			User senduser=this.userService.getUser(User.class, oa.getCreater());
			this.oasender=senduser.getUsername();
		}
		else if (getParam("oarecid") != null) {
			Integer oarecid = Integer.parseInt(getParam("oarecid"));
			Oareceiver rec= this.oaReceiverService.getOaReceiver(Oareceiver.class, oarecid);
			
			this.oa = this.oaService.getOa(Oa.class, rec.getOaid());
			// 获取oa附件
			List<Oafile> oafilelist = this.oaFileService.queryOafileByOaid(
					oa.getId(), Oafile.class);
			Set<Oafile> set = new HashSet<Oafile>();
			set.addAll(oafilelist);// 给set填充
			oa.setOafiles(set);
			//设置oa发送人
			User senduser=this.userService.getUser(User.class, oa.getCreater());
			this.oasender=senduser.getUsername();
			oa.setRecid(rec.getId());
			oa.setIsread(rec.getIsread());
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
	
	public String loginsuccess(){
		try {
			if (ActionContext.getContext().getSession().get("userid") != null){
				Integer	userid = (Integer) ActionContext.getContext().getSession().get("userid");
				User user=this.userService.getUser(User.class, userid);
				if( user.getUsertype().equals("9")){
					//
					return "admin";
				}
				else{
					//querysend();
					queryreceive();
					return "normal";
				}
			}
			else{
				
				setErrorMsg("用户未登陆。");
				return ERROR;
			}
		} catch (Exception ex) {
		
			//system.out.println();
			
			setErrorMsg("访问出错。" + ex.getMessage());
			return ERROR;
		}
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

	public String getOasender() {
		return oasender;
	}

	public void setOasender(String oasender) {
		this.oasender = oasender;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public List<Oa> getNotifyList() {
		return notifyList;
	}

	public void setNotifyList(List<Oa> notifyList) {
		this.notifyList = notifyList;
	}

	public List<Oa> getSendNotifyList() {
		return sendNotifyList;
	}

	public void setSendNotifyList(List<Oa> sendNotifyList) {
		this.sendNotifyList = sendNotifyList;
	}
	
	public String queryNotifyByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		this.notifyList=this.oaService.queryNotifyByPage(pagesize, pagenum);
		int num = oaService.getNotifyCount();
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}
	
	public String queryNotifySendByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		this.notifyList=this.oaService.queryNotifySendByPage(pagesize, pagenum);
		int num = oaService.getNotifySendCount();
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}
	
	public String viewnotify() {
		if (getParam("notifyid") != null) {
			Integer oaid = Integer.parseInt(getParam("notifyid"));
			this.oa = this.oaService.getOa(Oa.class, oaid);
			// 获取oa附件
			List<Oafile> oafilelist = this.oaFileService.queryOafileByOaid(oaid, Oafile.class);
			Set<Oafile> set = new HashSet<Oafile>();
			set.addAll(oafilelist);// 给set填充
			oa.setOafiles(set);
			//设置oa发送人
			//User senduser=this.userService.getUser(User.class, oa.getCreater());
			//this.oasender=senduser.getUsername();
		}
		/*else if (getParam("oarecid") != null) {
			Integer oarecid = Integer.parseInt(getParam("oarecid"));
			Oareceiver rec= this.oaReceiverService.getOaReceiver(Oareceiver.class, oarecid);
			this.oa = this.oaService.getOa(Oa.class, rec.getOaid());
			// 获取oa附件
			List<Oafile> oafilelist = this.oaFileService.queryOafileByOaid(oa.getId(), Oafile.class);
			Set<Oafile> set = new HashSet<Oafile>();
			set.addAll(oafilelist);// 给set填充
			oa.setOafiles(set);
			//设置oa发送人
			User senduser=this.userService.getUser(User.class, oa.getCreater());
			this.oasender=senduser.getUsername();
			oa.setRecid(rec.getId());
			oa.setIsread(rec.getIsread());
		}*/
		return SUCCESS;
	}
}