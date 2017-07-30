package com.travel.pojo;

/**
 * Oareceiver entity. @author MyEclipse Persistence Tools
 */

public class Oareceiver implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private Integer oaid;

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

}