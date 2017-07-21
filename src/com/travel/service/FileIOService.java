package com.travel.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;


public class FileIOService {

	public FileIOService() {
		// TODO Auto-generated constructor stub
	}

	public String uploadFile(String fileName, File fileData) throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath(
				"/uploadFiles");
		InputStream is = new FileInputStream(fileData);
		String filetype = fileName.substring(fileName.lastIndexOf("."));
		//�����ļ���
		Date date=new Date();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newFileName=sdf.format(date)+filetype;
		
		OutputStream os = new FileOutputStream(new File(path, newFileName));
		// ��Ϊfile�Ǵ������ʱ�ļ��е��ļ������ǿ��Խ����ļ������ļ�·����ӡ����������֮ǰ��fileFileName�Ƿ���ͬ
		byte[] buffer = new byte[1024 * 1024];
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		return newFileName;
	}
}
