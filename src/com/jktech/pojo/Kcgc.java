package com.jktech.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.Type;

import com.jktech.gis.GCJ2WGS;
import com.jktech.gis.LatLng;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;

/**
 * TbKcGc entity. @author MyEclipse Persistence Tools
 */

public class Kcgc implements java.io.Serializable {
	private static final long serialVersionUID = 8918907983001903101L;
	private Integer id;
	private String name;
	private String danwei;
	private String quyu;
	private String jutiweizhi;
	private Timestamp beginDate;
	private Timestamp endDate;
	private String kangzhenguifan;
	private String changdiliebie;
	private String xiangmufuze;
	private String planeCoorsystem;
	private String eleCoorsystem;
	private Integer zongkongshu;
	private Integer yehuakongshu;
	private String yehuadengji;
	private String huangtuguifan;
	private String shixiandengji;
	private Double shixianXiaxianshendu;
	private Integer gcdzfq;
	private Integer zizhongsxhtcd;
	private Integer feizizhongsxhtcd;
	private Integer baohehtcd;
	private Integer yehuacd;
	private Integer yanzitucd;
	private Integer pengzhangtcd;
	private Integer yanrongcd;
	private Integer wurantucd;
	private Integer rengongttcd;
	private Integer hongniantucd;
	private String beizhu;
	private Integer diliefengcd;
	private Integer feishixianxhtcd;
	private String gcshuxing;
	private Integer shangchuanrenId;
	private Integer hetongId;
	private Integer yunxuxiazai;
	private Integer isxianxinggongcheng;
	private String gcmiaoshu;
	private String shenheren;
	private String fushenren;
	private String shendingren;
	private String jianshedanwei;
	private String shejidanwei;
	private String jianzhucengshu;
	private String jianzhuyongtu;
	private String jiegouleixing;
	private String jichuxingshi;
	private Integer haszuankong;
	private Timestamp shangchuandate;
	private String danganhao;
	private Integer breakFlag;
	private Double lat;
	private Double lng;
	private Geometry shape;
	private Double latGCJ02;
	private Double lngGCJ02;
	private String siteType;

	private String industry;
	private String scale;
	private String kcLevel;

	/** default constructor */
	public Kcgc() {
	}

	/** full constructor */
	public Kcgc(String name, String danwei, String quyu, String jutiweizhi,
			Timestamp beginDate, Timestamp endDate, String kangzhenguifan,
			String changdiliebie, String xiangmufuze, String planeCoorsystem,
			String eleCoorsystem, Integer zongkongshu, Integer yehuakongshu,
			String yehuadengji, String huangtuguifan, String shixiandengji,
			Double shixianXiaxianshendu, Integer gcdzfq, Integer zizhongsxhtcd,
			Integer feizizhongsxhtcd, Integer baohehtcd, Integer yehuacd,
			Integer yanzitucd, Integer pengzhangtcd, Integer yanrongcd,
			Integer wurantucd, Integer rengongttcd, Integer hongniantucd,
			String beizhu, Integer diliefengcd, Integer feishixianxhtcd,
			String gcshuxing, Integer shangchuanrenId, Integer hetongId,
			Integer yunxuxiazai, Integer isxianxinggongcheng, String gcmiaoshu,
			String shenheren, String fushenren, String shendingren,
			String jianshedanwei, String shejidanwei, String jianzhucengshu,
			String jianzhuyongtu, String jiegouleixing, String jichuxingshi,
			Integer haszuankong, Timestamp shangchuandate, String danganhao,
			Integer breakFlag, Double lat, Double lng, Geometry shape,
			String siteType) {
		this.name = name;
		this.danwei = danwei;
		this.quyu = quyu;
		this.jutiweizhi = jutiweizhi;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.kangzhenguifan = kangzhenguifan;
		this.changdiliebie = changdiliebie;
		this.xiangmufuze = xiangmufuze;
		this.planeCoorsystem = planeCoorsystem;
		this.eleCoorsystem = eleCoorsystem;
		this.zongkongshu = zongkongshu;
		this.yehuakongshu = yehuakongshu;
		this.yehuadengji = yehuadengji;
		this.huangtuguifan = huangtuguifan;
		this.shixiandengji = shixiandengji;
		this.shixianXiaxianshendu = shixianXiaxianshendu;
		this.gcdzfq = gcdzfq;
		this.zizhongsxhtcd = zizhongsxhtcd;
		this.feizizhongsxhtcd = feizizhongsxhtcd;
		this.baohehtcd = baohehtcd;
		this.yehuacd = yehuacd;
		this.yanzitucd = yanzitucd;
		this.pengzhangtcd = pengzhangtcd;
		this.yanrongcd = yanrongcd;
		this.wurantucd = wurantucd;
		this.rengongttcd = rengongttcd;
		this.hongniantucd = hongniantucd;
		this.beizhu = beizhu;
		this.diliefengcd = diliefengcd;
		this.feishixianxhtcd = feishixianxhtcd;
		this.gcshuxing = gcshuxing;
		this.shangchuanrenId = shangchuanrenId;
		this.hetongId = hetongId;
		this.yunxuxiazai = yunxuxiazai;
		this.isxianxinggongcheng = isxianxinggongcheng;
		this.gcmiaoshu = gcmiaoshu;
		this.shenheren = shenheren;
		this.fushenren = fushenren;
		this.shendingren = shendingren;
		this.jianshedanwei = jianshedanwei;
		this.shejidanwei = shejidanwei;
		this.jianzhucengshu = jianzhucengshu;
		this.jianzhuyongtu = jianzhuyongtu;
		this.jiegouleixing = jiegouleixing;
		this.jichuxingshi = jichuxingshi;
		this.haszuankong = haszuankong;
		this.shangchuandate = shangchuandate;
		this.danganhao = danganhao;
		this.breakFlag = breakFlag;
		this.lat = lat;
		this.lng = lng;
		this.shape = shape;
		this.siteType = siteType;
	}

	// Property accessors

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDanwei() {
		return this.danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}

	public String getQuyu() {
		return this.quyu;
	}

	public void setQuyu(String quyu) {
		this.quyu = quyu;
	}

	public String getJutiweizhi() {
		return this.jutiweizhi;
	}

	public void setJutiweizhi(String jutiweizhi) {
		this.jutiweizhi = jutiweizhi;
	}

	public Timestamp getBeginDate() {
		return this.beginDate;
	}

	public void setBeginDate(Timestamp beginDate) {
		this.beginDate = beginDate;
	}

	public Timestamp getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public String getKangzhenguifan() {
		return this.kangzhenguifan;
	}

	public void setKangzhenguifan(String kangzhenguifan) {
		this.kangzhenguifan = kangzhenguifan;
	}

	public String getChangdileibie() {
		return this.changdiliebie;
	}

	public void setChangdileibie(String changdiliebie) {
		this.changdiliebie = changdiliebie;
	}

	public String getXiangmufuze() {
		return this.xiangmufuze;
	}

	public void setXiangmufuze(String xiangmufuze) {
		this.xiangmufuze = xiangmufuze;
	}

	public String getPlaneCoorsystem() {
		return this.planeCoorsystem;
	}

	public void setPlaneCoorsystem(String planeCoorsystem) {
		this.planeCoorsystem = planeCoorsystem;
	}

	public String getEleCoorsystem() {
		return this.eleCoorsystem;
	}

	public void setEleCoorsystem(String eleCoorsystem) {
		this.eleCoorsystem = eleCoorsystem;
	}

	public Integer getZongkongshu() {
		return this.zongkongshu;
	}

	public void setZongkongshu(Integer zongkongshu) {
		this.zongkongshu = zongkongshu;
	}

	public Integer getYehuakongshu() {
		return this.yehuakongshu;
	}

	public void setYehuakongshu(Integer yehuakongshu) {
		this.yehuakongshu = yehuakongshu;
	}

	public String getYehuadengji() {
		return this.yehuadengji;
	}

	public void setYehuadengji(String yehuadengji) {
		this.yehuadengji = yehuadengji;
	}

	public String getHuangtuguifan() {
		return this.huangtuguifan;
	}

	public void setHuangtuguifan(String huangtuguifan) {
		this.huangtuguifan = huangtuguifan;
	}

	public String getShixiandengji() {
		return this.shixiandengji;
	}

	public void setShixiandengji(String shixiandengji) {
		this.shixiandengji = shixiandengji;
	}

	public Double getShixianXiaxianshendu() {
		return this.shixianXiaxianshendu;
	}

	public void setShixianXiaxianshendu(Double shixianXiaxianshendu) {
		this.shixianXiaxianshendu = shixianXiaxianshendu;
	}

	public Integer getGcdzfq() {
		return this.gcdzfq;
	}

	public void setGcdzfq(Integer gcdzfq) {
		this.gcdzfq = gcdzfq;
	}

	public Integer getZizhongsxhtcd() {
		return this.zizhongsxhtcd;
	}

	public void setZizhongsxhtcd(Integer zizhongsxhtcd) {
		this.zizhongsxhtcd = zizhongsxhtcd;
	}

	public Integer getFeizizhongsxhtcd() {
		return this.feizizhongsxhtcd;
	}

	public void setFeizizhongsxhtcd(Integer feizizhongsxhtcd) {
		this.feizizhongsxhtcd = feizizhongsxhtcd;
	}

	public Integer getBaohehtcd() {
		return this.baohehtcd;
	}

	public void setBaohehtcd(Integer baohehtcd) {
		this.baohehtcd = baohehtcd;
	}

	public Integer getYehuacd() {
		return this.yehuacd;
	}

	public void setYehuacd(Integer yehuacd) {
		this.yehuacd = yehuacd;
	}

	public Integer getYanzitucd() {
		return this.yanzitucd;
	}

	public void setYanzitucd(Integer yanzitucd) {
		this.yanzitucd = yanzitucd;
	}

	public Integer getPengzhangtcd() {
		return this.pengzhangtcd;
	}

	public void setPengzhangtcd(Integer pengzhangtcd) {
		this.pengzhangtcd = pengzhangtcd;
	}

	public Integer getYanrongcd() {
		return this.yanrongcd;
	}

	public void setYanrongcd(Integer yanrongcd) {
		this.yanrongcd = yanrongcd;
	}

	public Integer getWurantucd() {
		return this.wurantucd;
	}

	public void setWurantucd(Integer wurantucd) {
		this.wurantucd = wurantucd;
	}

	public Integer getRengongttcd() {
		return this.rengongttcd;
	}

	public void setRengongttcd(Integer rengongttcd) {
		this.rengongttcd = rengongttcd;
	}

	public Integer getHongniantucd() {
		return this.hongniantucd;
	}

	public void setHongniantucd(Integer hongniantucd) {
		this.hongniantucd = hongniantucd;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Integer getDiliefengcd() {
		return this.diliefengcd;
	}

	public void setDiliefengcd(Integer diliefengcd) {
		this.diliefengcd = diliefengcd;
	}

	public Integer getFeishixianxhtcd() {
		return this.feishixianxhtcd;
	}

	public void setFeishixianxhtcd(Integer feishixianxhtcd) {
		this.feishixianxhtcd = feishixianxhtcd;
	}

	public String getGcshuxing() {
		return this.gcshuxing;
	}

	public void setGcshuxing(String gcshuxing) {
		this.gcshuxing = gcshuxing;
	}

	public Integer getShangchuanrenId() {
		return this.shangchuanrenId;
	}

	public void setShangchuanrenId(Integer shangchuanrenId) {
		this.shangchuanrenId = shangchuanrenId;
	}

	public Integer getHetongId() {
		return this.hetongId;
	}

	public void setHetongId(Integer hetongId) {
		this.hetongId = hetongId;
	}

	public Integer getYunxuxiazai() {
		if (this.yunxuxiazai == null) {
			return 1;
		}
		return this.yunxuxiazai;
	}

	public void setYunxuxiazai(Integer yunxuxiazai) {
		this.yunxuxiazai = yunxuxiazai;
	}

	public Integer getIsxianxinggongcheng() {
		return this.isxianxinggongcheng;
	}

	public void setIsxianxinggongcheng(Integer isxianxinggongcheng) {
		this.isxianxinggongcheng = isxianxinggongcheng;
	}

	public String getGcmiaoshu() {
		return this.gcmiaoshu;
	}

	public void setGcmiaoshu(String gcmiaoshu) {
		this.gcmiaoshu = gcmiaoshu;
	}

	public String getShenheren() {
		return this.shenheren;
	}

	public void setShenheren(String shenheren) {
		this.shenheren = shenheren;
	}

	public String getFushenren() {
		return this.fushenren;
	}

	public void setFushenren(String fushenren) {
		this.fushenren = fushenren;
	}

	public String getShendingren() {
		return this.shendingren;
	}

	public void setShendingren(String shendingren) {
		this.shendingren = shendingren;
	}

	public String getJianshedanwei() {
		return this.jianshedanwei;
	}

	public void setJianshedanwei(String jianshedanwei) {
		this.jianshedanwei = jianshedanwei;
	}

	public String getShejidanwei() {
		return this.shejidanwei;
	}

	public void setShejidanwei(String shejidanwei) {
		this.shejidanwei = shejidanwei;
	}

	public String getJianzhucengshu() {
		return this.jianzhucengshu;
	}

	public void setJianzhucengshu(String jianzhucengshu) {
		this.jianzhucengshu = jianzhucengshu;
	}

	public String getJianzhuyongtu() {
		return this.jianzhuyongtu;
	}

	public void setJianzhuyongtu(String jianzhuyongtu) {
		this.jianzhuyongtu = jianzhuyongtu;
	}

	public String getJiegouleixing() {
		return this.jiegouleixing;
	}

	public void setJiegouleixing(String jiegouleixing) {
		this.jiegouleixing = jiegouleixing;
	}

	public String getJichuxingshi() {
		return this.jichuxingshi;
	}

	public void setJichuxingshi(String jichuxingshi) {
		this.jichuxingshi = jichuxingshi;
	}

	public Integer getHaszuankong() {
		return this.haszuankong;
	}

	public void setHaszuankong(Integer haszuankong) {
		this.haszuankong = haszuankong;
	}

	public Timestamp getShangchuandate() {
		return this.shangchuandate;
	}

	public void setShangchuandate(Timestamp shangchuandate) {
		this.shangchuandate = shangchuandate;
	}

	public String getDanganhao() {
		return this.danganhao;
	}

	public void setDanganhao(String danganhao) {
		this.danganhao = danganhao;
	}

	public Integer getBreakFlag() {
		return this.breakFlag;
	}

	public void setBreakFlag(Integer breakFlag) {
		this.breakFlag = breakFlag;
	}

	public Double getLat() {
		// POINT (34.14799128 108.97620301)
		if (this.lat == null && this.shape != null) {
			String shpstr = this.shape.toText();
			String latstr = shpstr.substring(shpstr.indexOf("(") + 1,
					shpstr.lastIndexOf(" "));
			Double latv = Double.valueOf(latstr);
			return latv;
		}
		return this.lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		if (this.lng == null && this.shape != null) {
			String shpstr = this.shape.toText();
			Double lngv;
			try {
				String lngstr = shpstr.substring(shpstr.lastIndexOf(" ") + 1,
						shpstr.indexOf(")"));
				lngv = Double.valueOf(lngstr);
			} catch (Exception e) {
				// TODO: handle exception
				lngv = -1.0;
			}

			return lngv;
		}
		return this.lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Double getLatGCJ02() {
		return latGCJ02;
	}

	public void setLatGCJ02(Double latGCJ02) {
this.latGCJ02=latGCJ02;
	}

	public Double getLngGCJ02() {
		return lngGCJ02;
	}

	public void setLngGCJ02(Double lngGCJ02) {
		this.lngGCJ02=lngGCJ02;
	}

	// @Column(name = "DZKJWZ")
	// @Type(type="org.hibernate.spatial.GeometryType")
	@JSON(serialize = false)
	public Geometry getShape() {
		return shape;
	}

	public void setShape(Geometry shape) {
		this.shape = shape;
	}

	public String getShapeText() {
		if (this.shape != null) {
			return this.shape.toText();
		}
		return null;
	}

	/*
	 * public void setShpString(String shpString) {
	 * 
	 * }
	 */
	/*
	 * public byte[] getShape() { return this.shape; }
	 * 
	 * public void setShape(byte[] shape) { this.shape = shape; }
	 */
	public String getBeginDateStr() {
		if (this.beginDate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			strDate = sdf.format(this.beginDate);
			return strDate;
		} else {
			return "";
		}
	}

	public String getEndDateStr() {
		if (this.endDate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			strDate = sdf.format(this.endDate);
			return strDate;
		} else {
			return "";
		}
	}

	public String getUploadDateStr() {
		if (this.shangchuandate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			strDate = sdf.format(this.shangchuandate);
			return strDate;
		} else {
			return "";
		}
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getKcLevel() {
		return kcLevel;
	}

	public void setKcLevel(String kcLevel) {
		this.kcLevel = kcLevel;
	}
}