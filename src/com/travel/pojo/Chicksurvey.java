package com.travel.pojo;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Chicksurvey entity. @author MyEclipse Persistence Tools
 */

public class Chicksurvey implements java.io.Serializable {

	// Fields

	private Integer id;
	private String baohuqu;
	private String baohuzhan;
	private String xiaodiming;
	private String tianqi;
	private Timestamp tianbiaoshijian;
	private String jianceren;
	private String yangxianhao;
	private String jiluhao;
	private Integer shitishuliang;
	private Integer shitinianling;
	private String shitixingwei;
	private Integer bodyshuliang;
	private String bodyjianshu;
	private Double fenbianshuliang;
	private String powei;
	private String podu;
	private Double height;
	private Double jingdu;
	private Double weidu;
	private String shengjingleixing;
	private String beizhu;
	private String datestr;

	// Constructors

	/** default constructor */
	public Chicksurvey() {
	}

	/** full constructor */
	public Chicksurvey(String baohuqu, String baohuzhan, String xiaodiming,
			String tianqi, Timestamp tianbiaoshijian, String jianceren,
			String yangxianhao, String jiluhao, Integer shitishuliang,
			Integer shitinianling, String shitixingwei, Integer bodyshuliang,
			String bodyjianshu, Double fenbianshuliang, String powei,
			String podu, Double height, Double jingdu, Double weidu,
			String shengjingleixing, String beizhu) {
		this.baohuqu = baohuqu;
		this.baohuzhan = baohuzhan;
		this.xiaodiming = xiaodiming;
		this.tianqi = tianqi;
		this.tianbiaoshijian = tianbiaoshijian;
		this.jianceren = jianceren;
		this.yangxianhao = yangxianhao;
		this.jiluhao = jiluhao;
		this.shitishuliang = shitishuliang;
		this.shitinianling = shitinianling;
		this.shitixingwei = shitixingwei;
		this.bodyshuliang = bodyshuliang;
		this.bodyjianshu = bodyjianshu;
		this.fenbianshuliang = fenbianshuliang;
		this.powei = powei;
		this.podu = podu;
		this.height = height;
		this.jingdu = jingdu;
		this.weidu = weidu;
		this.shengjingleixing = shengjingleixing;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBaohuqu() {
		return this.baohuqu;
	}

	public void setBaohuqu(String baohuqu) {
		this.baohuqu = baohuqu;
	}

	public String getBaohuzhan() {
		return this.baohuzhan;
	}

	public void setBaohuzhan(String baohuzhan) {
		this.baohuzhan = baohuzhan;
	}

	public String getXiaodiming() {
		return this.xiaodiming;
	}

	public void setXiaodiming(String xiaodiming) {
		this.xiaodiming = xiaodiming;
	}

	public String getTianqi() {
		return this.tianqi;
	}

	public void setTianqi(String tianqi) {
		this.tianqi = tianqi;
	}

	public Timestamp getTianbiaoshijian() {
		return tianbiaoshijian;
	}

	public void setTianbiaoshijian(Timestamp tianbiaoshijian) {
		this.tianbiaoshijian = tianbiaoshijian;
	}

	public String getJianceren() {
		return this.jianceren;
	}

	public void setJianceren(String jianceren) {
		this.jianceren = jianceren;
	}

	public String getYangxianhao() {
		return this.yangxianhao;
	}

	public void setYangxianhao(String yangxianhao) {
		this.yangxianhao = yangxianhao;
	}

	public String getJiluhao() {
		return this.jiluhao;
	}

	public void setJiluhao(String jiluhao) {
		this.jiluhao = jiluhao;
	}

	public Integer getShitishuliang() {
		return this.shitishuliang;
	}

	public void setShitishuliang(Integer shitishuliang) {
		this.shitishuliang = shitishuliang;
	}

	public Integer getShitinianling() {
		return this.shitinianling;
	}

	public void setShitinianling(Integer shitinianling) {
		this.shitinianling = shitinianling;
	}

	public String getShitixingwei() {
		return this.shitixingwei;
	}

	public void setShitixingwei(String shitixingwei) {
		this.shitixingwei = shitixingwei;
	}

	public Integer getBodyshuliang() {
		return this.bodyshuliang;
	}

	public void setBodyshuliang(Integer bodyshuliang) {
		this.bodyshuliang = bodyshuliang;
	}

	public String getBodyjianshu() {
		return this.bodyjianshu;
	}

	public void setBodyjianshu(String bodyjianshu) {
		this.bodyjianshu = bodyjianshu;
	}

	public Double getFenbianshuliang() {
		return this.fenbianshuliang;
	}

	public void setFenbianshuliang(Double fenbianshuliang) {
		this.fenbianshuliang = fenbianshuliang;
	}

	public String getPowei() {
		return this.powei;
	}

	public void setPowei(String powei) {
		this.powei = powei;
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

	public String getShengjingleixing() {
		return this.shengjingleixing;
	}

	public void setShengjingleixing(String shengjingleixing) {
		this.shengjingleixing = shengjingleixing;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getDatestr() {
		if(this.tianbiaoshijian!=null)
		{
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
			datestr=sdf.format(this.tianbiaoshijian); 
		}
		return datestr;
	}

	public void setDatestr(String datestr) {
		this.datestr = datestr;
	}

}