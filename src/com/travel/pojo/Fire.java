package com.travel.pojo;

import java.sql.Timestamp;

/**
 * Weather entity. @author MyEclipse Persistence Tools
 */

public class Fire implements java.io.Serializable {

	// Fields

	private Timestamp computedate;
	private double temprature;//最高气温
	private double parama;//指数A
	private double humidity;//最小湿度
	private double paramb;//指数B
	private double water;//降水量
	private double waterday;//雨雪后天数
	private double paramc;//指数C
	private double wind;//最大风速
	private double paramd;//指数D
	private double other;//非生物及非生物物候季节特征
	private double parame;//指数e
	private double htz;
	private double level;
	private String daystr;

	// Constructors

	/** default constructor */
	public Fire() {
	}


	public Fire(Timestamp computedate, double temprature, double parama,
			double humidity, double paramb, double water, double waterday,
			double paramc, double wind, double paramd, double other,
			double parame,double htz,double level) {
		super();
		this.computedate = computedate;
		this.temprature = temprature;
		this.parama = parama;
		this.humidity = humidity;
		this.paramb = paramb;
		this.water = water;
		this.waterday = waterday;
		this.paramc = paramc;
		this.wind = wind;
		this.paramd = paramd;
		this.other = other;
		this.parame = parame;
		this.htz=htz;
		this.level=level;
	}


	public Timestamp getComputedate() {
		return computedate;
	}


	public void setComputedate(Timestamp computedate) {
		this.computedate = computedate;
	}


	public double getTemprature() {
		return temprature;
	}


	public void setTemprature(double temprature) {
		this.temprature = temprature;
	}


	public double getParama() {
		return parama;
	}


	public void setParama(double parama) {
		this.parama = parama;
	}


	public double getHumidity() {
		return humidity;
	}


	public void setHumidity(double humidity) {
		this.humidity = humidity;
	}


	public double getParamb() {
		return paramb;
	}


	public void setParamb(double paramb) {
		this.paramb = paramb;
	}


	public double getWater() {
		return water;
	}


	public void setWater(double water) {
		this.water = water;
	}


	public double getWaterday() {
		return waterday;
	}


	public void setWaterday(double waterday) {
		this.waterday = waterday;
	}

	public double getParamc() {
		return paramc;
	}


	public void setParamc(double paramc) {
		this.paramc = paramc;
	}


	public double getWind() {
		return wind;
	}


	public void setWind(double wind) {
		this.wind = wind;
	}


	public double getParamd() {
		return paramd;
	}


	public void setParamd(double paramd) {
		this.paramd = paramd;
	}


	public double getOther() {
		return other;
	}


	public void setOther(double other) {
		this.other = other;
	}


	public double getParame() {
		return parame;
	}


	public void setParame(double parame) {
		this.parame = parame;
	}


	public double getHtz() {
		return htz;
	}


	public void setHtz(double htz) {
		this.htz = htz;
	}


	public double getLevel() {
		return level;
	}


	public void setLevel(double level) {
		this.level = level;
	}


	public String getDaystr() {
		return daystr;
	}


	public void setDaystr(String daystr) {
		this.daystr = daystr;
	}

}