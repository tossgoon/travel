package com.travel.pojo;

import java.sql.Timestamp;

/**
 * Weather entity. @author MyEclipse Persistence Tools
 */

public class WeatherView implements java.io.Serializable {

	// Fields
	private Timestamp weatherdate;
	private String weatherdatestr;
	private String jiangyuliang;
	private String kongqiwendu;
	private String kongqishidu;
	private String daqiyali;
	private String guangheyouxiao;
	private String fengxiang;
	private String ziwaifushe;
	private String turangsuanjian;
	private String pm25;

	// Constructors

	/** default constructor */
	public WeatherView() {
	}

	public Timestamp getWeatherdate() {
		return weatherdate;
	}

	public void setWeatherdate(Timestamp weatherdate) {
		this.weatherdate = weatherdate;
	}

	public String getJiangyuliang() {
		return jiangyuliang;
	}

	public void setJiangyuliang(String jiangyuliang) {
		this.jiangyuliang = jiangyuliang;
	}

	public String getKongqiwendu() {
		return kongqiwendu;
	}

	public void setKongqiwendu(String kongqiwendu) {
		this.kongqiwendu = kongqiwendu;
	}

	public String getKongqishidu() {
		return kongqishidu;
	}

	public void setKongqishidu(String kongqishidu) {
		this.kongqishidu = kongqishidu;
	}

	public String getDaqiyali() {
		return daqiyali;
	}

	public void setDaqiyali(String daqiyali) {
		this.daqiyali = daqiyali;
	}

	public String getGuangheyouxiao() {
		return guangheyouxiao;
	}

	public void setGuangheyouxiao(String guangheyouxiao) {
		this.guangheyouxiao = guangheyouxiao;
	}

	public String getFengxiang() {
		return fengxiang;
	}

	public void setFengxiang(String fengxiang) {
		this.fengxiang = fengxiang;
	}

	public String getZiwaifushe() {
		return ziwaifushe;
	}

	public void setZiwaifushe(String ziwaifushe) {
		this.ziwaifushe = ziwaifushe;
	}

	public String getTurangsuanjian() {
		return turangsuanjian;
	}

	public void setTurangsuanjian(String turangsuanjian) {
		this.turangsuanjian = turangsuanjian;
	}

	public String getPm25() {
		return pm25;
	}

	public void setPm25(String pm25) {
		this.pm25 = pm25;
	}

	public String getWeatherdatestr() {
		return weatherdatestr;
	}

	public void setWeatherdatestr(String weatherdatestr) {
		this.weatherdatestr = weatherdatestr;
	}
	
}