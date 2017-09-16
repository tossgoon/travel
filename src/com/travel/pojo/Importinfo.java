package com.travel.pojo;

/**
 * Importinfo entity. @author MyEclipse Persistence Tools
 */

public class Importinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String tianbaodanwei;
	private String tianxieshijian;
	private String mingcheng;
	private String henjileixing;
	private String faxiandidian;
	private Double jingdu;
	private Double weidu;
	private String faxianshijian;
	private String faxianrenyuan;
	private String miaoshu;

	// Constructors

	/** default constructor */
	public Importinfo() {
	}

	/** full constructor */
	public Importinfo(String tianbaodanwei, String tianxieshijian,
			String mingcheng, String henjileixing, String faxiandidian,
			Double jingdu, Double weidu, String faxianshijian,
			String faxianrenyuan, String miaoshu) {
		this.tianbaodanwei = tianbaodanwei;
		this.tianxieshijian = tianxieshijian;
		this.mingcheng = mingcheng;
		this.henjileixing = henjileixing;
		this.faxiandidian = faxiandidian;
		this.jingdu = jingdu;
		this.weidu = weidu;
		this.faxianshijian = faxianshijian;
		this.faxianrenyuan = faxianrenyuan;
		this.miaoshu = miaoshu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTianbaodanwei() {
		return this.tianbaodanwei;
	}

	public void setTianbaodanwei(String tianbaodanwei) {
		this.tianbaodanwei = tianbaodanwei;
	}

	public String getTianxieshijian() {
		return this.tianxieshijian;
	}

	public void setTianxieshijian(String tianxieshijian) {
		this.tianxieshijian = tianxieshijian;
	}

	public String getMingcheng() {
		return this.mingcheng;
	}

	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}

	public String getHenjileixing() {
		return this.henjileixing;
	}

	public void setHenjileixing(String henjileixing) {
		this.henjileixing = henjileixing;
	}

	public String getFaxiandidian() {
		return this.faxiandidian;
	}

	public void setFaxiandidian(String faxiandidian) {
		this.faxiandidian = faxiandidian;
	}

	public Double getJingdu() {
		return this.jingdu;
	}

	public void setJingdu(Double jingdu) {
		this.jingdu = jingdu;
	}

	public Double getWeidu() {
		return this.weidu;
	}

	public void setWeidu(Double weidu) {
		this.weidu = weidu;
	}

	public String getFaxianshijian() {
		return this.faxianshijian;
	}

	public void setFaxianshijian(String faxianshijian) {
		this.faxianshijian = faxianshijian;
	}

	public String getFaxianrenyuan() {
		return this.faxianrenyuan;
	}

	public void setFaxianrenyuan(String faxianrenyuan) {
		this.faxianrenyuan = faxianrenyuan;
	}

	public String getMiaoshu() {
		return this.miaoshu;
	}

	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}

}