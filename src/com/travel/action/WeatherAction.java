package com.travel.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.User;
import com.travel.service.GeneralService;
import com.travel.service.UserService;

public class WeatherAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2962242812927252344L;
	private String errormsg;
	private String weatherdata;

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
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			String line;
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			System.out.println(sb.toString());
			in.close();
			setErrormsg("0");
			setWeatherdata(sb.toString());
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
}