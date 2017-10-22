package com.travel.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Fire;
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
	private Fire fire = new Fire();

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

	public String query() {
		String weinanaurl = "http://xsdz.veinasa.cn/intfa/queryData/16053404.json";
		StringBuffer sb = new StringBuffer();
		try {
			java.net.URL url = new java.net.URL(weinanaurl);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					url.openStream(), "utf-8"));
			String line;
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			System.out.println(sb.toString());
			in.close();
			setErrormsg("0");
			setWeatherdata(sb.toString());
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			this.datestr = format.format(new Date());
			return SUCCESS;
		} catch (Exception e) { // Report any errors that arise
			sb.append(e.toString());
			System.err.println(e);
			System.err
					.println("Usage:   java   HttpClient   <URL>   [<filename>]");
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

	public String queryweather() {
		if (getParam("id") != null) {
			Integer id = Integer.parseInt(getParam("id"));
			weather = weatherService.getObject(Weather.class, id);
		}
		return SUCCESS;
	}

	public String queryweatherlist() {
		try {
			weatherlist = this.weatherService.getObjectList(Weather.class);
			setErrormsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrormsg("出错。" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	/*
	 * public String queryWeatherByPage(){ int pagesize = 3; int pagenum = 1; if
	 * (getParam("pagesize") != null && getParam("pagenum") != null) { pagesize
	 * = Integer.parseInt(getParam("pagesize"));// 每页行数 pagenum =
	 * Integer.parseInt(getParam("pagenum"));// 页码 }
	 * this.weatherlist=weatherService.queryWeatherByPage(pagesize, pagenum);
	 * int num = weatherService.getWeatherCount(); page = new
	 * SplitPage(num,pagesize); page.setCurrentPage(pagenum); return SUCCESS; }
	 */

	public String queryWeatherListByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// 每页行数
			pagenum = Integer.parseInt(getParam("pagenum"));// 页码
		}
		wlist = weatherService.queryWeatherViewByPage(pagesize, pagenum);
		int num = weatherService.getWeatherViewCount();
		page = new SplitPage(num, pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}

	public List<WeatherView> getWlist() {
		return wlist;
	}

	public void setWlist(List<WeatherView> wlist) {
		this.wlist = wlist;
	}

	public String queryfireinfo() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 格式化
		String datestr;
		if (getParam("datestr") != null) {
			datestr = getParam("datestr");
		} else {
			datestr = sdf.format(new Date());
		}
		String daywater = this.weatherService.getWeatherWater(datestr);// 天数,降水量
		String[] dw = daywater.split(",");
		double day = 0;
		double water = 0;
		if (dw.length == 2) {
			day = Double.parseDouble(dw[0]);
			water = Double.parseDouble(dw[1]);
		}
		double temprature = this.weatherService.getWeatherTemprature(datestr);// 气温
		double humidity = this.weatherService.getWeatherHumidity(datestr);// 湿度
		double wind = this.weatherService.getWeatherWind(datestr);// 风力
		fire.setHumidity(humidity);
		fire.setTemprature(temprature);
		fire.setWater(water);
		fire.setWaterday(day);
		fire.setWind(wind);

		fire.setParama(this.getParama(temprature));
		fire.setParamb(this.getParamb(humidity));
		fire.setParamc(this.getParamc(water, day));
		fire.setParamd(this.getParamd(wind));
		fire.setDaystr(datestr);

		Date date = sdf.parse(datestr);
		fire.setParame(this.getParame(date));
		fire.setOther(fire.getParame());
		
		// 计算
		fire.computeLevel();
		if (getParam("flag") != null) {
			return "info";
		}
		return SUCCESS;
	}

	// 获取森林防火指数A
	private double getParama(double tempr) {
		if (tempr == -9999) {
			return -9999;
		}
		double parama = 0;
		if (tempr <= 5) {
			parama = 0;
		} else if (tempr <= 10) {
			parama = 4;
		} else if (tempr <= 15) {
			parama = 8;
		} else if (tempr <= 20) {
			parama = 12;
		} else if (tempr <= 25) {
			parama = 16;
		} else {
			parama = 20;
		}
		return parama;
	}

	// 获取森林防火指数B
	private double getParamb(double tempr) {
		if (tempr == -9999) {
			return -9999;
		}
		double parama = 0;
		if (tempr >= 71) {
			parama = 0;
		} else if (tempr >= 61) {
			parama = 4;
		} else if (tempr >= 51) {
			parama = 8;
		} else if (tempr >= 41) {
			parama = 12;
		} else if (tempr >= 31) {
			parama = 16;
		} else {
			parama = 20;
		}
		return parama;
	}

	// 获取森林防火指数C
	private double getParamc(double water, double day) {
		if (water == -9999 || day == -9999) {
			return -9999;
		}
		double paramc = 50;
		if (water < 0.3) {
			paramc = 50;
			return paramc;
		} else if (water < 2) {
			paramc = 10 + 5 * day;
		} else if (water < 5) {
			paramc = 5 + 5 * day;
		} else if (water < 10) {
			paramc = 0 + 5 * day;
		} else {
			if (day <= 1) {
				paramc = 0;
			} else {
				paramc = 5 + (day - 2) * 5;
			}
		}
		return paramc;
	}

	// 获取森林防火指数D
	private double getParamd(double tempr) {
		if (tempr == -9999) {
			return -9999;
		}
		double parama = 0;
		if (tempr <= 0.2) {
			parama = 0;
		} else if (tempr <= 1.5) {
			parama = 5;
		} else if (tempr <= 3.3) {
			parama = 10;
		} else if (tempr <= 5.4) {
			parama = 15;
		} else if (tempr <= 7.9) {
			parama = 20;
		} else if (tempr <= 10.7) {
			parama = 25;
		} else if (tempr <= 13.8) {
			parama = 30;
		} else if (tempr <= 17.1) {
			parama = 35;
		} else {
			parama = 40;
		}
		return parama;
	}

	private double getParame(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int month = cal.get(Calendar.MONTH)+1;
		double re = 0;
		if (month == 12 || month == 1 || month == 2) {
			re = 0;
		} else if (month == 3 || month == 10 || month == 11) {
			re = 5;
		} else if (month == 4 || month == 9) {
			re = 10;
		} else if (month == 5 || month == 8) {
			re = 15;
		} else if (month == 6 || month == 7) {
			re = 20;
		}
		return re;
	}

	public Fire getFire() {
		return fire;
	}

	public void setFire(Fire fire) {
		this.fire = fire;
	}
}