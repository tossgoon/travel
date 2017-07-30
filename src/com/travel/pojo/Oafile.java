package com.travel.pojo;

/**
 * Oafile entity. @author MyEclipse Persistence Tools
 */

public class Oafile implements java.io.Serializable {

	// Fields

	private Integer id;
	private Oa oa;
	private String filename;
	private String filepath;
	private Integer oaid;

	// Constructors

	/** default constructor */
	public Oafile() {
	}

	/** full constructor */
	public Oafile(Oa oa, String filename, String filepath,int oaid) {
		this.oa = oa;
		this.filename = filename;
		this.filepath = filepath;
		this.oaid=oaid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Oa getOa() {
		return this.oa;
	}

	public void setOa(Oa oa) {
		this.oa = oa;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Integer getOaid() {
		return oaid;
	}

	public void setOaid(Integer oaid) {
		this.oaid = oaid;
	}

}