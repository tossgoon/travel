package com.jktech.action;

import java.io.File;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.jktech.pojo.GcAttach;
import com.jktech.service.FileIOService;
import com.opensymphony.xwork2.ActionSupport;

public class UpLoadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -373880625709827171L;
	/**
	 * 
	 */
	private FileIOService fileIOService;
	private File fileData;
	private String fileDataFileName;// 文件名称
	private String fileDataContentType;// 文件MIME类型
	private GcAttach gcAttach;

	public GcAttach getGcAttach() {
		return gcAttach;
	}

	public void setGcAttach(GcAttach gcAttach) {
		this.gcAttach = gcAttach;
	}

	@JSON(serialize = false)
	public FileIOService getFileIOService() {
		return fileIOService;
	}

	public void setFileIOService(FileIOService fileIOService) {
		this.fileIOService = fileIOService;
	}

	public File getFileData() {
		return fileData;
	}

	public void setFileData(File fileData) {
		this.fileData = fileData;
	}

	public String getFileDataFileName() {
		return fileDataFileName;
	}

	public void setFileDataFileName(String fileDataFileName) {
		this.fileDataFileName = fileDataFileName;
	}

	public String getFileDataContentType() {
		return fileDataContentType;
	}

	public void setFileDataContentType(String fileDataContentType) {
		this.fileDataContentType = fileDataContentType;
	}

	public UpLoadAction() {
		// TODO Auto-generated constructor stub
	}

	public String execute() throws Exception {
		int gcid = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("gcid"));
		String tbtype = ServletActionContext.getRequest()
				.getParameter("tbtype");
		gcAttach = fileIOService.uploadFile(fileDataFileName, tbtype, gcid,
				fileData);
		return SUCCESS;
	}
}
