package com.travel.pojo;

import java.sql.Timestamp;

/**
 * Weather entity. @author MyEclipse Persistence Tools
 */

public class Weather implements java.io.Serializable {

	// Fields

	private Integer id;
	private Timestamp weatherdate;
	private String leixing;
	private String eunit;
	private String evalue;
	private String ekey;
	private String ename;
	private String enum_;

	// Constructors

	/** default constructor */
	public Weather() {
	}

	/** full constructor */
	public Weather(Timestamp weatherdate, String leixing, String eunit,
			String evalue, String ekey, String ename, String enum_) {
		this.weatherdate = weatherdate;
		this.leixing = leixing;
		this.eunit = eunit;
		this.evalue = evalue;
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

	public String getEvalue() {
		return this.evalue;
	}

	public void setEvalue(String evalue) {
		this.evalue = evalue;
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

}