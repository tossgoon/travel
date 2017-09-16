package com.travel.pojo;

/**
 * Camerasurvey entity. @author MyEclipse Persistence Tools
 */

public class Camerasurvey implements java.io.Serializable {

	// Fields

	private Integer id;
	private String xiangjibianhao;
	private String anzhuangriqi;
	private String anzhuangrenyuan;
	private String xiaodiming;
	private Double jingdu;
	private Double weidu;
	private String podu;
	private Double height;
	private String shengjingleixing;
	private String powei;
	private String poxiang;
	private String beizhu;

	// Constructors

	/** default constructor */
	public Camerasurvey() {
	}

	/** full constructor */
	public Camerasurvey(String xiangjibianhao, String anzhuangriqi,
			String anzhuangrenyuan, String xiaodiming, Double jingdu,
			Double weidu, String podu, Double height, String shengjingleixing,
			String powei, String poxiang, String beizhu) {
		this.xiangjibianhao = xiangjibianhao;
		this.anzhuangriqi = anzhuangriqi;
		this.anzhuangrenyuan = anzhuangrenyuan;
		this.xiaodiming = xiaodiming;
		this.jingdu = jingdu;
		this.weidu = weidu;
		this.podu = podu;
		this.height = height;
		this.shengjingleixing = shengjingleixing;
		this.powei = powei;
		this.poxiang = poxiang;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getXiangjibianhao() {
		return this.xiangjibianhao;
	}

	public void setXiangjibianhao(String xiangjibianhao) {
		this.xiangjibianhao = xiangjibianhao;
	}

	public String getAnzhuangriqi() {
		return this.anzhuangriqi;
	}

	public void setAnzhuangriqi(String anzhuangriqi) {
		this.anzhuangriqi = anzhuangriqi;
	}

	public String getAnzhuangrenyuan() {
		return this.anzhuangrenyuan;
	}

	public void setAnzhuangrenyuan(String anzhuangrenyuan) {
		this.anzhuangrenyuan = anzhuangrenyuan;
	}

	public String getXiaodiming() {
		return this.xiaodiming;
	}

	public void setXiaodiming(String xiaodiming) {
		this.xiaodiming = xiaodiming;
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

	public String getPodu() {
		return this.podu;
	}

	public void setPodu(String podu) {
		this.podu = podu;
	}

	public Double getHeight() {
		return this.height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public String getShengjingleixing() {
		return this.shengjingleixing;
	}

	public void setShengjingleixing(String shengjingleixing) {
		this.shengjingleixing = shengjingleixing;
	}

	public String getPowei() {
		return this.powei;
	}

	public void setPowei(String powei) {
		this.powei = powei;
	}

	public String getPoxiang() {
		return this.poxiang;
	}

	public void setPoxiang(String poxiang) {
		this.poxiang = poxiang;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

}