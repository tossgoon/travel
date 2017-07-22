package com.travel.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
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
		String filetype = fileName.substring(fileName.lastIndexOf("."));
		// 生成文件名
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newFileName = sdf.format(date) + filetype;
		String fullFileName="\\uploadFiles\\"+newFileName;
		InputStream is =null;
		OutputStream os=null;
		/*
		is = new FileInputStream(fileData);
		os = new FileOutputStream(new File(path, newFileName));
		// 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
		byte[] buffer = new byte[1024 * 1024];
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		*/
		try {
			is = new FileInputStream(fileData);
			os = new FileOutputStream(new File(path, newFileName));
			// 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
			byte[] buffer = new byte[1024 * 1024];
			int length = 0;
			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}
		} 
		/*catch (FileNotFoundException e) {
			e.printStackTrace();
			newFileName="-1";
		} */
		catch (IOException e) {
			e.printStackTrace();
			fullFileName="-1";
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
				fullFileName="-1";
			}
		}
		return fullFileName;
	}
}
