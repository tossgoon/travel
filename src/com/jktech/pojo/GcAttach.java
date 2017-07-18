package com.jktech.pojo;

// default package

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * GCAttach entity. @author MyEclipse Persistence Tools
 */

public class GcAttach implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1605020517589152416L;
	private Integer id;
	private Integer gcid;
	private String filename;
	private Timestamp shangchuandate;
	private String atttype;
	private String tbtype;
	private String filesavename;

	// Constructors

	/** default constructor */
	public GcAttach() {
	}

	/** full constructor */
	public GcAttach(Integer gcid, String filename, Timestamp shangchuandate,
			String atttype, String tbtype, String filesavename) {
		this.gcid = gcid;
		this.filename = filename;
		this.shangchuandate = shangchuandate;
		this.atttype = atttype;
		this.tbtype = tbtype;
		this.filesavename = filesavename;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGcid() {
		return this.gcid;
	}

	public void setGcid(Integer gcId) {
		this.gcid = gcId;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Timestamp getShangchuandate() {
		return this.shangchuandate;
	}

	public void setShangchuandate(Timestamp shangchuandate) {
		this.shangchuandate = shangchuandate;
	}

	public String getAtttype() {
		return this.atttype;
	}

	public void setAtttype(String atttype) {
		this.atttype = atttype;
	}

	public String getTbtype() {
		return this.tbtype;
	}

	public void setTbtype(String tbtype) {
		this.tbtype = tbtype;
	}

	public String getFilesavename() {
		return this.filesavename;
	}

	public void setFilesavename(String filesavename) {
		this.filesavename = filesavename;
	}

	public String getUploadDate() {
		if (this.shangchuandate != null) {
			String strDate = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			strDate = sdf.format(this.shangchuandate);
			return strDate;
		} else {
			return "";
		}
	}
}