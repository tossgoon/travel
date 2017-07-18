package com.jktech.pojo;

// default package

/**
 * Kctc entity. @author MyEclipse Persistence Tools
 */

public class Kctc implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer zkId;
	private Integer dcId;
	private Double cengdiDepth;
	private Double pingjunbosu;
	private Double pingjunzhuijianzl;
	private Double pingjuncebimzl;
	private Double pingjunbiguanrzl;
	private String beizhu;
	private String tcname;

	// Constructors

	/** default constructor */
	public Kctc() {
	}

	/** full constructor */
	public Kctc(Integer zkId, Integer dcId, Double cengdiDepth,
			Double pingjunbosu, Double pingjunzhuijianzl,
			Double pingjuncebimzl, Double pingjunbiguanrzl, String beizhu) {
		this.zkId = zkId;
		this.dcId = dcId;
		this.cengdiDepth = cengdiDepth;
		this.pingjunbosu = pingjunbosu;
		this.pingjunzhuijianzl = pingjunzhuijianzl;
		this.pingjuncebimzl = pingjuncebimzl;
		this.pingjunbiguanrzl = pingjunbiguanrzl;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getZkId() {
		return this.zkId;
	}

	public void setZkId(Integer zkId) {
		this.zkId = zkId;
	}

	public Integer getDcId() {
		return this.dcId;
	}

	public void setDcId(Integer dcId) {
		this.dcId = dcId;
	}

	public Double getCengdiDepth() {
		return this.cengdiDepth;
	}

	public void setCengdiDepth(Double cengdiDepth) {
		this.cengdiDepth = cengdiDepth;
	}

	public Double getPingjunbosu() {
		return this.pingjunbosu;
	}

	public void setPingjunbosu(Double pingjunbosu) {
		this.pingjunbosu = pingjunbosu;
	}

	public Double getPingjunzhuijianzl() {
		return this.pingjunzhuijianzl;
	}

	public void setPingjunzhuijianzl(Double pingjunzhuijianzl) {
		this.pingjunzhuijianzl = pingjunzhuijianzl;
	}

	public Double getPingjuncebimzl() {
		return this.pingjuncebimzl;
	}

	public void setPingjuncebimzl(Double pingjuncebimzl) {
		this.pingjuncebimzl = pingjuncebimzl;
	}

	public Double getPingjunbiguanrzl() {
		return this.pingjunbiguanrzl;
	}

	public void setPingjunbiguanrzl(Double pingjunbiguanrzl) {
		this.pingjunbiguanrzl = pingjunbiguanrzl;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getTcname() {
		return tcname;
	}

	public void setTcname(String tcname) {
		this.tcname = tcname;
	}

}