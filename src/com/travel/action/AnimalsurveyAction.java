package com.travel.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.travel.pojo.Oafile;
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class AnimalsurveyAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2871113028472366475L;
	/**
	 * 
	 */
	private Animalsurvey animal = new Animalsurvey();
	private GeneralService<Animalsurvey> animalService;
	private List<Animalsurvey> animallist;
	/* private UserService<User> userService; */
	private String errormsg;
	private SplitPage page;
	private InputStream inputStream;
	private String beginstr;
	private String endstr;
	private String jianceren;
	private String dongwumingcheng;
	private String shengjingleixing;
	private String exportname;
	private String maptype;
	private String mapstr;
	public AnimalsurveyAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	/*
	 * @JSON(serialize = false) public UserService<User> getUserService() {
	 * return userService; }
	 */

	public Animalsurvey getAnimal() {
		return animal;
	}

	public void setAnimal(Animalsurvey animal) {
		this.animal = animal;
	}

	@JSON(serialize = false)
	public GeneralService<Animalsurvey> getAnimalService() {
		return animalService;
	}

	public void setAnimalService(GeneralService<Animalsurvey> animalService) {
		this.animalService = animalService;
	}

	public List<Animalsurvey> getAnimallist() {
		return animallist;
	}

	public void setAnimallist(List<Animalsurvey> animallist) {
		this.animallist = animallist;
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
			this.animalService.addObject(animal);
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
			this.animalService.updateObject(animal);
			setErrormsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrormsg("更新出错。" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}

	public String saveanimal() {
		if (animal.getId() == null) {
			return add();
		} else {
			return update();
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			this.animalService.deleteObject(param, Animalsurvey.class);
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
			animal = animalService.getObject(Animalsurvey.class, id);
		}
		return SUCCESS;
	}

	public String querylist() {
		try {
			animallist = this.animalService.getObjectList(Animalsurvey.class);
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
			this.beginstr=getParam("begindate");
			String beginstr = getParam("begindate") + " 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		} else {
			String beginstr = "2000-1-1 0:00:00";
			begindate = Timestamp.valueOf(beginstr);
		}
		Timestamp enddate;// 结束日期
		if (getParam("enddate") != null) {
			this.endstr=getParam("enddate");
			String endstr = getParam("enddate") + " 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		} else {
			String endstr = "3999-12-12 23:59:59";
			enddate = Timestamp.valueOf(endstr);
		}
		//监测人
		String p1="";//监测人
		if (getParam("jianceren") != null) {
			p1=getParam("jianceren");
			this.jianceren=p1;
		} 
		//动物名称
		String p2="";//动物名称
		if (getParam("dongwumingcheng") != null) {
			p2=getParam("dongwumingcheng");
			this.dongwumingcheng=p2;
		} 
		//生境类型
		String p3="";//生境类型
		if (getParam("shengjingleixing") != null) {
			p3=getParam("shengjingleixing");
			this.shengjingleixing=p3;
		} 
		try {
			this.animallist = this.animalService.getAnimalListPage(begindate,
					enddate,p1,p2,p3, pagesize, pagenum);
			int num = this.animalService.getAnimalCount(begindate, enddate,p1,p2,p3);
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
		// 监测人
		String p1 = "";// 监测人
		if (getParam("jianceren") != null) {
			p1 = getParam("jianceren");
			this.jianceren = p1;
		}
		// 动物名称
		String p2 = "";// 动物名称
		if (getParam("dongwumingcheng") != null) {
			p2 = getParam("dongwumingcheng");
			this.dongwumingcheng = p2;
		}
		// 生境类型
		String p3 = "";// 生境类型
		if (getParam("shengjingleixing") != null) {
			p3 = getParam("shengjingleixing");
			this.shengjingleixing = p3;
		}
		try {
			this.animallist = this.animalService.getAnimalList(begindate,
					enddate,p1,p2,p3);
			String str = "id,样线号,填表时间,天气,监测人,动物名称,实体数量,尸体数量,粪便,生境类型,经度,纬度,海拔高度,备注\r\n";
			for (int i = 0; i < animallist.size(); i++) {
				Animalsurvey an = animallist.get(i);
				str += an.getId() + "," + an.getYangxianhao() + ","
						+ an.getDatestr() + "," + an.getTianqi() + ","
						+ an.getJianceren() + "," + an.getDongwumingcheng()
						+ "," + an.getShitishuliang() + ","
						+ an.getBodyshuliang() + "," + an.getFenbian() + ","
						+ an.getShengjingleixing() + "," + an.getJingdu() + ","
						+ an.getWeidu() + "," + an.getHeight() + ","
						+ an.getBeizhu()+"\r\n";
			}
            this.inputStream=new ByteArrayInputStream(str.getBytes());
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
		// 监测人
		String p1 = "";// 监测人
		if (getParam("jianceren") != null) {
			p1 = getParam("jianceren");
			this.jianceren = p1;
		}
		// 动物名称
		String p2 = "";// 动物名称
		if (getParam("dongwumingcheng") != null) {
			p2 = getParam("dongwumingcheng");
			this.dongwumingcheng = p2;
		}
		// 生境类型
		String p3 = "";// 生境类型
		if (getParam("shengjingleixing") != null) {
			p3 = getParam("shengjingleixing");
			this.shengjingleixing = p3;
		}
		try {
			List<Animalsurvey> datalist = this.animalService.getAnimalList(
					begindate, enddate, p1, p2, p3);
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

	public InputStream getInputStream() throws UnsupportedEncodingException {
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
		String timestr=new java.text.SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		exportname=timestr+"动物状况监测.txt";
		this.exportname =  new String(exportname.getBytes("utf-8"),"ISO8859-1");
		return exportname;
	}

	public void setExportname(String exportname) {
		this.exportname = exportname;
	}

	public String getJianceren() {
		return jianceren;
	}

	public void setJianceren(String jianceren) {
		this.jianceren = jianceren;
	}

	public String getDongwumingcheng() {
		return dongwumingcheng;
	}

	public void setDongwumingcheng(String dongwumingcheng) {
		this.dongwumingcheng = dongwumingcheng;
	}

	public String getShengjingleixing() {
		return shengjingleixing;
	}

	public void setShengjingleixing(String shengjingleixing) {
		this.shengjingleixing = shengjingleixing;
	}

	public String getMaptype() {
		return "3";
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