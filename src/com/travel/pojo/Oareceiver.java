package com.travel.pojo;

/**
 * Oareceiver entity. @author MyEclipse Persistence Tools
 */

public class Oareceiver implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private Integer oaid;
	private Boolean isread;
	private String sender;

	// Constructors

	/** default constructor */
	public Oareceiver() {
	}

	/** full constructor */
	public Oareceiver(Integer userid, Integer oaid, Boolean isread,
			String sender) {
		this.userid = userid;
		this.oaid = oaid;
		this.isread = isread;
		this.sender = sender;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getOaid() {
		return this.oaid;
	}

	public void setOaid(Integer oaid) {
		this.oaid = oaid;
	}

	public Boolean getIsread() {
		return this.isread;
	}

	public void setIsread(Boolean isread) {
		this.isread = isread;
	}

	public String getSender() {
		return this.sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

}