package com.travel.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.ast.Var;

import com.opensymphony.xwork2.ActionSupport;
import com.travel.pojo.Oafile;
import com.travel.service.FileIOService;
import com.travel.service.OaFileService;

public class DownLoadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 290792998077936164L;
	private FileIOService fileIOService;
	private InputStream inputStream;
	private String fileName;
	private OaFileService<Oafile> oaFileService;

	public InputStream getInputStream() {
		return inputStream;
	}

	public OaFileService<Oafile> getOaFileService() {
		return oaFileService;
	}

	public void setOaFileService(OaFileService<Oafile> oaFileService) {
		this.oaFileService = oaFileService;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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
		// 设置文件名称
		String fid = ServletActionContext.getRequest().getParameter("fid");
		if (fid != null) {
			Integer fileid = Integer.parseInt(fid);
			Oafile file = this.oaFileService.getOafile(Oafile.class, fileid);
			
			this.setFileName(file.getFilename());
			// 下载文件
			fileIOService.setFilepath(file.getFilepath());
			inputStream = fileIOService.getFileInput();
			// ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="+java.net.URLEncoder.encode(fileName,
			// "UTF-8"));
			if (inputStream == null) {
				return ERROR;
			}
		} else {
			return ERROR;
		}

		return SUCCESS;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName)
			throws UnsupportedEncodingException {
		this.fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
	}
}