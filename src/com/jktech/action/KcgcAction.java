package com.jktech.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.Kcgc;
import com.jktech.pojo.Kczk;
import com.jktech.service.KcgcService;
import com.opensymphony.xwork2.ActionSupport;

public class KcgcAction extends ActionSupport {

	private static final long serialVersionUID = 1925221031555604914L;
	private Kcgc kcgc = new Kcgc();
	private KcgcService<Kcgc> kcgcService;
	private List<Kcgc> kcgcs;
	private String searchText;
	private double latGCJ02;
	private double lngGCJ02;
	private List<Kczk> kczks;

	public double getLatGCJ02() {
		return latGCJ02;
	}

	public void setLatGCJ02(double latGCJ02) {
		this.latGCJ02 = latGCJ02;
	}

	public double getLngGCJ02() {
		return lngGCJ02;
	}

	public void setLngGCJ02(double lngGCJ02) {
		this.lngGCJ02 = lngGCJ02;
	}

	public KcgcAction() {
		// TODO Auto-generated constructor stub
	}

	public String query() {
		searchText = getParam("queryText");
		kcgcs = kcgcService.queryKcgcByName(searchText, Kcgc.class);
		return SUCCESS;
	}

	public String add() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				// kcgc.setId(0);
				kcgcService.addKcgc(kcgc);
				result = query();
			} else {
				result = "addKcgc";
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
				kcgcService.updateKcgc(kcgc);
			} else {
				if (getParam("id") != null) {
					Integer id = Integer.parseInt(getParam("id"));
					kcgc = kcgcService.getKcgc(Kcgc.class, id);
					kczks = kcgcService.getZkList(id);
				}
				return "gcinfo";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// System.out.println(this);
		return SUCCESS;
	}

	public void setKczks(List<Kczk> kczks) {
		this.kczks = kczks;
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			kcgcService.deleteKcgc(param, Kcgc.class);

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	public String updateCoordGCJ02() {
		try {
			Integer id = Integer.parseInt(getParam("id"));
			kcgcService.updateWGS2GCJ02(id, latGCJ02, lngGCJ02);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public Kcgc getKcgc() {
		return kcgc;
	}

	public void setKcgc(Kcgc kcgc) {
		this.kcgc = kcgc;
	}

	@JSON(serialize = false)
	public KcgcService<Kcgc> getKcgcService() {
		return kcgcService;
	}

	public void setKcgcService(KcgcService<Kcgc> kcgcService) {
		this.kcgcService = kcgcService;
	}

	public List<Kcgc> getKcgcs() {
		return kcgcs;
	}

	public void setKcgcs(List<Kcgc> kcgcs) {
		this.kcgcs = kcgcs;
	}

	@JSON(serialize = false)
	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public List<Kczk> getKczks() {
		return kczks;
	}
}
