package com.travel.pojo;

/**
 * Foldertype entity. @author MyEclipse Persistence Tools
 */

public class Foldertype implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1840361921723220731L;
	private Integer id;
	private String name;
	private Integer pid;
	private Integer ptype;

	// Constructors

	/** default constructor */
	public Foldertype() {
	}

	/** full constructor */
	public Foldertype(String name, Integer pid) {
		this.name = name;
		this.pid = pid;
	}

	// Property accessors

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

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getPtype() {
		return ptype;
	}

	public void setPtype(Integer ptype) {
		this.ptype = ptype;
	}

}