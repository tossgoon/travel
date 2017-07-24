package com.travel.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.base.MD5Util;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String telephone;
	private Date birthday;
	private String password;
	private String remark;
	private String loginname;
	private String department;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String username, String telephone, Date birthday,
			String password, String remark, String loginname,String department) {
		this.username = username;
		this.telephone = telephone;
		this.birthday = birthday;
		this.password = password;
		this.remark = remark;
		this.loginname = loginname;
		this.department=department;
	}

	// Property accessors

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public String getBirthdayStr() {
		if (this.birthday == null) {
			return "";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(this.birthday);
		}

	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		String md5OfPass="";//md5加密之后的密码
		if(password!=null)
		{
			md5OfPass=MD5Util.getMD5(password);
		}
		this.password = md5OfPass;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

}