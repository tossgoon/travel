package com.travel.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Oa entity. @author MyEclipse Persistence Tools
 */

public class Oa implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 8411081300942329611L;
	private Integer id;
	private String title;
	private String content;
	private Timestamp pubdate;
	private Integer creater;
	private Boolean status;
	private Set<Oafile> oafiles ;
	private String pubdatestr;

	// Constructors

	/** default constructor */
	public Oa() {
	}

	/** full constructor */
	public Oa(String title, String content, Timestamp pubdate, Integer creater,
			Boolean status, Set<Oafile> oafiles) {
		this.title = title;
		this.content = content;
		this.pubdate = pubdate;
		this.creater = creater;
		this.status = status;
		this.oafiles = oafiles;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}

	public Integer getCreater() {
		return this.creater;
	}

	public void setCreater(Integer creater) {
		this.creater = creater;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Set<Oafile> getOafiles() {
		return oafiles;
	}

	public void setOafiles(Set<Oafile> oafiles) {
		this.oafiles = oafiles;
	}
	

	public String getPubdatestr() {
		if(pubdate!=null)
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
			pubdatestr=sdf.format(pubdate);
		}
		return pubdatestr;
	}

	public void setPubdatestr(String pubdatestr) {
		this.pubdatestr = pubdatestr;
	}




}