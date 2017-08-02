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

	// Constructors

	/** default constructor */
	public Oareceiver() {
	}

	/** full constructor */
	public Oareceiver(Integer userid, Integer oaid) {
		this.userid = userid;
		this.oaid = oaid;
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
		return isread;
	}

	public void setIsread(Boolean isread) {
		this.isread = isread;
	}

}