package com.jktech.pojo;
// default package

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


/**
 * kczk entity. @author MyEclipse Persistence Tools
 */

public class Kczk  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer gcId;
     private Double XNorth;
     private Double YEast;
     private Double HBiaogao;
     private String zuobiaojingdu;
     private Double zkDepth;
     private Double tanjingDepth;
     private Double jingtanDepth;
     private Double wendingshuiwei;
     private Double yehuazhishu;
     private Double dengxiaojqbs;
     private Timestamp kaikongdate;
     private Timestamp zhongkongdate;
     private String gongchengdzfq;
     private String dimaodanyuan;
     private String beizhu;
     private String bianhao;
     private String shixiandengji;
     private Double latMars;
     private Double lngMars;
     //private byte[] shape;


    // Constructors

    /** default constructor */
    public Kczk() {
    }

    
    /** full constructor */
    public Kczk(Integer gcId, Double XNorth, Double YEast, Double HBiaogao, String zuobiaojingdu, Double zkDepth, Double tanjingDepth, Double jingtanDepth, Double wendingshuiwei, Double yehuazhishu, Double dengxiaojqbs, Timestamp kaikongdate, Timestamp zhongkongdate, String gongchengdzfq, String dimaodanyuan, String beizhu, String bianhao, String shixiandengji, Double latMars, Double lngMars) {
        this.gcId = gcId;
        this.XNorth = XNorth;
        this.YEast = YEast;
        this.HBiaogao = HBiaogao;
        this.zuobiaojingdu = zuobiaojingdu;
        this.zkDepth = zkDepth;
        this.tanjingDepth = tanjingDepth;
        this.jingtanDepth = jingtanDepth;
        this.wendingshuiwei = wendingshuiwei;
        this.yehuazhishu = yehuazhishu;
        this.dengxiaojqbs = dengxiaojqbs;
        this.kaikongdate = kaikongdate;
        this.zhongkongdate = zhongkongdate;
        this.gongchengdzfq = gongchengdzfq;
        this.dimaodanyuan = dimaodanyuan;
        this.beizhu = beizhu;
        this.bianhao = bianhao;
        this.shixiandengji = shixiandengji;
        this.latMars = latMars;
        this.lngMars = lngMars;
        //this.shape = shape;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGcId() {
        return this.gcId;
    }
    
    public void setGcId(Integer gcId) {
        this.gcId = gcId;
    }

    public Double getXNorth() {
        return this.XNorth;
    }
    
    public void setXNorth(Double XNorth) {
        this.XNorth = XNorth;
    }

    public Double getYEast() {
        return this.YEast;
    }
    
    public void setYEast(Double YEast) {
        this.YEast = YEast;
    }

    public Double getHBiaogao() {
        return this.HBiaogao;
    }
    
    public void setHBiaogao(Double HBiaogao) {
        this.HBiaogao = HBiaogao;
    }

    public String getZuobiaojingdu() {
        return this.zuobiaojingdu;
    }
    
    public void setZuobiaojingdu(String zuobiaojingdu) {
        this.zuobiaojingdu = zuobiaojingdu;
    }

    public Double getZkDepth() {
        return this.zkDepth;
    }
    
    public void setZkDepth(Double zkDepth) {
        this.zkDepth = zkDepth;
    }

    public Double getTanjingDepth() {
        return this.tanjingDepth;
    }
    
    public void setTanjingDepth(Double tanjingDepth) {
        this.tanjingDepth = tanjingDepth;
    }

    public Double getJingtanDepth() {
        return this.jingtanDepth;
    }
    
    public void setJingtanDepth(Double jingtanDepth) {
        this.jingtanDepth = jingtanDepth;
    }

    public Double getWendingshuiwei() {
        return this.wendingshuiwei;
    }
    
    public void setWendingshuiwei(Double wendingshuiwei) {
        this.wendingshuiwei = wendingshuiwei;
    }

    public Double getYehuazhishu() {
        return this.yehuazhishu;
    }
    
    public void setYehuazhishu(Double yehuazhishu) {
        this.yehuazhishu = yehuazhishu;
    }

    public Double getDengxiaojqbs() {
        return this.dengxiaojqbs;
    }
    
    public void setDengxiaojqbs(Double dengxiaojqbs) {
        this.dengxiaojqbs = dengxiaojqbs;
    }

    public Timestamp getKaikongdate() {
        return this.kaikongdate;
    }
    
    public void setKaikongdate(Timestamp kaikongdate) {
        this.kaikongdate = kaikongdate;
    }

    public Timestamp getZhongkongdate() {
        return this.zhongkongdate;
    }
    
    public void setZhongkongdate(Timestamp zhongkongdate) {
        this.zhongkongdate = zhongkongdate;
    }

    public String getGongchengdzfq() {
        return this.gongchengdzfq;
    }
    
    public void setGongchengdzfq(String gongchengdzfq) {
        this.gongchengdzfq = gongchengdzfq;
    }

    public String getDimaodanyuan() {
        return this.dimaodanyuan;
    }
    
    public void setDimaodanyuan(String dimaodanyuan) {
        this.dimaodanyuan = dimaodanyuan;
    }

    public String getBeizhu() {
        return this.beizhu;
    }
    
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getBianhao() {
        return this.bianhao;
    }
    
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao;
    }

    public String getShixiandengji() {
        return this.shixiandengji;
    }
    
    public void setShixiandengji(String shixiandengji) {
        this.shixiandengji = shixiandengji;
    }


    public Double getLatMars() {
        return this.latMars;
    }
    
    public void setLatMars(Double latMars) {
        this.latMars = latMars;
    }

    public Double getLngMars() {
        return this.lngMars;
    }
    
    public void setLngMars(Double lngMars) {
        this.lngMars = lngMars;
    }
    public String getKaikongdateStr() {
		if (this.kaikongdate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			strDate = sdf.format(this.kaikongdate);
			return strDate;
		} else {
			return "";
		}
	}

	public String getZhongkongdateStr() {
		if (this.zhongkongdate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			strDate = sdf.format(this.zhongkongdate);
			return strDate;
		} else {
			return "";
		}
	}
    /*public byte[] getShape() {
        return this.shape;
    }
    
    public void setShape(byte[] shape) {
        this.shape = shape;
    }*/
   
}