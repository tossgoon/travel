package com.travel.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * Oafile entity. @author MyEclipse Persistence Tools
 */

public class Diskfile implements java.io.Serializable {

	// Fields

	private Integer id;
	private Foldertype folder;
	private String filename;
	private String filepath;
	private String remark;
	private Integer folderid;
	private String filerealname;
	private Timestamp uploaddate;
	private String uploaddateStr;

	// Constructors

	/** default constructor */
	public Diskfile() {
	}

	/** full constructor */
	public Diskfile(Foldertype folder, String filename, String filepath,String remark,int folderid,Timestamp uploaddate,String filerealname) {
		this.setFolder(folder);
		this.filename = filename;
		this.filepath = filepath;
		this.setFolderid(folderid);
		this.setRemark(remark);
		this.setUploaddate(uploaddate);
		this.setFilerealname(filerealname);
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Foldertype getFolder() {
		return folder;
	}

	public void setFolder(Foldertype folder) {
		this.folder = folder;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getFolderid() {
		return folderid;
	}

	public void setFolderid(Integer folderid) {
		this.folderid = folderid;
	}

	public Timestamp getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(Timestamp uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getFilerealname() {
		return filerealname;
	}

	public void setFilerealname(String filerealname) {
		this.filerealname = filerealname;
	}

	public String getUploaddateStr() {
		if(uploaddate!=null)
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
			uploaddateStr=sdf.format(uploaddate);
		}
		return uploaddateStr;
	}

	public void setUploaddateStr(String uploaddateStr) {
		this.uploaddateStr = uploaddateStr;
	}
}