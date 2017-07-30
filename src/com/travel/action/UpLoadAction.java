package com.travel.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.travel.service.FileIOService;

public class UpLoadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2182526726137830671L;
	/**
	 * 
	 */
	private FileIOService fileIOService;
	//private File fileData;
	//private String fileDataFileName;// �ļ�����
	//private String fileDataContentType;// �ļ�MIME����
	
	/*--���ļ��ϴ�--*/
	private String newFileName;
	private File file;//���ļ����ϴ������ڶ���ļ��ϴ���Ҳ��һ���ļ�һ���ļ��ϴ���
	private String fileFileName;//
	/*--���ļ��ϴ�--*/

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	@JSON(serialize = false)
	public FileIOService getFileIOService() {
		return fileIOService;
	}

	public void setFileIOService(FileIOService fileIOService) {
		this.fileIOService = fileIOService;
	}

	/*public File getFileData() {
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
	}*/

	public UpLoadAction() {
		// TODO Auto-generated constructor stub
	}

	public String execute() throws Exception {
		/*String tbtype = ServletActionContext.getRequest()
				.getParameter("tbtype");*/
		//newFileNameList=new ArrayList();
		String newName = fileIOService.uploadFile(fileFileName, file);
		setNewFileName(newName);
		//this.newFileNameList.add(newName);
		return SUCCESS;
	}
}
