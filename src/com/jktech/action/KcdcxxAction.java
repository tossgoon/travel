package com.jktech.action;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.Kcdcxx;
import com.jktech.service.KcdcxxService;
import com.opensymphony.xwork2.ActionSupport;

public class KcdcxxAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 245613104901349357L;
	/**
	 * 
	 */
	private Kcdcxx kcdcxx = new Kcdcxx();
	private KcdcxxService<Kcdcxx> kcdcxxService;

	public KcdcxxAction() {
		// TODO Auto-generated constructor stub
	}


	public String add() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				kcdcxxService.addKcdcxx(kcdcxx);
				result = SUCCESS;
			} else {
				result = "addkcdcxx";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public String update() {
		try {
			String param = getParam("param");
			if (param.equals("1")) {
				kcdcxxService.updateKcdcxx(kcdcxx);
			}
			else if(param.equals("2"))
			{
				//通过tcid取dcxx的值
				if (getParam("tcid") != null) {
					Integer tcid = Integer.parseInt(getParam("tcid"));
					kcdcxx=kcdcxxService.getKcdcxxByTcid(tcid);
				}
				return "dcxxinfo";
			}
			else {
				if (getParam("id") != null) {
					Integer id = Integer.parseInt(getParam("id"));
					kcdcxx = kcdcxxService.getKcdcxx(Kcdcxx.class, id);
				}
				return "dcxxinfo";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// System.out.println(this);
		return SUCCESS;
	}

	public String delete() {
		try {
			Integer id = Integer.parseInt(getParam("id"));
			kcdcxxService.deleteKcdcxx(id, Kcdcxx.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public Kcdcxx getKcdcxx() {
		return kcdcxx;
	}

	public void setKcdcxx(Kcdcxx kcdcxx) {
		this.kcdcxx = kcdcxx;
	}

	public KcdcxxService<Kcdcxx> getKcdcxxService() {
		return kcdcxxService;
	}

	public void setKcdcxxService(KcdcxxService<Kcdcxx> kcdcxxService) {
		this.kcdcxxService = kcdcxxService;
	}
}
