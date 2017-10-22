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

import com.travel.pojo.Oafile;

public class FileIOService {

	private String filepath;
	public FileIOService() {
		// TODO Auto-generated constructor stub
	}

	public InputStream getFileInput() throws FileNotFoundException {
		String contextPath = ServletActionContext.getServletContext().getContextPath();// contextPathΪ\\travel 
		
		String realpath=ServletActionContext.getServletContext().getRealPath(filepath).replace("\\webapps\\travel\\travel","");
		//InputStream ist=ServletActionContext.getServletContext().getResourceAsStream(realpath);
		//InputStream ist=new FileInputStream(realpath);
		InputStream	ist=ServletActionContext.getServletContext().getResourceAsStream("uploadFiles/20170729162413408.jpg");
		return ist;
	}

	public String uploadFile(String fileName, File fileData) throws Exception {
		/*String path = ServletActionContext.getServletContext().getRealPath("/")
				.replace("\\webapps\\travel\\", "")
				+ "\\uploadpic";*/
		String contextPath = ServletActionContext.getServletContext().getContextPath().replace("/", "\\");// contextPathΪ\\travel 
		if(contextPath.equals("")){
			contextPath="\\ROOT";
		}
		String pathstr="\\webapps"+contextPath+"\\";
		String realpath=ServletActionContext.getServletContext().getRealPath("/");
		String path = ServletActionContext.getServletContext().getRealPath("/").replace(pathstr, "")+ "\\uploadpic";
		String filetype = fileName.substring(fileName.lastIndexOf("."));
		
		System.out.println(contextPath);
		System.out.println(pathstr);
		System.out.println(realpath);
		System.out.println(path);
		System.out.println(filetype);
		
		// �����ļ���
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newFileName = sdf.format(date) + filetype;
		
		//String fullFileName = "\\travel\\uploadpic\\" + newFileName;
		String fullFileName = contextPath+"\\uploadpic\\" + newFileName;
		InputStream is = null;
		OutputStream os = null;
		/*
		 * is = new FileInputStream(fileData); os = new FileOutputStream(new
		 * File(path, newFileName)); //
		 * ��Ϊfile�Ǵ������ʱ�ļ��е��ļ������ǿ��Խ����ļ������ļ�·����ӡ����������֮ǰ��fileFileName�Ƿ���ͬ byte[]
		 * buffer = new byte[1024 * 1024]; int length = 0; while (-1 != (length
		 * = is.read(buffer, 0, buffer.length))) { os.write(buffer); }
		 * os.close(); is.close();
		 */
		try {
			is = new FileInputStream(fileData);
			os = new FileOutputStream(new File(path, newFileName));
			// ��Ϊfile�Ǵ������ʱ�ļ��е��ļ������ǿ��Խ����ļ������ļ�·����ӡ����������֮ǰ��fileFileName�Ƿ���ͬ
			
			int i=0;
			//�����СΪ512�ֽ�
			byte[] buffer = new byte[512]; 
	        while(true) { 
	            if(is.available() < 512) { 
	                while(i != -1) { 
	                    i = is.read(); 
	                    if(i!=-1){
	                    	os.write(i); 
	                    }
	                } 
	                break;//ע��˴���������Ŷ 
	            } else { 
	                //���ļ��Ĵ�С����512�ֽ�ʱ 
	                is.read(buffer); 
	                os.write(buffer); 
	            } 
	        } 
		}
		/*
		 * catch (FileNotFoundException e) { e.printStackTrace();
		 * newFileName="-1"; }
		 */
		catch (IOException e) {
			e.printStackTrace();
			fullFileName = "-1";
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
				fullFileName = "-1";
			}
		}
		return fullFileName;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
