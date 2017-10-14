package com.travel.pojo;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Animalsurvey entity. @author MyEclipse Persistence Tools
 */

public class Animalsurvey implements java.io.Serializable {

	// Fields

	private Integer id;
	private String yangxianhao;
	private Timestamp tianbiaoshijian;
	private String tianqi;
	private String jianceren;
	private String dongwumingcheng;
	private Integer shitishuliang;
	private Integer bodyshuliang;
	private String fenbian;
	private String shengjingleixing;
	private Double height;
	private Double weidu;
	private Double jingdu;
	private String beizhu;
	private String datestr;

	// Constructors

	/** default constructor */
	public Animalsurvey() {
	}

	/** full constructor */
	public Animalsurvey(String yangxianhao, Timestamp tianbiaoshijian,
			String tianqi, String jianceren, String dongwumingcheng,
			Integer shitishuliang, Integer bodyshuliang, String fenbian,
			String shengjingleixing, Double height, Double weidu,
			Double jingdu, String beizhu) {
		this.yangxianhao = yangxianhao;
		this.tianbiaoshijian = tianbiaoshijian;
		this.tianqi = tianqi;
		this.jianceren = jianceren;
		this.dongwumingcheng = dongwumingcheng;
		this.shitishuliang = shitishuliang;
		this.bodyshuliang = bodyshuliang;
		this.fenbian = fenbian;
		this.shengjingleixing = shengjingleixing;
		this.height = height;
		this.weidu = weidu;
		this.jingdu = jingdu;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getYangxianhao() {
		return this.yangxianhao;
	}

	public void setYangxianhao(String yangxianhao) {
		this.yangxianhao = yangxianhao;
	}

	public Timestamp getTianbiaoshijian() {
		return tianbiaoshijian;
	}

	public void setTianbiaoshijian(Timestamp tianbiaoshijian) {
		this.tianbiaoshijian = tianbiaoshijian;
	}

	public String getTianqi() {
		return this.tianqi;
	}

	public void setTianqi(String tianqi) {
		this.tianqi = tianqi;
	}

	public String getJianceren() {
		return this.jianceren;
	}

	public void setJianceren(String jianceren) {
		this.jianceren = jianceren;
	}

	public String getDongwumingcheng() {
		return this.dongwumingcheng;
	}

	public void setDongwumingcheng(String dongwumingcheng) {
		this.dongwumingcheng = dongwumingcheng;
	}

	public Integer getShitishuliang() {
		return this.shitishuliang;
	}

	public void setShitishuliang(Integer shitishuliang) {
		this.shitishuliang = shitishuliang;
	}

	public Integer getBodyshuliang() {
		return this.bodyshuliang;
	}

	public void setBodyshuliang(Integer bodyshuliang) {
		this.bodyshuliang = bodyshuliang;
	}

	public String getFenbian() {
		return this.fenbian;
	}

	public void setFenbian(String fenbian) {
		this.fenbian = fenbian;
	}

	public String getShengjingleixing() {
		return this.shengjingleixing;
	}

	public void setShengjingleixing(String shengjingleixing) {
		this.shengjingleixing = shengjingleixing;
	}

	public Double getHeight() {
		return this.height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeidu() {
		return this.weidu;
	}

	public void setWeidu(Double weidu) {
		this.weidu = weidu;
	}

	public Double getJingdu() {
		return this.jingdu;
	}

	public void setJingdu(Double jingdu) {
		this.jingdu = jingdu;
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