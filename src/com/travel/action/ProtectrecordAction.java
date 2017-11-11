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
import com.travel.pojo.Plantsurvey;
import com.travel.pojo.Protectrecord;
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class ProtectrecordAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2111424893973947271L;
	/**
	 * 
	 */
	private Protectrecord protect = new Protectrecord();
	private GeneralService<Protectrecord> protectService;
	private List<Protectrecord> protectlist;
	/* private UserService<User> userService; */
	private String errormsg;
	private SplitPage page;
	private InputStream inputStream;
	private String beginstr;
	private String endstr;
	private String exportname;

	private String maptype;
	private String mapstr;

	private String baohuzhan;
	private String dongwuming;

	public ProtectrecordAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	/*
	 * @JSON(serialize = false) public UserService<User> getUserService() {
	 * return userService; }
	 */

	public Protectrecord getProtect() {
		return protect;
	}

	public void setProtect(Protectrecord importinfo) {
		this.protect = importinfo;
	}

	@JSON(serialize = false)
	public GeneralService<Protectrecord> getProtectService() {
		return this.protectService;
	}

	public void setProtectService(GeneralService<Protectrecord> chickService) {
		this.protectService = chickService;
	}

	public List<Protectrecord> getProtectlist() {
		return this.protectlist;
	}

	public void setProtectlist(List<Protectrecord> chicklist) {
		this.protectlist = chicklist;
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
			this.protectService.addObject(protect);
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
			this.protectService.updateObject(protect);
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
		if (protect.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.protectService.deleteObject(param, Protectrecord.class);
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
			protect = this.protectService.getObject(Protectrecord.class, id);
		}
		return SUCCESS;
	}

	public String querylist() {
		try {
			this.protectlist = this.protectService
					.getObjectList(Protectrecord.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
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
		// 群系名
		String p1 = "";
		if (getParam("p1") != null) {
			p1 = getParam("p1");
			this.baohuzhan = p1;
		}
		// 树种名
		String p2 = "";
		if (getParam("p2") != null) {
			p2 = getParam("p2");
			this.dongwuming = p2;
		}

		try {
			this.protectlist = this.protectService.getProtectListPage(
					begindate, enddate, p1, p2, pagesize, pagenum);
			int num = this.protectService.getProtectCount(begindate, enddate,
					p1, p2);
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
		// 群系名
		String p1 = "";
		if (getParam("p1") != null) {
			p1 = getParam("p1");
			this.baohuzhan = p1;
		}
		// 树种名
		String p2 = "";
		if (getParam("p2") != null) {
			p2 = getParam("p2");
			this.dongwuming = p2;
		}
		try {
			this.protectlist = this.protectService.getProtectList(begindate,
					enddate, p1, p2);
			String str = "id,保护站名称,记录人,巡护日期,时间,天气,大地名,巡护人员,东至,西至,南至,北至,动物名称,数量,经度,纬度,海拔,生境类型,人为活动类型,干扰描述,干扰经度,干扰纬度,干扰海拔,干扰生境类型\r\n";
			for (int i = 0; i < this.protectlist.size(); i++) {
				Protectrecord an = protectlist.get(i);
				str += an.getId() + "," + an.getBaohuzhanmingcheng() + ","
						+ an.getJiluren() + "," + an.getXunhudatestr() + ","
						+ an.getDatestr() + "," + an.getTianqi() + ","
						+ an.getDadiming() + "," + an.getXunhurenyuan() + ","
						+ an.getDongzhi() + "," + an.getXizhi() + ","
						+ an.getNanzhi() + "," + an.getBeizhi() + ","
						+ an.getDongwumingcheng() + "," + an.getShuliang()
						+ "," + an.getJingdu() + "," + an.getWeidu() + ","
						+ an.getHaiba() + "," + an.getShengjingleixing() + ","
						+ an.getRenweihuodongleixing() + ","
						+ an.getGanraomiaoshu() + "," + an.getGanraojingdu()
						+ "," + an.getGanraoweidu() + "," + an.getGanraohaiba()
						+ "," + an.getGanraoshengjingleixing() + "\r\n";
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
		// 群系名
		String p1 = "";
		if (getParam("p1") != null) {
			p1 = getParam("p1");
			this.baohuzhan = p1;
		}
		// 树种名
		String p2 = "";
		if (getParam("p2") != null) {
			p2 = getParam("p2");
			this.dongwuming = p2;
		}
		try {

			List<Protectrecord> datalist = this.protectService.getProtectList(
					begindate, enddate, p1, p2);
			StringWriter swr = new StringWriter();
			ObjectMapper objMapper = new ObjectMapper();
			objMapper.writeValue(swr, datalist);
			this.setMapstr(swr.toString());
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
		exportname = timestr + "保护区巡护记录.txt";
		this.exportname = new String(exportname.getBytes("utf-8"), "ISO8859-1");
		return exportname;
	}

	public void setExportname(String exportname) {
		this.exportname = exportname;
	}

	public String getMaptype() {
		return "6";
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

	public String getBaohuzhan() {
		return baohuzhan;
	}

	public void setBaohuzhan(String baohuzhan) {
		this.baohuzhan = baohuzhan;
	}

	public String getDongwuming() {
		return dongwuming;
	}

	public void setDongwuming(String dongwuming) {
		this.dongwuming = dongwuming;
	}
}