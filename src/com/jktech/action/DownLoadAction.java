package com.jktech.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.ast.Var;

import com.jktech.service.FileIOService;
import com.opensymphony.xwork2.ActionSupport;

public class DownLoadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 290792998077936164L;
	private String fileName;
	private FileIOService fileIOService;
	private InputStream inputStream;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) throws UnsupportedEncodingException {
		//this.fileName = fileName;
		//this.fileName = new String(fileName.getBytes("utf-8"), "utf-8");
		this.fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
	}

	public InputStream getFileInput() throws FileNotFoundException {
		return inputStream;
	}

	public FileIOService getFileIOService() {
		return fileIOService;
	}

	public void setFileIOService(FileIOService fileIOService) {
		this.fileIOService = fileIOService;
	}

	public DownLoadAction() {
		// TODO Auto-generated constructor stub
	}

	public String execute() throws Exception {
		/*
		 * String path = ServletActionContext.getContext() + "\\attachFiles\\";
		 * fileInput = ServletActionContext.getServletContext()
		 * .getResourceAsStream(path + fileName);
		 */
		String tempfilename = ServletActionContext.getRequest().getParameter("filename");
		setFileName(tempfilename);
		int attid = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("attid"));
		fileIOService.setAttid(attid);
		inputStream = fileIOService.getFileInput();
		//ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="+java.net.URLEncoder.encode(fileName, "UTF-8"));
		if (inputStream == null) {
			return ERROR;
		}
		return SUCCESS;
	}
}