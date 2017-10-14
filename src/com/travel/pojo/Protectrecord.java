package com.travel.pojo;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Protectrecord entity. @author MyEclipse Persistence Tools
 */

public class Protectrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private String baohuzhanmingcheng;
	private String jiluren;
	private Timestamp xunhuriqi;
	private Timestamp shijian;
	private String tianqi;
	private String dadiming;
	private String xunhurenyuan;
	private String dongzhi;
	private String xizhi;
	private String nanzhi;
	private String beizhi;
	private String dongwumingcheng;
	private String shuliang;
	private Double jingdu;
	private Double weidu;
	private Double haiba;
	private String shengjingleixing;
	private String renweihuodongleixing;
	private String ganraomiaoshu;
	private Double ganraojingdu;
	private Double ganraoweidu;
	private Double ganraohaiba;
	private String ganraoshengjingleixing;
	private String datestr;
	private String xunhudatestr;

	// Constructors

	/** default constructor */
	public Protectrecord() {
	}

	/** full constructor */
	public Protectrecord(String baohuzhanmingcheng, String jiluren,
			Timestamp xunhuriqi, Timestamp shijian, String tianqi, String dadiming,
			String xunhurenyuan, String dongzhi, String xizhi, String nanzhi,
			String beizhi, String dongwumingcheng, String shuliang,
			Double jingdu, Double weidu, Double haiba, String shengjingleixing,
			String renweihuodongleixing, String ganraomiaoshu,
			Double ganraojingdu, Double ganraoweidu, Double ganraohaiba,
			String ganraoshengjingleixing) {
		this.baohuzhanmingcheng = baohuzhanmingcheng;
		this.jiluren = jiluren;
		this.xunhuriqi = xunhuriqi;
		this.shijian = shijian;
		this.tianqi = tianqi;
		this.dadiming = dadiming;
		this.xunhurenyuan = xunhurenyuan;
		this.dongzhi = dongzhi;
		this.xizhi = xizhi;
		this.nanzhi = nanzhi;
		this.beizhi = beizhi;
		this.dongwumingcheng = dongwumingcheng;
		this.shuliang = shuliang;
		this.jingdu = jingdu;
		this.weidu = weidu;
		this.haiba = haiba;
		this.shengjingleixing = shengjingleixing;
		this.renweihuodongleixing = renweihuodongleixing;
		this.ganraomiaoshu = ganraomiaoshu;
		this.ganraojingdu = ganraojingdu;
		this.ganraoweidu = ganraoweidu;
		this.ganraohaiba = ganraohaiba;
		this.ganraoshengjingleixing = ganraoshengjingleixing;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBaohuzhanmingcheng() {
		return this.baohuzhanmingcheng;
	}

	public void setBaohuzhanmingcheng(String baohuzhanmingcheng) {
		this.baohuzhanmingcheng = baohuzhanmingcheng;
	}

	public String getJiluren() {
		return this.jiluren;
	}

	public void setJiluren(String jiluren) {
		this.jiluren = jiluren;
	}


	public Timestamp getXunhuriqi() {
		return xunhuriqi;
	}

	public void setXunhuriqi(Timestamp xunhuriqi) {
		this.xunhuriqi = xunhuriqi;
	}

	public Timestamp getShijian() {
		return shijian;
	}

	public void setShijian(Timestamp shijian) {
		this.shijian = shijian;
	}

	public String getTianqi() {
		return this.tianqi;
	}

	public void setTianqi(String tianqi) {
		this.tianqi = tianqi;
	}

	public String getDadiming() {
		return this.dadiming;
	}

	public void setDadiming(String dadiming) {
		this.dadiming = dadiming;
	}

	public String getXunhurenyuan() {
		return this.xunhurenyuan;
	}

	public void setXunhurenyuan(String xunhurenyuan) {
		this.xunhurenyuan = xunhurenyuan;
	}

	public String getDongzhi() {
		return this.dongzhi;
	}

	public void setDongzhi(String dongzhi) {
		this.dongzhi = dongzhi;
	}

	public String getXizhi() {
		return this.xizhi;
	}

	public void setXizhi(String xizhi) {
		this.xizhi = xizhi;
	}

	public String getNanzhi() {
		return this.nanzhi;
	}

	public void setNanzhi(String nanzhi) {
		this.nanzhi = nanzhi;
	}

	public String getBeizhi() {
		return this.beizhi;
	}

	public void setBeizhi(String beizhi) {
		this.beizhi = beizhi;
	}

	public String getDongwumingcheng() {
		return this.dongwumingcheng;
	}

	public void setDongwumingcheng(String dongwumingcheng) {
		this.dongwumingcheng = dongwumingcheng;
	}

	public String getShuliang() {
		return this.shuliang;
	}

	public void setShuliang(String shuliang) {
		this.shuliang = shuliang;
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

	public Double getHaiba() {
		return this.haiba;
	}

	public void setHaiba(Double haiba) {
		this.haiba = haiba;
	}

	public String getShengjingleixing() {
		return this.shengjingleixing;
	}

	public void setShengjingleixing(String shengjingleixing) {
		this.shengjingleixing = shengjingleixing;
	}

	public String getRenweihuodongleixing() {
		return this.renweihuodongleixing;
	}

	public void setRenweihuodongleixing(String renweihuodongleixing) {
		this.renweihuodongleixing = renweihuodongleixing;
	}

	public String getGanraomiaoshu() {
		return this.ganraomiaoshu;
	}

	public void setGanraomiaoshu(String ganraomiaoshu) {
		this.ganraomiaoshu = ganraomiaoshu;
	}

	public Double getGanraojingdu() {
		return this.ganraojingdu;
	}

	public void setGanraojingdu(Double ganraojingdu) {
		this.ganraojingdu = ganraojingdu;
	}

	public Double getGanraoweidu() {
		return this.ganraoweidu;
	}

	public void setGanraoweidu(Double ganraoweidu) {
		this.ganraoweidu = ganraoweidu;
	}

	public Double getGanraohaiba() {
		return this.ganraohaiba;
	}

	public void setGanraohaiba(Double ganraohaiba) {
		this.ganraohaiba = ganraohaiba;
	}

	public String getGanraoshengjingleixing() {
		return this.ganraoshengjingleixing;
	}

	public void setGanraoshengjingleixing(String ganraoshengjingleixing) {
		this.ganraoshengjingleixing = ganraoshengjingleixing;
	}

	public String getDatestr() {
		if(this.shijian!=null)
		{
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
			datestr=sdf.format(this.shijian); 
		}
		return datestr;
	}

	public void setDatestr(String datestr) {
		this.datestr = datestr;
	}

	public String getXunhudatestr() {
		if(this.xunhuriqi!=null)
		{
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
			xunhudatestr=sdf.format(this.xunhuriqi); 
		}
		return xunhudatestr;
	}

	public void setXunhudatestr(String xunhudatestr) {
		this.xunhudatestr = xunhudatestr;
	}

}