package com.travel.pojo;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable {

	// Fields

	private Integer id;
	private String deptname;
	private String funtion;
	private String position;
	private String remark;

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** full constructor */
	public Department(String deptname, String funtion, String position,
			String remark) {
		this.deptname = deptname;
		this.funtion = funtion;
		this.position = position;
		this.remark = remark;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptname() {
		return this.deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getFuntion() {
		return this.funtion;
	}

	public void setFuntion(String funtion) {
		this.funtion = funtion;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}