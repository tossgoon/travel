package com.travel.pojo;

/**
 * Plantsurvey entity. @author MyEclipse Persistence Tools
 */

public class Plantsurvey implements java.io.Serializable {

	// Fields

	private Integer id;
	private String yangfanghao;
	private Double jingdu;
	private Double weidu;
	private String tianbiaoshijian;
	private String jianceren;
	private String podu;
	private String powei;
	private String poxiang;
	private Double height;
	private String yubidu;
	private String qunximingcheng;
	private String shuzhongming;
	private String biaobenbianhao;
	private String gaodu;
	private String xiongjing;
	private String dongxiguanfu;
	private String nanbeiguanfu;
	private String junzhi;
	private String beizhu;

	// Constructors

	/** default constructor */
	public Plantsurvey() {
	}

	/** full constructor */
	public Plantsurvey(String yangfanghao, Double jingdu, Double weidu,
			String tianbiaoshijian, String jianceren, String podu,
			String powei, String poxiang, Double height, String yubidu,
			String qunximingcheng, String shuzhongming, String biaobenbianhao,
			String gaodu, String xiongjing, String dongxiguanfu,
			String nanbeiguanfu, String junzhi, String beizhu) {
		this.yangfanghao = yangfanghao;
		this.jingdu = jingdu;
		this.weidu = weidu;
		this.tianbiaoshijian = tianbiaoshijian;
		this.jianceren = jianceren;
		this.podu = podu;
		this.powei = powei;
		this.poxiang = poxiang;
		this.height = height;
		this.yubidu = yubidu;
		this.qunximingcheng = qunximingcheng;
		this.shuzhongming = shuzhongming;
		this.biaobenbianhao = biaobenbianhao;
		this.gaodu = gaodu;
		this.xiongjing = xiongjing;
		this.dongxiguanfu = dongxiguanfu;
		this.nanbeiguanfu = nanbeiguanfu;
		this.junzhi = junzhi;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getYangfanghao() {
		return this.yangfanghao;
	}

	public void setYangfanghao(String yangfanghao) {
		this.yangfanghao = yangfanghao;
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

	public String getTianbiaoshijian() {
		return this.tianbiaoshijian;
	}

	public void setTianbiaoshijian(String tianbiaoshijian) {
		this.tianbiaoshijian = tianbiaoshijian;
	}

	public String getJianceren() {
		return this.jianceren;
	}

	public void setJianceren(String jianceren) {
		this.jianceren = jianceren;
	}

	public String getPodu() {
		return this.podu;
	}

	public void setPodu(String podu) {
		this.podu = podu;
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

	public Double getHeight() {
		return this.height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public String getYubidu() {
		return this.yubidu;
	}

	public void setYubidu(String yubidu) {
		this.yubidu = yubidu;
	}

	public String getQunximingcheng() {
		return this.qunximingcheng;
	}

	public void setQunximingcheng(String qunximingcheng) {
		this.qunximingcheng = qunximingcheng;
	}

	public String getShuzhongming() {
		return this.shuzhongming;
	}

	public void setShuzhongming(String shuzhongming) {
		this.shuzhongming = shuzhongming;
	}

	public String getBiaobenbianhao() {
		return this.biaobenbianhao;
	}

	public void setBiaobenbianhao(String biaobenbianhao) {
		this.biaobenbianhao = biaobenbianhao;
	}

	public String getGaodu() {
		return this.gaodu;
	}

	public void setGaodu(String gaodu) {
		this.gaodu = gaodu;
	}

	public String getXiongjing() {
		return this.xiongjing;
	}

	public void setXiongjing(String xiongjing) {
		this.xiongjing = xiongjing;
	}

	public String getDongxiguanfu() {
		return this.dongxiguanfu;
	}

	public void setDongxiguanfu(String dongxiguanfu) {
		this.dongxiguanfu = dongxiguanfu;
	}

	public String getNanbeiguanfu() {
		return this.nanbeiguanfu;
	}

	public void setNanbeiguanfu(String nanbeiguanfu) {
		this.nanbeiguanfu = nanbeiguanfu;
	}

	public String getJunzhi() {
		return this.junzhi;
	}

	public void setJunzhi(String junzhi) {
		this.junzhi = junzhi;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

}