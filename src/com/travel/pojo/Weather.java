package com.travel.pojo;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Weather entity. @author MyEclipse Persistence Tools
 */

public class Weather implements java.io.Serializable {

	// Fields

	private Integer id;
	private Timestamp weatherdate;
	private String leixing;
	private String eunit;
	private Double evalue;
	private String ekey;
	private String ename;
	private String enum_;
	private String weatherday;//日期格式

	// Constructors

	/** default constructor */
	public Weather() {
	}

	/** full constructor */
	public Weather(Timestamp weatherdate, String leixing, String eunit,
			Double evalue, String ekey, String ename, String enum_) {
		this.weatherdate = weatherdate;
		this.leixing = leixing;
		this.eunit = eunit;
		this.setEvalue(evalue);
		this.ekey = ekey;
		this.ename = ename;
		this.enum_ = enum_;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getWeatherdate() {
		return this.weatherdate;
	}

	public void setWeatherdate(Timestamp weatherdate) {
		this.weatherdate = weatherdate;
	}

	public String getLeixing() {
		return this.leixing;
	}

	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}

	public String getEunit() {
		return this.eunit;
	}

	public void setEunit(String eunit) {
		this.eunit = eunit;
	}

	public String getEkey() {
		return this.ekey;
	}

	public void setEkey(String ekey) {
		this.ekey = ekey;
	}

	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEnum_() {
		return this.enum_;
	}

	public void setEnum_(String enum_) {
		this.enum_ = enum_;
	}

	public Double getEvalue() {
		return evalue;
	}

	public void setEvalue(Double evalue) {
		this.evalue = evalue;
	}

	public String getWeatherday() {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
        try {   
          String  tsStr = sdf.format(this.weatherdate);   
          return tsStr;
        } catch (Exception e) {   
            e.printStackTrace();   
        }  
        return weatherday;
	}

	public void setWeatherday(String weatherday) {
		this.weatherday = weatherday;
	}

}