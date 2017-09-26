package com.travel.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Weather;
import com.travel.pojo.WeatherView;
import com.travel.service.WeatherService;

public class WeatherAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2962242812927252344L;
	private String errormsg;
	private String weatherdata;
	private String datestr;
	private Weather weather;
	private WeatherService<Weather> weatherService;
	private List<Weather> weatherlist;
	private SplitPage page;
    public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}

	private List<WeatherView> wlist;
	public WeatherAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String query(){
		String weinanaurl="http://xsdz.veinasa.cn/intfa/queryData/16053404.json";
		StringBuffer sb = new StringBuffer();
		try {
			java.net.URL url = new java.net.URL(weinanaurl);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
			String line;
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			System.out.println(sb.toString());
			in.close();
			setErrormsg("0");
			setWeatherdata(sb.toString());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			this.datestr = format.format(new Date());
			return SUCCESS;
		} catch (Exception e) { // Report any errors that arise
			sb.append(e.toString());
			System.err.println(e);
			System.err.println("Usage:   java   HttpClient   <URL>   [<filename>]");
			setErrormsg(e.getMessage());
			setWeatherdata(sb.toString());
			return ERROR;
		}
	}

	public String getWeatherdata() {
		return weatherdata;
	}

	public void setWeatherdata(String weatherdata) {
		this.weatherdata = weatherdata;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String getDatestr() {
		return datestr;
	}

	public void setDatestr(String datestr) {
		this.datestr = datestr;
	}

	public Weather getWeather() {
		return weather;
	}

	public void setWeather(Weather weather) {
		this.weather = weather;
	}

	@JSON(serialize = false)
	public WeatherService<Weather> getWeatherService() {
		return weatherService;
	}

	public void setWeatherService(WeatherService<Weather> weatherService) {
		this.weatherService = weatherService;
	}

	public List<Weather> getWeatherlist() {
		return weatherlist;
	}

	public void setWeatherlist(List<Weather> weatherlist) {
		this.weatherlist = weatherlist;
	}
	
	public String add() {
		String result = "";
		try {
			this.weatherService.addObject(weather);
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
	
	public String queryweather(){
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			weather = weatherService.getObject(Weather.class, id);
		}
		return SUCCESS;
	}
	
	public String queryweatherlist(){
		try {
			weatherlist=this.weatherService.getObjectList(Weather.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
/*	public String queryWeatherByPage(){
		int pagesize = 3;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		this.weatherlist=weatherService.queryWeatherByPage(pagesize, pagenum);
		int num = weatherService.getWeatherCount();
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}*/

	public String queryWeatherListByPage(){
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		wlist=weatherService.queryWeatherViewByPage(pagesize, pagenum);
		int num = weatherService.getWeatherViewCount();
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}

	public List<WeatherView> getWlist() {
		return wlist;
	}

	public void setWlist(List<WeatherView> wlist) {
		this.wlist = wlist;
	}
}