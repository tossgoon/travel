package com.travel.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.codehaus.jackson.map.ObjectMapper;

import com.base.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Camerasurvey;
import com.travel.pojo.Chicksurvey;
import com.travel.pojo.Importinfo;
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class ImportinfoAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7221637156146403587L;
	/**
	 * 
	 */

	private Importinfo importinfo = new Importinfo();
	private GeneralService<Importinfo> importinfoService;
	private List<Importinfo> importinfolist;
	/* private UserService<User> userService; */
	private String errormsg;
	private SplitPage page;
	private InputStream inputStream;
	private String beginstr;
	private String endstr;

	private String faxianbegin;
	private String faxianend;
	private String faxiandidian;
	private String faxianrenyuan;
	private String mingcheng;
	private String tianbaodanwei;
	private String exportname;
	
	private String maptype;
	private String mapstr;

	public ImportinfoAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	/*
	 * @JSON(serialize = false) public UserService<User> getUserService() {
	 * return userService; }
	 */

	public Importinfo getImportinfo() {
		return importinfo;
	}

	public void setImportinfo(Importinfo importinfo) {
		this.importinfo = importinfo;
	}

	@JSON(serialize = false)
	public GeneralService<Importinfo> getImportinfoService() {
		return this.importinfoService;
	}

	public void setImportinfoService(GeneralService<Importinfo> chickService) {
		this.importinfoService = chickService;
	}

	public List<Importinfo> getImportinfolist() {
		return this.importinfolist;
	}

	public void setImportinfolist(List<Importinfo> chicklist) {
		this.importinfolist = chicklist;
	}

	/*
	 * public void setUserService(UserService<User> userService) {
	 * this.userService = userService; }
	 */

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String add() {
		String result = "";
		try {
			this.importinfoService.addObject(importinfo);
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
			this.importinfoService.updateObject(importinfo);
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
		if (importinfo.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.importinfoService.deleteObject(param, Importinfo.class);
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
			importinfo = importinfoService.getObject(Importinfo.class, id);
		}
		return SUCCESS;
	}

	public String querylist() {
		try {
			this.importinfolist = this.importinfoService
					.getObjectList(Importinfo.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("删除出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String querypagelist() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		Timestamp begindate;// 开始日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (getParam("begindate") != null) {
			this.beginstr = getParam("begindate");
			String beginstr = getParam("begindate") + " 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		}
		Timestamp enddate;// 结束日期
		if (getParam("enddate") != null) {
			this.endstr = getParam("enddate");
			String endstr = getParam("enddate") + " 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		}

		Timestamp p1;// 开始日期
		if (getParam("p1") != null && (!getParam("p1").equals(""))) {
			this.faxianbegin = getParam("p1");
			String beginstr = this.faxianbegin + " 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		}
		Timestamp p2;// 结束日期
		if (getParam("p2") != null && (!getParam("p2").equals(""))) {
			this.faxianend = getParam("p2");
			String endstr = this.faxianend + " 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		}
		// 发现地点
		String p3 = "";// 发现地点
		if (getParam("p3") != null) {
			p3 = getParam("p3");
			this.faxiandidian = p3;
		}
		// 发现人员
		String p4 = "";// 发现人员
		if (getParam("p4") != null) {
			p4 = getParam("p4");
			this.faxianrenyuan = p4;
		}
		// 发现地点
		String p5 = "";// 发现地点
		if (getParam("p5") != null) {
			p5 = getParam("p5");
			this.mingcheng = p5;
		}
		// 发现人员
		String p6 = "";// 发现人员
		if (getParam("p6") != null) {
			p6 = getParam("p6");
			this.tianbaodanwei = p6;
		}

		try {
			this.importinfolist = this.importinfoService.getImportListPage(
					begindate, enddate, p1, p2, p3, p4, p5, p6, pagesize,
					pagenum);
			int num = this.importinfoService.getImportCount(begindate, enddate,
					p1, p2, p3, p4, p5, p6);
			page = new SplitPage(num, pagesize);
			page.setCurrentPage(pagenum);

		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String export() throws Exception {
		// 时间
		Timestamp begindate;// 开始日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (getParam("begindate") != null) {
			String beginstr = getParam("begindate") + " 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		}
		Timestamp enddate;// 结束日期
		if (getParam("enddate") != null) {
			String endstr = getParam("enddate") + " 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		}
		Timestamp p1;// 开始日期
		if (getParam("p1") != null && (!getParam("p1").equals(""))) {
			this.faxianbegin = getParam("p1");
			String beginstr = this.faxianbegin + " 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		}
		Timestamp p2;// 结束日期
		if (getParam("p2") != null && (!getParam("p2").equals(""))) {
			this.faxianend = getParam("p2");
			String endstr = this.faxianend + " 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		}
		// 发现地点
		String p3 = "";// 发现地点
		if (getParam("p3") != null) {
			p3 = getParam("p3");
			this.faxiandidian = p3;
		}
		// 发现人员
		String p4 = "";// 发现人员
		if (getParam("p4") != null) {
			p4 = getParam("p4");
			this.faxianrenyuan = p4;
		}
		// 发现地点
		String p5 = "";// 发现地点
		if (getParam("p5") != null) {
			p5 = getParam("p5");
			this.mingcheng = p5;
		}
		// 发现人员
		String p6 = "";// 发现人员
		if (getParam("p6") != null) {
			p6 = getParam("p6");
			this.tianbaodanwei = p6;
		}
		try {
			this.importinfolist = this.importinfoService.getImportList(
					begindate, enddate, p1, p2, p3, p4, p5, p6);
			String str = "id,填报单位,填写时间,名称,痕迹类型,发现地点,经度,纬度,发现时间,发现人员,描述\r\n";
			for (int i = 0; i < this.importinfolist.size(); i++) {
				Importinfo an = importinfolist.get(i);
				str += an.getId() + "," + an.getTianbaodanwei() + ","
						+ an.getDatestr() + "," + an.getMingcheng() + ","
						+ an.getHenjileixing() + "," + an.getFaxiandidian()
						+ "," + an.getJingdu() + "," + an.getWeidu() + ","
						+ an.getFaxiandatestr() + "," + an.getFaxianrenyuan()
						+ "," + an.getMiaoshu() + "\r\n";
			}
			this.inputStream = new ByteArrayInputStream(str.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String showmap() throws Exception {
		// 时间
		Timestamp begindate;// 开始日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (getParam("begindate") != null) {
			String beginstr = getParam("begindate") + " 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		}
		Timestamp enddate;// 结束日期
		if (getParam("enddate") != null) {
			String endstr = getParam("enddate") + " 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		}
		Timestamp p1;// 开始日期
		if (getParam("p1") != null && (!getParam("p1").equals(""))) {
			this.faxianbegin = getParam("p1");
			String beginstr = this.faxianbegin + " 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			p1 = Timestamp.valueOf(beginstr);
		}
		Timestamp p2;// 结束日期
		if (getParam("p2") != null && (!getParam("p2").equals(""))) {
			this.faxianend = getParam("p2");
			String endstr = this.faxianend + " 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			p2 = Timestamp.valueOf(endstr);
		}
		// 发现地点
		String p3 = "";// 发现地点
		if (getParam("p3") != null) {
			p3 = getParam("p3");
			this.faxiandidian = p3;
		}
		// 发现人员
		String p4 = "";// 发现人员
		if (getParam("p4") != null) {
			p4 = getParam("p4");
			this.faxianrenyuan = p4;
		}
		// 发现地点
		String p5 = "";// 发现地点
		if (getParam("p5") != null) {
			p5 = getParam("p5");
			this.mingcheng = p5;
		}
		// 发现人员
		String p6 = "";// 发现人员
		if (getParam("p6") != null) {
			p6 = getParam("p6");
			this.tianbaodanwei = p6;
		}
		try {
			 List<Importinfo>	datalist = this.importinfoService.getImportList(
					begindate, enddate, p1, p2, p3, p4, p5, p6);
			
			StringWriter swr=new StringWriter();
			ObjectMapper objMapper=new ObjectMapper();
			objMapper.writeValue(swr, datalist);
			this.mapstr=swr.toString();
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getBeginstr() {
		return beginstr;
	}

	public void setBeginstr(String beginstr) {
		this.beginstr = beginstr;
	}

	public String getEndstr() {
		return endstr;
	}

	public void setEndstr(String endstr) {
		this.endstr = endstr;
	}

	public String getExportname() throws UnsupportedEncodingException {
		String timestr = new java.text.SimpleDateFormat("yyyyMMddhhmmss")
				.format(new Date());
		exportname = timestr + "动植物相关重要信息.txt";
		this.exportname = new String(exportname.getBytes("utf-8"), "ISO8859-1");
		return exportname;
	}

	public void setExportname(String exportname) {
		this.exportname = exportname;
	}

	public String getFaxianbegin() {
		return faxianbegin;
	}

	public void setFaxianbegin(String faxianbegin) {
		this.faxianbegin = faxianbegin;
	}

	public String getFaxianend() {
		return faxianend;
	}

	public void setFaxianend(String faxianend) {
		this.faxianend = faxianend;
	}

	public String getFaxiandidian() {
		return faxiandidian;
	}

	public void setFaxiandidian(String faxiandidian) {
		this.faxiandidian = faxiandidian;
	}

	public String getFaxianrenyuan() {
		return faxianrenyuan;
	}

	public void setFaxianrenyuan(String faxianrenyuan) {
		this.faxianrenyuan = faxianrenyuan;
	}

	public String getMingcheng() {
		return mingcheng;
	}

	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}

	public String getTianbaodanwei() {
		return tianbaodanwei;
	}

	public void setTianbaodanwei(String tianbaodanwei) {
		this.tianbaodanwei = tianbaodanwei;
	}

	public String getMaptype() {
		return "5";
	}

	public void setMaptype(String maptype) {
		this.maptype = maptype;
	}

	public String getMapstr() {
		return mapstr;
	}

	public void setMapstr(String mapstr) {
		this.mapstr = mapstr;
	}

}