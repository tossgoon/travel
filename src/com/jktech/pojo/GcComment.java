package com.jktech.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

/**
 * TbGcComment entity. @author MyEclipse Persistence Tools
 */

public class GcComment implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 8891617093055974844L;
	private Integer id;
	private String tbtype;
	private String userId;
	private String commContent;
	private Timestamp commDate;
	private Integer gcid;

	// Constructors

	/** default constructor */
	public GcComment() {
	}

	/** full constructor */
	public GcComment(String tbtype, String userId, String commContent,
			Timestamp commDate, Integer gcid) {
		this.tbtype = tbtype;
		this.userId = userId;
		this.commContent = commContent;
		this.commDate = commDate;
		this.gcid = gcid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTbtype() {
		return this.tbtype;
	}

	public void setTbtype(String tbtype) {
		this.tbtype = tbtype;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommContent() {
		return this.commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Timestamp getCommDate() {
		return this.commDate;
	}

	public String getCommdateStr() {
		if (this.commDate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			strDate = sdf.format(this.commDate);
			return strDate;
		} else {
			return "";
		}
	}

	public void setCommDate(Timestamp commDate) {
		this.commDate = commDate;
	}

	public Integer getGcid() {
		return this.gcid;
	}

	public void setGcid(Integer gcid) {
		this.gcid = gcid;
	}

}