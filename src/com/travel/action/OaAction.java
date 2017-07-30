package com.travel.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	// private List<String>oafilelist=new ArrayList();
	private String oafilestr;
	private String oareceivers;//������
	private OaFileService<Oafile> oaFileService;
	private OaReceiverService<Oareceiver> oaReceiverService;

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
				setErrorMsg("��¼�û�Ϊ�ա�");
				return ERROR;
			}
			oa.setCreater(userid);
			oaService.addOa(oa);
			AddOaFiles(oafilestr);//���Ӹ���
			AddOaReceivers();//���ӽ�����
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
	
	private void AddOaFiles(String oafilestr) throws Exception {
		// ����oa����
		String[] oafiles = oafilestr.split("[?]");// ��?�ָ�����
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
	
	private void AddOaReceivers() throws Exception{
		//����oa������
		String[] oareceiverlist=this.oareceivers.split(";");
		for (int i = 0; i < oareceiverlist.length; i++) {
			int userid=Integer.parseInt(oareceiverlist[i]);
			Oareceiver receiver=new Oareceiver();
			receiver.setOaid(oa.getId());
			receiver.setUserid(userid);
			this.oaReceiverService.addOaReceiver(receiver);
		}
	}

	public String update() {
		try {
			oaService.updateOa(oa);
			// ��ɾ���ɵĸ���
			this.oaFileService.deleteOafileByOaid(oa.getId(), Oafile.class);
			// ������oa����
			AddOaFiles(oafilestr);
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("�����û�����" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			//ɾ����Ӧ�ĸ�����Ϣ
			oaFileService.deleteOafileByOaid(param, Oafile.class);
			//ɾ��oa
			oaService.deleteOa(param, Oa.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("ɾ������" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String queryByCreater() {
		try {
			Integer userid = Integer.parseInt(getParam("userid"));
			oalist = oaService.queryOaByCreater(userid, Oa.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("��ѯ����" + e.getMessage());
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

	public void setOaReceiverService(OaReceiverService<Oareceiver> oaReceiverService) {
		this.oaReceiverService = oaReceiverService;
	}
}
