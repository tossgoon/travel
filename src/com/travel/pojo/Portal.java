package com.travel.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Portal entity. @author MyEclipse Persistence Tools
 */

public class Portal implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -38007605746601753L;
	private Integer id;
	private String title;
	private String subtitle;
	private String content;
	private Timestamp pubdate;
	private String user;
	private String type;
	private String foottitle;
	private String pictureurl;
	private String status;
	private boolean isshowpicture;
	private String pubdatestr;

	// Constructors

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/** default constructor */
	public Portal() {
	}

	/** full constructor */
	public Portal(String title, String subtitle, String content,
			Timestamp pubdate, String user, String type, String foottitle,
			String pictureurl,String status,boolean isshowpicture) {
		this.title = title;
		this.subtitle = subtitle;
		this.content = content;
		this.pubdate = pubdate;
		this.user = user;
		this.type = type;
		this.foottitle = foottitle;
		this.pictureurl = pictureurl;
		this.status=status;
		this.isshowpicture=isshowpicture;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return this.subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Timestamp pubdate) {
		/*Date date=new Date();//»ñµÃ
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime=sdf.format(date);
		Timestamp dates=Timestamp.valueOf(nowTime);
		this.pubdate = dates;*/
		this.pubdate=pubdate;
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFoottitle() {
		return this.foottitle;
	}

	public void setFoottitle(String foottitle) {
		this.foottitle = foottitle;
	}

	public String getPictureurl() {
		return this.pictureurl;
	}

	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}

	public boolean getIsshowpicture() {
		return isshowpicture;
	}

	public void setIsshowpicture(boolean isshowpicture) {
		this.isshowpicture = isshowpicture;
	}

	public String getPubdatestr() {
		
		if(pubdate!=null)
		{
			SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
			pubdatestr = sdf.format(pubdate);
		}
		return pubdatestr;
	}
}